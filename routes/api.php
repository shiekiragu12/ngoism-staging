<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post('v1/stk/push', 'MpesaController@stkPushRequest');
Route::post('v1/access/token', 'MpesaController@generateAccessToken');
Route::post('v1/mpesa/response', 'MpesaController@processPayment');
Route::post('v1/mpesa/transactions', 'MpesaController@getMpesaTransactions');
Route::post('v1/mpesa/transaction/cancel', 'MpesaController@cancelTransaction');
Route::post('v1/mpesa/transaction/complete', 'MpesaController@completeTransaction');


