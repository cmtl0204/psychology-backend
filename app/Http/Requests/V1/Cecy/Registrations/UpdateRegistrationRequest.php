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
            'detail_planification_id'=>['required','integer'],
            'participant_id'=>['required','integer'],
            'state_id'=>['required','integer'],
            'type_id'=>['required','integer'],
            'finalGrade'=>['required','number'],
            'grade1'=>['required','number'],
            'grade2'=>['required','number'],
            'number'=>['required','number'],
            'observations'=>['required',],
            'registeredAt'=>['required','date'],
        ];
    }

    public function attributes()
    {
        return [
            'detail_planification_id'=>'Id de planificación',
            'participant_id'=>'Id de participante',
            'state_id'=>'Id de estado de matrícula',
            'type_id'=>'Id de tipo de matrícula',
            'finalGrade'=>'Nota final',
            'grade1'=>'Nota 1',
            'grade2'=>'Nota 2',
            'number'=>'Número de identificación de la matrícula',
            'observations'=>'Observaciones',
            'registeredAt'=>'Fecha en que se matriculó',

        ];
    }
}
