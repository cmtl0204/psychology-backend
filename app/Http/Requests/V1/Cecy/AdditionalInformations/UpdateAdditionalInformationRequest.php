<?php

namespace App\Http\Requests\V1\Cecy\AdditionalInformations;

use Illuminate\Foundation\Http\FormRequest;

class UpdateAdditionalInformationRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'company_activity' => ['required'],
            'company_address' => ['required'],
            'company_email' => ['required'],
            'company_name' => ['required'],
            'company_phone' => ['required'],
            'company_sponsor' => ['required'],
            'contact_name' => ['required'],
            'course_know' => ['required'],
            'course_follow' => ['required'],
            'worked' => ['required'],
        ];
    }

    public function attributes()
    {
        return [
            'company_activity' => 'actividad de la empresa',
            'company_address' => 'direccion fisica de empresa',
            'company_email' => 'correo de empresa',
            'company_name' => 'nombre de empresa',
            'company_phone' => 'telefono de empresa',
            'company_sponsor' => 'la empresa patrocina',
            'contact_name' => 'nombre de contacto que patrocina',
            'course_know' => 'Entorno de aprendizaje',
            'course_follow' => 'Horas prácticas',
            'worked' => 'el participante trabaja, true -> trabaja',
        ];
    }
}
