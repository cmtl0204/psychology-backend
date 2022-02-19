<?php

namespace App\Models\Psychology;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Auditable as Auditing;
use OwenIt\Auditing\Contracts\Auditable;

class Answer extends Model implements Auditable
{
    use HasFactory;
    use Auditing;

    protected $table = 'psychology.answers';

    public function question()
    {
        return $this->belongsTo(Question::class);
    }

    public function parentTest(){
        return $this->belongsTo(Test::class);
    }


}





