<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable; // ✅ important
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $fillable = [
        'name',
        'email',
        'phone',
        'role',
        'password',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    public function metas()
    {
        return $this->hasMany(UserMeta::class, 'user_id');
    }

    public function orders()
    {
        return $this->hasMany(Order::class, 'customer_id');
    }


    protected static function booted()
    {
        static::deleting(function ($user) {
            $user->metas()->delete();
            $user->orders()->delete();
        });
    }
}
