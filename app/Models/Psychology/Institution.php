<?php

namespace App\Models\Psychology;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Institution extends Model
{
    use HasFactory;

    protected $table = 'psychology.institutions';

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

     public function tests(){
         return $this->belongsToMany(Test::class);
     }
}
