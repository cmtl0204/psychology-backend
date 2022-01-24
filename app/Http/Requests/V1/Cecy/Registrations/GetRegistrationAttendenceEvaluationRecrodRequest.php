<?php

namespace App\Http\Requests\V1\Cecy\Registrations;

use Illuminate\Foundation\Http\FormRequest;

class GetRegistrationRecordCompetitorRequest extends FormRequest
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
            'state.id' =>  ['integer', 'required'],
            'participant.id' =>  ['integer', 'required'],
            'detailPlanification.id' =>  ['integer', 'required'],

        ];
    }

    public function attributes()
    {
        return [
            'state.id' => 'matriculado o inscrito',
            'participant.id' => 'id del participante',
            'detailPlanification.id' => 'id del detalle de planificacion',


        ];
    }
}
