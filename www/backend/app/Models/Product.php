<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Product extends Model
{
    protected $table = 'products';
    protected $fillable = [
        'name',
        'description',
        'short_description',
        'image_url',
        'category_id',
        'brand',
        'stock',
        'min_stock',
        'weight',
        'sale_price',
        'daily_price',
        'available',
        'featured',
        'rented_out',
        'type',
        'free_shipping',
        'created_at',
        'updated_at',
    ];

    public function getCategoryAttribute() {
        return Category::where('id', $this->category_id)->pluck('name')->first();
    }

    public function getStockAttribute() {
        $originalStock = $this->attributes['stock'] ?? 0;

        $in = StockMovement::where('product_id', $this->id)
            ->where('type', 'in')
            ->sum('quantity');

        $out = StockMovement::where('product_id', $this->id)
            ->where('type', 'out')
            ->sum('quantity');

        // calculate purchase orders
        $order_ids = OrderItem::where('product_id', $this->id)->pluck('order_id')->toArray();
        $order_ids = Order::whereIn('id', $order_ids)->where('status', '!=', 'cancelled')
                            ->where('type', 'purchase')->pluck('id')->toArray();
        $out += OrderItem::whereIn('order_id', $order_ids)->where('product_id', $this->id)->sum('quantity');

        // calculate location orders
        $order_ids = OrderItem::where('product_id', $this->id)->pluck('order_id')->toArray();
        $order_ids_in = Order::whereIn('id', $order_ids)->where('status', '!=', 'cancelled')
                            ->where('type', 'location')->where('rental_end_date', '<', Carbon::now())
                            ->where('rental_recovery', 1)
                            ->pluck('id')->toArray();
        $order_ids_out = Order::whereIn('id', $order_ids)->where('status', '!=', 'cancelled')
                            ->where('type', 'location')->pluck('id')->toArray();
        $in += OrderItem::whereIn('order_id', $order_ids_in)->where('product_id', $this->id)->sum('quantity');
        $out += OrderItem::whereIn('order_id', $order_ids_out)->where('product_id', $this->id)->sum('quantity');

        $calculated = $originalStock + $in - $out;

        return max(0, $calculated);
    }

    protected $appends = ['category', 'stock'];
}