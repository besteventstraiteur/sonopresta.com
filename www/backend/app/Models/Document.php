<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Document extends Model
{
    protected $table = 'documents';
    protected $fillable = [
        'id',
        'number',
        'type',
        'status',
        'content',
        'total_amount',
        'order_id',
        'template_id',
        'devis_request_id',
        'accepted_at',
        'paid_at',
        'sent_at',
        'due_date',
        'created_at',
        'updated_at',
    ];
}