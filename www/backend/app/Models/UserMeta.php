<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class UserMeta extends Model
{
    use HasFactory;
    protected $table = 'users_meta';    
    protected $fillable = [
        'user_id',
        'meta_key',
        'meta_value'
    ];
}
