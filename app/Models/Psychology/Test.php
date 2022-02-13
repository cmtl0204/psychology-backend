<?php

namespace App\Models\Psychology;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Test extends Model
{
    use HasFactory;

    public function questions()
    {
        return $this->hasMany(Question::class);
    }

    public function answers()
    {
        return $this->hasMany(Answer::class);
    }

    //Calcula la nota obtenida por el test
    public function grade()
    {

    }

    //Tiene las reglas de negocio para definir la prioridad de atencion
    public function setPriority()
}


