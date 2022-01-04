<?php

namespace App\Models\Core;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Email extends Model
{
    use HasFactory;

    protected $table = 'core.emails';

    protected $fillable = [
        'email',
        'main',
    ];

    public function emailable()
    {
        return $this->morphTo();
    }
}
