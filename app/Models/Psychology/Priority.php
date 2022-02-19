<?php

namespace App\Models\Psychology;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Auditable as Auditing;
use OwenIt\Auditing\Contracts\Auditable;

class Priority extends Model implements Auditable
{
    use HasFactory;
    use Auditing;

    protected $table = 'psychology.priorities';

    public function tests()
    {
        return $this->hasMany(Test::class);
    }
}
