<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CustomerNote extends Model
{
    protected $table = 'customer_notes';
    protected $fillable = [
        'user_id',
        'created_by',
        'content'
    ];
}
