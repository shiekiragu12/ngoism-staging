<?php

namespace App\Http;
use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    protected $fillable = ['status',
                            'user_id',
                            'phone',
                            'total_amount',
                            ];
}
