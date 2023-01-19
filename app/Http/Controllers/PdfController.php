<?php

namespace App\Http\Controllers;

use App\BusinessLocation;
use App\Transaction;
use Illuminate\Http\Request;
use File;
use App\Utils\BusinessUtil;
use App\Utils\CashRegisterUtil;
use App\Utils\ContactUtil;
use App\Utils\ModuleUtil;
use App\Utils\NotificationUtil;
use App\Utils\ProductUtil;
use App\Utils\TransactionUtil;
use Illuminate\Http\Response;
use PDF;

class PdfController extends Controller
{
    /**
     * All Utils instance.
     *
     */
    protected $contactUtil;
    protected $productUtil;
    protected $businessUtil;
    protected $transactionUtil;
    protected $cashRegisterUtil;
    protected $moduleUtil;
    protected $notificationUtil;

    /**
     * Constructor
     *
     * @param ProductUtils $product
     * @return void
     */
    public function __construct(
        ContactUtil $contactUtil,
        ProductUtil $productUtil,
        BusinessUtil $businessUtil,
        TransactionUtil $transactionUtil,
        CashRegisterUtil $cashRegisterUtil,
        ModuleUtil $moduleUtil,
        NotificationUtil $notificationUtil
    ) {
        $this->contactUtil = $contactUtil;
        $this->productUtil = $productUtil;
        $this->businessUtil = $businessUtil;
        $this->transactionUtil = $transactionUtil;
        $this->cashRegisterUtil = $cashRegisterUtil;
        $this->moduleUtil = $moduleUtil;
        $this->notificationUtil = $notificationUtil;

        $this->dummyPaymentLine = [
            'method' => 'cash', 'amount' => 0, 'note' => '', 'card_transaction_number' => '', 'card_number' => '', 'card_type' => '', 'card_holder_name' => '', 'card_month' => '', 'card_year' => '', 'card_security' => '', 'cheque_number' => '', 'bank_account_number' => '',
            'is_return' => 0, 'transaction_no' => '', 'phone_number', 'total_amount'
        ];
    }
    public function index(Request $request, $randomStr)
    {
        \Log::info('Request hit this URL: ' . $request->fullUrl());
        $transaction = Transaction::where('contact_id', auth()->id())->latest()->first();
        $invoice_layout_id = $transaction->is_direct_sale ? $transaction->location->sale_invoice_layout_id : null;

        $receipt = $this->receiptContent($transaction->business_id, $transaction->location_id, $transaction->id, 'browser', false, true, $invoice_layout_id);
        $pos_settings = empty($transaction->business->pos_settings) ? $this->businessUtil->defaultPosSettings() : json_decode($transaction->business->pos_settings, true);
        $payment_link = '';
        if (!empty($pos_settings['enable_payment_link']) && $transaction->payment_status != 'paid') {
            $payment_link = $this->transactionUtil->getInvoicePaymentLink($transaction->id, $transaction->business_id);
        }

        $title = $transaction->business->name . ' | ' . $transaction->invoice_no;

        // // // dd($receipt);
        // return view('sale_pos.partials.load-invoice-pdf')
        //         ->with(compact('receipt', 'title', 'payment_link'));

        $pdf = PDF::loadView('sale_pos.partials.load-invoice-pdf', compact('receipt', 'title', 'payment_link'));
        $output = $pdf->output();
        $filename = $transaction->invoice_no . '.pdf';
        return new Response($output, 200, [
            'Content-Type' => 'application/pdf',
            'Content-Disposition' =>  'inline; filename="'.$filename.'"',
        ]);
    }

    private function receiptContent(
        $business_id,
        $location_id,
        $transaction_id,
        $printer_type = null,
        $is_package_slip = false,
        $from_pos_screen = true,
        $invoice_layout_id = null
    ) {
        $output = [
            'is_enabled' => false,
            'print_type' => 'browser',
            'html_content' => null,
            'printer_config' => [],
            'data' => []
        ];


        $business_details = $this->businessUtil->getDetails($business_id);
        $location_details = BusinessLocation::find($location_id);


        if ($from_pos_screen && $location_details->print_receipt_on_invoice != 1) {
            return $output;
        }
        //Check if printing of invoice is enabled or not.
        //If enabled, get print type.
        $output['is_enabled'] = true;

        $invoice_layout_id = !empty($invoice_layout_id) ? $invoice_layout_id : $location_details->invoice_layout_id;
        $invoice_layout = $this->businessUtil->invoiceLayout($business_id, $location_id, $invoice_layout_id);

        //Check if printer setting is provided.
        $receipt_printer_type = is_null($printer_type) ? $location_details->receipt_printer_type : $printer_type;

        $receipt_details = $this->transactionUtil->getReceiptDetails($transaction_id, $location_id, $invoice_layout, $business_details, $location_details, $receipt_printer_type);

        $currency_details = [
            'symbol' => $business_details->currency_symbol,
            'thousand_separator' => $business_details->thousand_separator,
            'decimal_separator' => $business_details->decimal_separator,
        ];
        $receipt_details->currency = $currency_details;

        if ($is_package_slip) {
            $output['html_content'] = view('sale_pos.receipts.packing_slip', compact('receipt_details'))->render();
            return $output;
        }

        $output['print_title'] = $receipt_details->invoice_no;
        //If print type browser - return the content, printer - return printer config data, and invoice format config
        if ($receipt_printer_type == 'printer') {
            $output['print_type'] = 'printer';
            $output['printer_config'] = $this->businessUtil->printerConfig($business_id, $location_details->printer_id);
            $output['data'] = $receipt_details;
        } else {
            $layout = !empty($receipt_details->design) ? 'sale_pos.receipts.' . $receipt_details->design : 'sale_pos.receipts.slim';
            // dd($receipt_details);
            $output['html_content'] = view($layout, compact('receipt_details'))->render();
        }

        return $output;
    }
}
