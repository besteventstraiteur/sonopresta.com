<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Brochure extends Model
{
    protected $table = 'brochures';
    protected $fillable = [
        'id',
        'title',
        'description',
        'icon',
        'file_path',
        'service',
        'created_at',
        'updated_at',
    ];
}