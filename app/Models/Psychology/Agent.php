<?php

namespace App\Models\Psychology;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Auditable as Auditing;
use OwenIt\Auditing\Contracts\Auditable;

class Agent extends Model implements Auditable
{
    use HasFactory;
    use Auditing;

    protected $table = 'psychology.agents';

    protected $fillable = [
        'name',
        'lastname',
    ];

    public function test()
    {
        return $this->belongsTo(Test::class);
    }

    public function setNameAttribute($value)
    {
        $this->attributes['name'] = trim(strtoupper($value));
    }

    public function setLastnameAttribute($value)
    {
        $this->attributes['lastname'] = trim(strtoupper($value));
    }

    public function getNameAttribute($value)
    {
        return strtoupper($value);
    }

    public function getLastnameAttribute($value)
    {
        return strtoupper($value);
    }
}
