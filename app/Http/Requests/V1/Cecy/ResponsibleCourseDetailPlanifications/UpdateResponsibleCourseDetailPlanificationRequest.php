<?php

namespace App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications;

use Illuminate\Foundation\Http\FormRequest;

class UpdateResponsibleCourseDetailPlanificationRequest extends FormRequest
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
            'detailPlanification.id' => ['required', 'integer'],
            'planification.id' => ['required', 'integer'],
            'workday.id' => ['required', 'integer'],
            'daysNumber' => ['required', 'integer'],
            'endedAt' => ['required', 'date'],
            'planEndedAt' => ['required', 'date'],
            'startedAt' => ['required', 'date'],
        ];
    }

    public function attributes()
    {
        return [
            'classroom.id' => 'Aula',
            'day.id' => 'Días de clase',
            'instructors' => 'Instructores',
            'detailPlanification.id' => 'Detalle de planificación',
            'planification.id' => 'Planificación',
            'workday.id' => 'Jornada',
            'daysNumber' => 'Número total de días de clase',
            'endedAt' => 'Fecha de finalización de clases',
            'planEndedAt' => 'Fecha real de finalización de clases',
            'startedAt' => 'Fecha de inicio de clases',
        ];
    }
}
