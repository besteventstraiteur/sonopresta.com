<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SavTicket extends Model
{
    protected $table = 'sav_tickets';
    protected $fillable = [
        'title',
        'status',
        'product_id',
        'order_id',
        'customer_id',
        'description',
        'priority',
        'assigned_to',
        'closed_at'
    ];

    public function getMessagesAttribute()
    {
        return SavMessage::where('ticket_id', $this->id)->orderBy('id', 'desc')->get();
    }

    public function getCustomerNameAttribute()
    {
        return User::where('id', $this->customer_id)->pluck('name')->first();
    }

    public function getCustomerPhoneAttribute()
    {
        $phone = User::where('id', $this->customer_id)->pluck('phone')->first();
        if($phone){
            return $phone;
        }else{
            return null;
        }
    }

    protected $appends = ['messages', 'customer_name', 'customer_phone'];
}
