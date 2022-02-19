<?php

namespace App\Models\Psychology;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Auditable as Auditing;
use OwenIt\Auditing\Contracts\Auditable;

class Result extends Model implements Auditable
{
    use HasFactory;
    use Auditing;

    protected $table = 'psychology.results';

    public function answer(){
        return $this->belongsTo(Answer::class);
    }

    public function question(){
        return $this->belongsTo(Question::class);
    }

    public function test(){
        return $this->belongsTo(Test::class);
    }
}
