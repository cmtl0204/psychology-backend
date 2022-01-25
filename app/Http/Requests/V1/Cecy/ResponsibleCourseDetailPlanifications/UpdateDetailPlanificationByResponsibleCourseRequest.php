<?php

namespace App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications;

use Illuminate\Foundation\Http\FormRequest;

class UpdateDetailPlanificationByResponsibleCourseRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'classroom.id' => ['required', 'integer'],
            'day.id' => ['required', 'integer'],
            'planification.id' => ['required', 'integer'],
            'workday.id' => ['required', 'integer'],
            'paralel.id' => ['required', 'integer'],
            'endedTime' => ['required', 'time'],
            'startedTime' => ['required', 'time'],
            'observations' => ['required'],
        ];
    }
    
    public function attributes()
    {
        return [
            'classroom.id' => 'Aula',
            'day.id' => 'Días de clase',
            'planification.id' => 'Planificación',
            'workday.id' => 'Jornada',
            'paralel.id' => 'Paralelo del aula o clase',
            'endedTime' => ['required', 'time'],
            // 'planEndedAt' => 'Fecha real de finalización de clases',
            'startedTime' => ['required', 'time'],
        ];
    }
}
