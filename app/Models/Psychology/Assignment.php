<?php

namespace App\Models\Psychology;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Assignment extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'psychology.assignments';

    protected $casts = [
        'observations' => 'array'
    ];

    public function institution()
    {
        return $this->belongsTo(Institution::class);
    }

    public function test()
    {
        return $this->belongsTo(Test::class);
    }
}
