<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $table = 'orders';
    protected $fillable = [
        'customer_id',
        'delivery_address',
        'notes',
        'order_number',
        'payment_status',
        'coupon',
        'discount',
        'phone_number',
        'rental_end_date',
        'rental_start_date',
        'rental_recovery',
        'status',
        'total_amount',
        'type',
        'created_at',
        'updated_at',
    ];

    public function items()
    {
        return $this->hasMany(OrderItem::class, 'order_id');
    }

    public function details()
    {
        return $this->hasMany(OrderDetail::class, 'order_id');
    }

    protected static function booted()
    {
        static::deleting(function ($order) {
            $order->items()->delete();
            $order->details()->delete();
        });
    }

    public function getShippingChargesAttribute()
    {
        $shipping = OrderDetail::where([['order_id', $this->id], ['meta_key', 'delivery_charges_details']])->pluck('meta_value')->first();
        if($shipping){
            $shipping = json_decode($shipping, true);
            if(isset($shipping['price'])){
                return $shipping['price'];
            }else{
                return 0;
            }
        }else{
            return 0;
        }
    }

    public function getAddressAttribute()
    {
        $address = OrderDetail::where([['order_id', $this->id], ['meta_key', 'shipping_details']])->pluck('meta_value')->first();
        if($address){
            $address = json_decode($address, true);
            $address = $address['address'];
            if($address['line1']){
                if($address['line2']){
                    $line = $address['line1'].' '.$address['line2'];
                }else{
                    $line = $address['line1'];
                }
                return $line.', '.$address['postal_code'].', '.$address['city'].', '.$address['country'];
            }else{
                return '';
            }
        }else{
            return '';
        }
    }

    public function getOrderItemsAttribute()
    {
        return OrderItem::where('order_id', $this->id)->get();
    }

    public function getOrderDetailsAttribute()
    {
        return OrderDetail::where('order_id', $this->id)->pluck('meta_value', 'meta_key');
    }

    public function getCustomerEmailAttribute()
    {
        return User::where('id', $this->customer_id)->pluck('email')->first();
    }

    protected $appends = ['customer_email', 'shipping_charges', 'address', 'order_items', 'order_details'];
}