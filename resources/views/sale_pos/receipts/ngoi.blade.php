<!doctype html>
<html dir="ltr" lang="en" class="no-js">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width" />

    <title>sprSimple Invoice</title>

    <style>
        .clip {
            -webkit-background-clip: padding-box;
            -moz-background-clip: padding;
            -o-background-clip: padding;
            background-clip: padding-box;
        }

        /* handy shortcuts */
        .clear {
            /* for use on :after */
            content: " ";
            display: block;
            height: 0;
            clear: both;
            visibility: hidden;
        }

        /* global color variables */
        /* global layout */
        body {
            font-size: 14px;
            margin: 0px;
            text-align: center;
            background: #ddd;
            color: #333;
            font-family: Helvetica, Arial, sans-serif;
            padding: 40px 0;
            line-height: 1.5em;
        }

        a {
            color: #333;
            text-decoration: underline;
        }

        strong {
            font-weight: bold;
        }

        em {
            font-style: italic;
        }

        h1 {
            font-size: 28px;
            font-weight: bold;
            padding: 20px 0 0px;
        }

        h2,
        h3,
        h4,
        h5,
        h6,
        .title {
            font-size: 16px;
            font-weight: bold;
            padding-bottom: 4px;
            margin-bottom: 4px;
            border-bottom: 1px solid #dddddd;
        }

        #invoice {
            position: relative;
            padding: 18px;
            max-width: 840px;
            margin: auto;
            background: #f5f5f5;
            border: 10px solid #fff;
            -webkit-box-shadow: 0 0 1px #888888;
            -moz-box-shadow: 0 0 1px #888888;
            -o-box-shadow: 0 0 1px #888888;
            box-shadow: 0 0 1px #888888;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        #invoice.unpaid:before,
        #invoice.paid:before {
            position: absolute;
            top: -20px;
            right: 0;
            left: 0;
            height: 10px;
            background: red;
            background: rgba(187, 0, 0, 0.8);
            content: "";
        }

        #invoice.paid:before {
            background: green;
            background: #6777ef;
        }

        .this-is {
            padding: 8px 0;
            font-size: 16px;
            font-weight: bold;
            border-top: 1px solid #dddddd;
            border-bottom: 1px solid #dddddd;
        }

        #header {
            padding-bottom: 20px;
        }

        .invoice-intro p {
            font-size: 12px;
            font-style: italic;
            line-height: 1.5em;
            padding-bottom: 20px;
        }

        .invoice-meta {
            position: relative;
            overflow: hidden;
            text-align: right;
            line-height: 1.5em;
        }

        .invoice-meta dt {
            float: left;
            width: 46%;
            clear: both;
            font-weight: bold;
        }

        .invoice-meta dd {
            width: 46%;
            float: right;
            text-align: left;
        }

        #parties {
            position: relative;
            overflow: hidden;
        }

        .invoice-to,
        .invoice-from,
        .invoice-status {
            text-align: left;
            padding-bottom: 30px;
        }

        .unpaid .invoice-status strong,
        .paid .invoice-status strong {
            font-weight: bold;
            color: #fff;
            display: block;
            padding: 8px;
            background: red;
            background: rgba(187, 0, 0, 0.8);
        }

        .paid .invoice-status strong {
            background: green;
            background: #6777ef;
        }

        .unpaid .invoice-pay ul {
            padding: 12px;
            border-right: 10px solid red;
            border-right: 10px solid rgba(187, 0, 0, 0.8);
        }

        .invoice-items,
        .invoice-totals {
            text-align: left;
            padding-bottom: 30px;
        }

        .invoice-items table,
        .invoice-totals table {
            width: 100%;
            font-size: 12px;
        }

        .invoice-items caption,
        .invoice-totals caption {
            font-size: 16px;
            font-weight: bold;
            padding-bottom: 4px;
            margin-bottom: 4px;
            border-bottom: 1px solid #dddddd;
            text-align: left;
        }

        .invoice-items thead th,
        .invoice-totals thead th {
            font-weight: bold;
            padding: 6px 0;
            background: #e5e5e5;
        }

        .invoice-items thead tc,
        .invoice-totals thead tc {
            text-align: center;
        }

        .invoice-items thead th:first-of-type,
        .invoice-totals thead th:first-of-type {
            padding-left: 8px;
        }

        .invoice-items thead th:last-of-type,
        .invoice-totals thead th:last-of-type {
            text-align: right;
            padding-right: 8px;
        }

        .invoice-items tbody tr th,
        .invoice-totals tbody tr th {
            padding-left: 8px;
        }

        .invoice-items tbody tr td:last-of-type,
        .invoice-totals tbody tr td:last-of-type {
            text-align: right;
            padding-right: 8px;
        }

        .invoice-items tbody tr:nth-of-type(even) th,
        .invoice-totals tbody tr:nth-of-type(even) th,
        .invoice-items tbody tr:nth-of-type(even) td,
        .invoice-totals tbody tr:nth-of-type(even) td {
            background: #eee;
        }

        .invoice-items tbody th,
        .invoice-totals tbody th,
        .invoice-items tbody td,
        .invoice-totals tbody td {
            padding-top: 6px;
            padding-bottom: 6px;
            background: #fff;
        }

        .invoice-items tbody td,
        .invoice-totals tbody td {
            text-align: center;
        }

        .invoice-items tfoot td,
        .invoice-totals tfoot td {
            text-align: right;
            font-size: 11px;
            font-weight: bold;
            background: #e5e5e5;
            padding: 6px 8px;
        }

        .invoice-pay {
            padding-top: 30px;
        }

        .invoice-pay li {
            overflow: hidden;
            padding-top: 12px;
        }

        .invoice-pay li:nth-of-type(even) {
            padding-top: 18px;
        }

        .invoice-pay .gcheckout {
            float: right;
            height: 32px;
            width: 117px;
            text-indent: -9999em;
            background-image: url(data:image/gif;base64,R0lGODlhdQAwAOZ/AIrQsD+G8Y+s28fa9i9lufHx8djl+HGk82qRz9pENjl85AaaWEKL+TV23fX19VaY+ujo6Eq1hfn5+aFLYIiIiDZtyb6+vj2C7a7Zvurq6kGI9Wie7zd54fjntPjMRtNvbFaFz6ampuzs7DFqwgqiXe2RP+7u7peXlw+oYjp+5+rw+TGpctS8due1sTh64pa79eTr9+fRxrfK6CZduPrx2bzT9ytkwzVz1J+33nvDn63K9jZxzZG07FyU7NQ+MbOzs8fk16rC5oKl2/WuS0yZQ7/S8PH1+zl520eF5pC39MSdK+Ll69pWTLfP9cihMLzfz0eP+kKK98yrT/X5/jd32eNkO9PZ4z2A6jh631SP6x9Vrzl84ea6OaHC9TBx2N7x6IOt7/z8/ECH80GJ9j6E7/7+/vv7+zt/6TyG9vnJQN9JPUqL7+qHb62bLzifUTmhUXyd1Ep3wH1Xhqu/3uB/djd11zFtzECI80SN+XyaOUOI9MfQ3+fn5zZ43////wAAACH/C1hNUCBEYXRhWE1QPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS4wLWMwNjEgNjQuMTQwOTQ5LCAyMDEwLzEyLzA3LTEwOjU3OjAxICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1wTU06T3JpZ2luYWxEb2N1bWVudElEPSJ4bXAuZGlkOkZDN0YxMTc0MDcyMDY4MTFBNzY4RkU5M0ZEREJEQkM4IiB4bXBNTTpEb2N1bWVu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);
        }

        .invoice-pay .acheckout {
            float: right;
            height: 38px;
            width: 173px;
            text-indent: -9999em;
            background-image: url(data:image/gif;base64,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);
        }

        .paid .invoice-pay ul li {
            display: none;
        }

        .paid .invoice-pay ul:after {
            display: block;
            font-weight: bold;
            color: #fff;
            padding: 8px;
            background: green;
            background: #6777ef;
            content: "Paid in Full";
            text-align: right;
        }

        .invoice-notes {
            text-align: left;
            padding-bottom: 30px;
        }

        .invoice-notes p,
        .invoice-notes ul,
        .invoice-notes ol,
        .invoice-notes dl {
            padding-bottom: 1em;
        }

        .invoice-notes ul li {
            list-style: inside disc;
        }

        .invoice-notes ol li {
            list-style: inside decimal;
        }

        #footer {
            border-top: 1px solid #dddddd;
            font-size: 11px;
            font-weight: bold;
        }

        /* some margin for middling sceens */
        @media only screen and (min-width: 420px) and (max-width: 869px) {
            #invoice {
                margin: 0 20px;
            }
        }

        /* layout splits at 600 css pixels */
        @media only screen and (min-width: 700px) {
            h1 {
                padding: 10px 0;
            }

            #header {
                overflow: hidden;
                padding-top: 40px;
            }

            .invoice-intro {
                float: left;
                width: 50%;
                text-align: left;
            }

            .invoice-intro p {
                text-align: left;
            }

            .invoice-meta {
                float: right;
                width: 40%;
            }

            .invoice-meta dd {
                text-align: right;
            }

            .invoice-to,
            .invoice-from,
            .invoice-status {
                float: left;
                width: 30%;
                margin-right: 5%;
            }

            .invoice-status {
                margin-right: 0;
            }

            #footer {
                padding-top: 18px;
                font-size: 12px;
            }
        }
    </style>
    <!-- js HTML class -->
    <script>
        (function(H) {
            H.className = H.className.replace(/\bno-js\b/, 'js')
        })(document.documentElement)
    </script>
</head>

<body>
    <!-- begin markup -->



    <div id="invoice" class="paid">


        <div class="this-is">
            <strong>Invoice</strong>
        </div><!-- invoice headline -->


        <header id="header">
            <div class="invoice-intro" style="display: flex; align-items:center;">

                @if(!empty($receipt_details->logo))
                <div class="text-box centered">
                    <img style="max-height: 100px; width: auto;" src="{{$receipt_details->logo}}" alt="Logo">
                </div>
                @endif
                <div>
                    <h1>The Romulan Empire</h1>
                    <p>Building a Better Tomorrow Through Your Destruction</p>
                </div>
            </div>

            <dl class="invoice-meta">
                <dt class="invoice-number">Invoice #</dt>
                <dd>{{$receipt_details->invoice_no}}</dd>
                <dt class="invoice-date">Date of Invoice</dt>
                <dd>{{$receipt_details->invoice_date}}</dd>
                @if(!empty($receipt_details->due_date_label))
                <dt class="invoice-due">{{$receipt_details->due_date_label}}</dt>
                <dd>{{$receipt_details->due_date ?? ''}}</dd>

                @endif

            </dl>
        </header>
        <!-- e: invoice header -->


        <section id="parties">

            <div class="invoice-from">
                <h2>Invoice From:</h2>
                <div id="hcard-Admiral-Valdore" class="vcard">
                    <p class="centered">
                        <!-- Header text -->
                        @if(!empty($receipt_details->header_text))
                        <span class="headings">{!! $receipt_details->header_text !!}</span>
                        <br />
                        @endif

                        <!-- business information here -->
                        @if(!empty($receipt_details->display_name))
                        <span class="headings">
                            {{$receipt_details->display_name}}
                        </span>
                        <br />
                        @endif

                        @if(!empty($receipt_details->address))
                        {!! $receipt_details->address !!}
                        <br />
                        @endif

                        @if(!empty($receipt_details->contact))
                        {!! $receipt_details->contact !!}
                        @endif
                        @if(!empty($receipt_details->contact) && !empty($receipt_details->website))
                        ,
                        @endif
                        @if(!empty($receipt_details->website))
                        {{ $receipt_details->website }}
                        @endif
                        @if(!empty($receipt_details->location_custom_fields))
                        <br>{{ $receipt_details->location_custom_fields }}
                        @endif

                        @if(!empty($receipt_details->sub_heading_line1))
                        {{ $receipt_details->sub_heading_line1 }}<br />
                        @endif
                        @if(!empty($receipt_details->sub_heading_line2))
                        {{ $receipt_details->sub_heading_line2 }}<br />
                        @endif
                        @if(!empty($receipt_details->sub_heading_line3))
                        {{ $receipt_details->sub_heading_line3 }}<br />
                        @endif
                        @if(!empty($receipt_details->sub_heading_line4))
                        {{ $receipt_details->sub_heading_line4 }}<br />
                        @endif
                        @if(!empty($receipt_details->sub_heading_line5))
                        {{ $receipt_details->sub_heading_line5 }}<br />
                        @endif

                        @if(!empty($receipt_details->tax_info1))
                        <br><b>{{ $receipt_details->tax_label1 }}</b> {{ $receipt_details->tax_info1 }}
                        @endif

                        @if(!empty($receipt_details->tax_info2))
                        <b>{{ $receipt_details->tax_label2 }}</b> {{ $receipt_details->tax_info2 }}
                        @endif

                        <!-- Title of receipt -->
                        @if(!empty($receipt_details->invoice_heading))
                        <br /><span class="sub-headings">{!! $receipt_details->invoice_heading !!}</span>
                        @endif
                    </p>
                </div><!-- e: vcard -->
            </div><!-- e invoice-from -->





            <div class="invoice-status">
                <h3>Invoice Status</h3>
                <strong>Invoice is <em>Paid</em></strong>
            </div><!-- e: invoice-status -->

        </section><!-- e: invoice partis -->


        <section class="invoice-financials">

            <div class="invoice-items">
                <table>
                    <caption>Your Invoice</caption>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>{{$receipt_details->table_product_label}}</th>
                            <th>HN</th>
                            <th>
                                {{$receipt_details->table_qty_label}}
                            </th>
                            @if(empty($receipt_details->hide_price))
                            <th>
                                {{$receipt_details->table_unit_price_label}}
                            </th>
                            @if(!empty($receipt_details->item_discount_label))
                            <th>{{$receipt_details->item_discount_label}}</th>
                            @endif
                            <th>{{$receipt_details->table_subtotal_label}}</th>
                            @endif

                        </tr>
                    </thead>
                    <tbody>
                        @forelse($receipt_details->lines as $line)
                        <tr>
                            <td>
                                {{$loop->iteration}}
                            </td>
                            <td class="description">
                                {{$line['name']}} {{$line['product_variation']}} {{$line['variation']}}
                                @if(!empty($line['sub_sku'])), {{$line['sub_sku']}} @endif @if(!empty($line['brand'])),
                                {{$line['brand']}} @endif @if(!empty($line['cat_code'])), {{$line['cat_code']}}@endif
                                @if(!empty($line['product_custom_fields'])), {{$line['product_custom_fields']}} @endif
                                @if(!empty($line['sell_line_note']))
                                <br>
                                <span class="f-8">
                                    {{$line['sell_line_note']}}
                                </span>
                                @endif
                                @if(!empty($line['lot_number']))<br> {{$line['lot_number_label']}}:
                                {{$line['lot_number']}} @endif
                                @if(!empty($line['product_expiry'])), {{$line['product_expiry_label']}}:
                                {{$line['product_expiry']}} @endif
                                @if(!empty($line['warranty_name']))
                                <br>
                                <small>
                                    {{$line['warranty_name']}}
                                </small>
                                @endif
                                @if(!empty($line['warranty_exp_date']))
                                <small>
                                    - {{@format_date($line['warranty_exp_date'])}}
                                </small>
                                @endif
                                @if(!empty($line['warranty_description']))
                                <small> {{$line['warranty_description'] ?? ''}}</small>
                                @endif
                            </td>
                            <td class="quantity text-right">{{$line['cat_code']}}</td>
                            <td class="quantity text-right">{{$line['quantity']}} {{$line['units']}}</td>
                            @if(empty($receipt_details->hide_price))
                            <td class="unit_price text-right">{{$line['unit_price_before_discount']}}</td>
                            @if(!empty($receipt_details->item_discount_label))
                            <td class="text-right">
                                {{$line['line_discount'] ?? '0.00'}}
                            </td>
                            @endif
                            <td class="price text-right">{{$line['line_total']}}</td>
                            @endif
                        </tr>
                        @if(!empty($line['modifiers']))
                        @foreach($line['modifiers'] as $modifier)
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                {{$modifier['name']}} {{$modifier['variation']}}
                                @if(!empty($modifier['sub_sku'])), {{$modifier['sub_sku']}} @endif
                                @if(!empty($modifier['cat_code'])), {{$modifier['cat_code']}}@endif
                                @if(!empty($modifier['sell_line_note']))({{$modifier['sell_line_note']}}) @endif
                            </td>
                            <td class="text-right">{{$modifier['quantity']}} {{$modifier['units']}} </td>
                            @if(empty($receipt_details->hide_price))
                            <td class="text-right">{{$modifier['unit_price_inc_tax']}}</td>
                            @if(!empty($receipt_details->item_discount_label))
                            <td class="text-right">0.00</td>
                            @endif
                            <td class="text-right">{{$modifier['line_total']}}</td>
                            @endif
                        </tr>
                        @endforeach
                        @endif
                        @endforeach
                        <tr>
                            <td @if(!empty($receipt_details->item_discount_label)) colspan="6" @else colspan="5"
                                @endif>&nbsp;</td>
                        </tr>
                    </tbody>

                </table>
            </div><!-- e: invoice items -->


            <div class="invoice-totals">
                <table>
                    @if(!empty($receipt_details->total_quantity_label))
                    <div class="flex-box">
                        <p class="left text-right">
                            {!! $receipt_details->total_quantity_label !!}
                        </p>
                        <p class="width-50 text-right">
                            {{$receipt_details->total_quantity}}
                        </p>
                    </div>
                    @endif
                    <caption>Totals:</caption>
                    <tbody>
                        <tr>
                            <th>Subtotal:</th>
                            <td></td>
                            <td>$103,850</td>
                        </tr>
                        <tr>
                            <th>Tax:</th>
                            <td>5%</td>
                            <td>$5,192</td>
                        </tr>
                        <tr>
                            <th>Total:</th>
                            <td></td>
                            <td>$109,042</td>
                        </tr>
                    </tbody>
                </table>

                <div class="invoice-pay">
                    @if(!empty($receipt_details->sales_person_label))
                    <h5>{{$receipt_details->sales_person_label}} {{$receipt_details->sales_person}}</h5>

                    @endif

                </div>
            </div><!-- e: invoice totals -->


        </section><!-- e: invoice financials -->


        <footer id="footer">

        </footer>


    </div><!-- e: invoice -->


</body>

</html>