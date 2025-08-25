<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DevisRequest extends Model
{
    protected $table = 'devis_requests';
    protected $fillable = [
        'name',
        'email',
        'telephone',
        'type_event',
        'type_prestation',
        'date_event',
        'number_people',
        'location',
        'comment',
        'accept_cgv',
    ];
}