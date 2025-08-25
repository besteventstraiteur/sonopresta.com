<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SavAttachment extends Model
{
    protected $table = 'sav_attachments';
    protected $fillable = [
        'ticket_id',
        'file_name',
        'file_path',
        'file_type'
    ];
}
