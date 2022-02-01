<?php

namespace App\Http\Requests\V1\Cecy\Registrations;

use Illuminate\Foundation\Http\FormRequest;

class RegisterStudentRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return false;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'detailPlanification.id' => ['required', 'integer'],
            'participant.id' => ['required', 'integer'],
            'state.id' => ['required', 'integer'],
            'stateCourse.id' => ['required', 'integer'],
            'type.id' => ['required', 'integer'],
            'typeParticipant.id' => ['required', 'integer'],
            'finalGrade' => ['required', 'number'],
            'grade1' => ['required', 'number'],
            'grade2' => ['required', 'number'],
            'number' => ['required', 'number'],
            'observations' => ['required',],
            'registeredAt' => ['required', 'date'],
        ];
    }

    public function attributes()
    {
        return [
            'detailPlanification.id' => 'Id de planificación',
            'participant.id' => 'Id de participante',
            'state.id' => 'Id de estado de matrícula',
            'stateCourse.id' => 'Id del estado del curso',
            'type.id' => 'Id de tipo de matrícula',
            'typeParticipant.id' => 'Id del tipo de participante',
            'finalGrade' => 'Nota final',
            'grade1' => 'Nota 1',
            'grade2' => 'Nota 2',
            'number' => 'Número de identificación de la matrícula',
            'observations' => 'Observaciones',
            'registeredAt' => 'Fecha en que se matriculó',
        ];
    }
}
