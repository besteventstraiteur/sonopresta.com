<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class StockMovement extends Model
{
    protected $table = 'stock_movements';
    protected $fillable = [
        'product_id',
        'quantity',
        'type',
        'reason',
        'notes',
        'created_by'
    ];

    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }
}
