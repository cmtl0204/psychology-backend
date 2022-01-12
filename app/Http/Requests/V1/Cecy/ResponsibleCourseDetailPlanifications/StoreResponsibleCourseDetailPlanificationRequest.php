<?php

namespace App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications;

use Illuminate\Foundation\Http\FormRequest;

class StoreResponsibleCourseDetailPlanificationRequest extends FormRequest
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
            'instructors' => ['required'],
            'planification.id' => ['required', 'integer'],
            'workday.id' => ['required', 'integer'],
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
            'instructors' => 'Instructores',
            'planification.id' => 'Planificación',
            'workday.id' => 'Jornada',
            'daysNumber' => 'Número total de días de clase',
            'endedAt' => 'Fecha de finalización de clases',
            'endedTime' => ['required', 'time'],
            'planEndedAt' => 'Fecha real de finalización de clases',
            'startedAt' => 'Fecha de inicio de clases',
            'startedTime' => ['required', 'time'],
        ];
    }
}
