<?php

namespace App\Models\Psychology;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Assignment extends Model
{
    use HasFactory;

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
