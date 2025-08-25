<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Blog extends Model
{
    protected $table = 'blogs';
    protected $fillable = [
        'title',
        'slug',
        'short_description',
        'content',
        'author',
        'image_url',
        'status'
    ];
}
