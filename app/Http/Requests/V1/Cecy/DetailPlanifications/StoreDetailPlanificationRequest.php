<?php

namespace App\Http\Requests\V1\Cecy\DetailPlanifications;

use Illuminate\Foundation\Http\FormRequest;

class StoreDetailPlanificationRequest extends FormRequest
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
            'endedTime' => ['required', 'time'],
            'observations' => ['required', 'integer'],
            'parallel.id' => ['required', 'integer'],
            'planification.id' => ['required', 'integer'],
            'planEndedAt' => ['required', 'date'],
            'registrationsLeft' => ['required', 'integer'],
            'state.id' => ['required', 'integer'],
            'startedTime' => ['required', 'time'],
            'workday.id' => ['required', 'integer'],
        ];
    }

    public function attributes()
    {
        return [
            'classroom.id' => 'Aula',
            'day.id' => 'Días de clase',
            'endedTime' => 'Hora de final',
            'observations' => 'Observaciones',
            'parallel.id' => 'Paralelo',
            'planification.id' => 'Planificación',
            'planEndedAt' => 'Fecha final real de la planificación',
            'registrationsLeft' => 'Capacidad restante del paralelo',
            'state.id' => 'Estado',
            'startedTime' => 'Hora de inicio',
            'workday.id' => 'Jornada'
        ];
    }
}
