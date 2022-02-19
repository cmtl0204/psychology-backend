<?php

namespace App\Models\Psychology;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Auditable as Auditing;
use OwenIt\Auditing\Contracts\Auditable;

class Institution extends Model implements Auditable
{
    use HasFactory;
    use Auditing;

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
