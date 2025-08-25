<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SavMessage extends Model
{
    protected $table = 'sav_messages';
    protected $fillable = [
        'ticket_id',
        'user_id',
        'sender_id',
        'is_internal',
        'subject',
        'message',
        'status'
    ];
}
