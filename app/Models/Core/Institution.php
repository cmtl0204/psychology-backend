<?php

namespace App\Models\Core;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Institution extends Model
{
    use HasFactory;

    protected $table = 'core.Institutions';

    protected $fillable = [
        'acronym',
        'code',
        'denomination',
        'email',
        'logo',
        'name',
        'phone',
        'short_name',
        'slogan',
        'web',
    ];

    public function address()
    {
        return $this->belongsTo(Address::class);
    }

    public function careers()
    {
        return $this->hasMany(Career::class);
    }
}
