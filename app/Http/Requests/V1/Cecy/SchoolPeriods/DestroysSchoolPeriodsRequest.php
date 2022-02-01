<?php

namespace App\Http\Requests\V1\Cecy\DetailPlanifications;

use Illuminate\Foundation\Http\FormRequest;

class DestroysSchoolPeriodsRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'ids' => ['required', 'integer'],
        ];
    }

    public function attributes()
    {
        return [
            'ids' => 'ID`s del detalle de periodo academico',
        ];
    }
    public function messages()
    {
        return [
            'ids' => 'Es obligatorio enviar un Id de tipo número entero',
        ];
    }
}
