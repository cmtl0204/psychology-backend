<?php

namespace App\Http\Requests\V1\Cecy\Attendances;

use Illuminate\Foundation\Http\FormRequest;

class GetAttendanceDetailPlanificationRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'start_time' =>  ['integer', 'required'],
            'end_time' =>  ['integer', 'required'],
            'planification.id' =>  ['integer', 'required']



        ];
    }

    public function attributes()
    {
        return [

            'start_time' => 'hora de inicio del curso',
            'end_time' => 'hora de cierre del curso',
            'planification.id' => 'id de la planificacion',
        ];
    }
}

