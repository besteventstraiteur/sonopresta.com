<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Coupon extends Model
{
    protected $table = 'coupons';
    protected $fillable = [
        'code',
        'type',
        'product_id',
        'discount_type',
        'discount',
        'expiry',
        'usage_limit'
    ];

    public function getStatusAttribute()
    {
        if($this->expiry < date('Y-m-d')){
            return 'expired';
        }else{
            return 'active';
        }
    }

    public function getUsedAttribute()
    {
        return Order::where('coupon', $this->code)->count();
    }

    protected $appends = ['status', 'used']; 
}
