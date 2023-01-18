<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\MpesaSetting;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon;
use Exception;
use Illuminate\Support\Facades\Http;
use App\Http\Transaction;
use App\MpesaPayment;
use App\MpesaTransaction;
use App\User;

class MpesaController extends Controller
{
    public function index()
    {
        $mpesa_settings = MpesaSetting::first();

        return view('mpesa.index', compact('mpesa_settings'));
    }
    public function getPassword()
    {
        $settings = MpesaSetting::first();
        $mpesa_env = $settings->mpesa_env;
        if ($mpesa_env =='sandbox') {
            $mpesa_passkey = $settings->mpesa_testpasskey;
            $mpesa_shortcode = $settings->mpesa_testshortcode;
        }
        if ($mpesa_env =='live') {
            $mpesa_passkey = $settings->mpesa_passkey;
            $mpesa_shortcode = $settings->mpesa_shortcode;
        }
        $timestamp = Carbon::rawParse('now')-> format('YmdHms'); //Helps us get current date and time
        $password = base64_encode($mpesa_shortcode.$mpesa_passkey.$timestamp);
        return $password;
    }
    public function completeTransaction(Request $request)
    {
        $transaction = MpesaTransaction::find($request->transaction_id);
        if ($transaction) {
            $transaction->status = 1;
            $transaction->save();
            return response()->json(['status' => 'success', 'message' => 'Transaction Completed Successfully']);
        } else {
            return response()->json(['status' => 'error', 'message' => 'Transaction Not Found']);
        }
    }
    public function getMpesaTransactions(Request $request)
    {
        $phone = $request->phone;  //We use request to get the phone number that the user inputs for the form.
        $phone = (substr($phone, 0, 1) == "+") ? str_replace("+", "", $phone) : $phone;
        $phone = (substr($phone, 0, 1) == "0") ? preg_replace("/^0/", "254", $phone) : $phone;
        $phone = (substr($phone, 0, 1) == "7") ? "254{$phone}" : $phone;
        $cash = $request->cash;
        $u_amount = str_replace(',', '', $request->amount);
        $amount = explode('.', $u_amount);
        $formarted_amount = $amount[0];

        if ($cash >= $formarted_amount) {
            return response()->json(['status'=>'error','message'=>'Cash amount cannot be greater than the total amount']);
        }
        $total_amount = (integer)$formarted_amount - (integer)$cash;


        try {
            // $latest_transaction = MpesaTransaction::where('cashier_id', $request->user_id)->first();
            // $MerchantRequestID = $latest_transaction->MerchantRequestID;
            // $CheckoutRequestID = $latest_transaction->CheckoutRequestID;

            $mpesa_transactions = MpesaTransaction::where('cashier_id', $request->user_id)->where('phone', $phone)->where('total_amount', $total_amount)->latest()->first();
            if ($mpesa_transactions && $mpesa_transactions->status == 3) {
                return response()->json(['status' => 'success', 'message' => 'Payment received. Finalizing processing...', 'data' => $mpesa_transactions]);
            } else {
                return response()->json(['status' => 'error', 'message' => 'Transaction not found']);
            }
        } catch (\Throwable $th) {
            //throw $th;
            return response()->json(['status'=>'error','message'=>$th->getMessage()]);
        }
    }

    public function cancelTransaction(Request $request)
    {
        $phone = $request->phone;  //We use request to get the phone number that the user inputs for the form.
        $phone = (substr($phone, 0, 1) == "+") ? str_replace("+", "", $phone) : $phone;
        $phone = (substr($phone, 0, 1) == "0") ? preg_replace("/^0/", "254", $phone) : $phone;
        $phone = (substr($phone, 0, 1) == "7") ? "254{$phone}" : $phone;
        $cash = $request->cash;
        $u_amount = str_replace(',', '', $request->amount);
        $amount = explode('.', $u_amount);
        $formarted_amount = $amount[0];

        if ($cash >= $formarted_amount) {
            return response()->json(['status'=>'error','message'=>'Cash amount cannot be greater than the total amount']);
        }
        $total_amount = (integer)$formarted_amount - (integer)$cash;

        try {
            //  $latest_transaction = MpesaTransaction::where('cashier_id', $request->user_id)->first();
            // $MerchantRequestID = $latest_transaction->MerchantRequestID;
            // $CheckoutRequestID = $latest_transaction->CheckoutRequestID;

            $mpesa_transaction = MpesaTransaction::where('cashier_id', $request->user_id)->where('phone', $phone)->where('total_amount', $total_amount)->latest()->first();
            if ($mpesa_transaction && $mpesa_transaction->status == 0) {
                $mpesa_transaction->status =2;
                $mpesa_transaction->save();
                return response()->json(['status' => 'success', 'message' => 'Transaction has been cancelled...', 'data' => $mpesa_transaction]);
            } else {
                return response()->json(['status' => 'error', 'message' => 'Something went wrong']);
            }
        } catch (\Throwable $th) {
            //throw $th;
            return response()->json(['status'=>'error','message'=>$th->getMessage()]);
        }
    }

    public function generateAccessToken()
    {
        $settings = MpesaSetting::first();

        $mpesa_consumerkey= null;
        $mpesa_consumersecret= null;
        $url = null;
        $mpesa_env = $settings->mpesa_env;

        if ($mpesa_env ==null) {
            return false;
        }
        if ($mpesa_env =='sandbox') {
            $mpesa_consumerkey= $settings->mpesa_testconsumerkey;
            $mpesa_consumersecret = $settings->mpesa_testconsumersecret;
            $url = "https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials";
        }
        if ($mpesa_env =='live') {
            $mpesa_consumerkey = $settings->mpesa_consumerkey;

            $mpesa_consumersecret = $settings->mpesa_consumersecret;

            $url = "https://api.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials";
        }

        $credentials = base64_encode($mpesa_consumerkey.":".$mpesa_consumersecret);
        
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_HTTPHEADER, array("Authorization: Basic ".$credentials));
        curl_setopt($curl, CURLOPT_HEADER, false);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

        $curl_response = curl_exec($curl);
        $access_token=json_decode($curl_response);
        $data = [
            'env'=>$mpesa_env,
            'consumer key'=>$mpesa_consumerkey,
            'consumer secret'=>$mpesa_consumersecret,
            'access token'=>$access_token
        ];
        if ($access_token == null) {
            $message = 'Something went wrong, please check your credentials';
            return response()->json(['status'=>'error', 'message'=>$message]);
        }
        // dd($data);
        return $access_token->access_token;
    }

    
    /** Lipa na M-PESA STK Push method **/
    public function stkPushRequest(Request $request)
    {
        $settings = MpesaSetting::first();

        if (!$request->amount) {
            return response()->json(['status'=>'error','message'=>'Amount is required']);
        } elseif (!$request->phone) {
            return response()->json(['status'=>'error','message'=>'Phone number is required']);
        }
        $cash = $request->cash;
        \Log(json_encode($request->all()));
        $u_amount = str_replace(',', '', $request->amount);
        $amount = explode('.', $u_amount);
        $formarted_amount = $amount[0];

        if ($cash >= $formarted_amount) {
            return response()->json(['status'=>'error','message'=>'Cash amount cannot be greater than the total amount']);
        }
        
        $total_amount = (integer)$formarted_amount - (integer)$cash;

        // $formarted_amount =1;
        $phone = $request->phone;  //We use request to get the phone number that the user inputs for the form.
        $phone = (substr($phone, 0, 1) == "+") ? str_replace("+", "", $phone) : $phone;
        $phone = (substr($phone, 0, 1) == "0") ? preg_replace("/^0/", "254", $phone) : $phone;
        $phone = (substr($phone, 0, 1) == "7") ? "254{$phone}" : $phone;
        $transac = MpesaTransaction::where('phone', $phone)
                                    ->where('cashier_id', $request->user_id)
                                    ->where('status', 0)
                                    ->where('total_amount', $total_amount)
                                    ->first();
        if ($transac) {
            $transac->status = 2;//cancel transaction
            $transac->save();
        }

        $data = [
                'cashier_id'=>$request->user_id,
                'phone'=>$phone,
                'total_amount'=>$total_amount
                ];
        

        $mpesa_transaction = MpesaTransaction::create($data);
        
        $url ='https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest';
        $mpesa_shortcode = null;
        if ($settings->mpesa_env == 'live') {
            $url ='https://api.safaricom.co.ke/mpesa/stkpush/v1/processrequest';
        }
        if ($settings->mpesa_env == 'sandbox') {
            $mpesa_shortcode = $settings->mpesa_testshortcode;
        }
        if ($settings->mpesa_env == 'live') {
            $mpesa_shortcode = $settings->mpesa_shortcode;
        }

        try {
            //code...
            $curl = curl_init();
            if ($curl === false) {
                throw new Exception('failed to initialize');
            }
            curl_setopt($curl, CURLOPT_URL, $url);
            curl_setopt($curl, CURLOPT_HTTPHEADER, array('Content-Type:application/json','Authorization:Bearer '.$this->generateAccessToken()));
            $curl_post_data = [
                //Use valid values for the parameters below
                'BusinessShortCode' => $mpesa_shortcode,
                'Password' => $this->getPassword(),
                'Timestamp' => Carbon::rawParse('now')->format('YmdHms'),
                'TransactionType' => "CustomerBuyGoodsOnline",
                'Amount' => $total_amount,
                'PartyA' => $phone,
                'PartyB' => 165962,
                'PhoneNumber' => $phone,
                'CallBackURL' => 'https://ngoism.codingexpat.com/api/v1/mpesa/response',
                // https://ngoism.codingexpat.com/api/v1/mpesa/response
               // https://login.secure.access.ngoisupermarkets.com/
                'AccountReference' => "NGOI SUPERMARKET",
                'TransactionDesc' => "Registration Fees Payment"
            ];
            $data_string = json_encode($curl_post_data);
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($curl, CURLOPT_POST, true);
            curl_setopt($curl, CURLOPT_POSTFIELDS, $data_string);
            $curl_response = curl_exec($curl);
        
            if ($curl_response === false) {
                throw new Exception(curl_error($curl), curl_errno($curl));
            }
            \Log::info($curl_response);

            $decoded_res = json_decode($curl_response);
            $mpesa_transaction->MerchantRequestID = $decoded_res->MerchantRequestID;
            $mpesa_transaction->CheckoutRequestID = $decoded_res->CheckoutRequestID;
            $mpesa_transaction->save();
            
            
            if ($decoded_res->ResponseDescription && $decoded_res->ResponseDescription == 'Success. Request accepted for processing') {
                $message = 'Thank you! A popup has been sent to the customer\'s phone, ask the customer to enter M-PESA pin to authorize the transaction.';

                return response()->json(['status'=>'success', 'message' => $message]);
            } else {
                $message = 'Something went wrong! please try again';
                return response()->json(['status'=>'error', 'message' => $message]);
            }
        } catch (\Exception $e) {
            $response = ['status'=>'error','message'=>$e->getMessage(), 'error_code'=>$e->getCode()];
            return response()->json($response);
        } finally {
            // Close curl handle unless it failed to initialize
            if (is_resource($curl)) {
                curl_close($curl);
            }
        }
    }

    public function processPayment(Request $request)
    {
        $response = json_decode($request->getContent());
        \Log::info(json_encode($response));
        $mpesa_response = json_encode($response);
        $resCode =$response->Body->stkCallback->ResultCode;
        $message =$response->Body->stkCallback->ResultDesc;
        $MerchantRequestID =$response->Body->stkCallback->MerchantRequestID;
        $CheckoutRequestID =$response->Body->stkCallback->CheckoutRequestID;
        $resData = [];
        $data = [];
        if ($resCode == 0) {
            $resData = $response->Body->stkCallback->CallbackMetadata;
            $resData =  $response->Body->stkCallback->CallbackMetadata;
            $amountPaid = $resData->Item[0]->Value;
            $mpesaTransactionId = $resData->Item[1]->Value;
            $paymentPhoneNumber =$resData->Item[4]->Value;
            $data = [
            'phone'=>$paymentPhoneNumber,
            'receipt_no'=>$mpesaTransactionId,
            'amount'=>$amountPaid,
            'mpesa_response'=>$mpesa_response
        ];
            if (!empty($data)) {
                $payment = MpesaPayment::create($data);
                //change status, send message
                $transaction = MpesaTransaction::where('phone', $paymentPhoneNumber)
                                    ->where('status', 0)
                                    ->where('total_amount', $amountPaid)
                                    ->where('CheckoutRequestID', $CheckoutRequestID)
                                    ->where('MerchantRequestID', $MerchantRequestID)
                                    ->first();
                if ($transaction) {
                    $transaction->status =3;
                    $transaction->payment_id = $payment->id;
                    $transaction->save();
                //send a message
                } else {
                    return false;
                }
            }
        } else {
            \Log::info('something went wrong:', $resCode, $message);
        }
    }
    
 
    public function updateMpesaSettings(Request $request)
    {
        $request->validate(
            [
                'mpesa_env'=>'required',
            ]
        );
        if ($request->env == 'sandbox') {
            $request->validate(
                [
                'mpesa_testshortcode'=>'required',
                'mpesa_testpasskey'=>'required',
                'mpesa_testconsumersecret'=>'required',
                'mpesa_callbackurl'=>'required',
                'mpesa_testconsumerkey'=>'required',
                'mpesa_testamount'=>'required'
            
            ]
            );
        }
        if ($request->env == 'live') {
            $request->validate(
                [
                'mpesa_shortcode'=>'required',
                'mpesa_passkey'=>'required',
                'mpesa_consumersecret'=>'required',
                'mpesa_callbackurl'=>'required',
                'mpesa_consumerkey'=>'required',
                'mpesa_amount'=>'required'
            
            ]
            );
        }

        $settings_exists = MpesaSetting::first();
        if ($settings_exists) {
            $settings_exists->update($request->all());
            $output = ['success' => true,
                            'msg' => __("Successfully Updated")
                            ];
            return back()->with($output);
        } else {
            MpesaSetting::create($request->all());
            $output = ['success' => true,
                            'msg' => __("Successfully Updated")
                            ];
                           

            return back()->with($output);
        }
    }
}
