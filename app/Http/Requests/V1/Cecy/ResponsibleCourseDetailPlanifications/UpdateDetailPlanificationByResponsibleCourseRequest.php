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
            'detailPlanification.id' => ['required', 'integer'],
            'instructors' => ['required'],
            'planification.id' => ['required', 'integer'],
            'workday.id' => ['required', 'integer'],
            'paralel' => ['required'],
            'daysNumber' => ['required', 'integer'],
            'endedAt' => ['required', 'date'],
            'endedTime' => ['required', 'time'],
            'startedAt' => ['required', 'date'],
            'startedTime' => ['required', 'time'],
        ];
    }
    
    public function attributes()
    {
        return [
            'classroom.id' => 'Aula',
            'day.id' => 'Días de clase',
            'detailPlanification.id' => 'Detalle de planificación',
            'instructors' => 'Instructores',
            'planification.id' => 'Planificación',
            'workday.id' => 'Jornada',
            'paralel' => 'Paralelo del aula o clase',
            'daysNumber' => 'Número total de días de clase',
            'endedAt' => 'Fecha de finalización de clases',
            'endedTime' => ['required', 'time'],
            'planEndedAt' => 'Fecha real de finalización de clases',
            'startedAt' => 'Fecha de inicio de clases',
            'startedTime' => ['required', 'time'],
        ];
    }
}
