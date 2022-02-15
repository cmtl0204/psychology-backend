<?php

namespace App\Models\Psychology;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    use HasFactory;

    protected $table = 'psychology.questions';

    public function answers(){
        return $this->hasMany(Answer::class);
    }
}




