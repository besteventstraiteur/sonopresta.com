<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OrderItem extends Model
{
    protected $table = 'order_items';
    protected $fillable = [
        'order_id',
        'product_id',
        'quantity',
        'unit_price',
        'subtotal',
        'discount',
        'created_at',
        'updated_at'
    ];

    public function getProductDetailsAttribute()
    {
        return Product::where('id', $this->product_id)->first();
    }

    protected $appends = ['product_details'];
}