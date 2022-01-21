<?php

namespace App\Http\Requests\V1\Cecy\Planifications;

use Illuminate\Foundation\Http\FormRequest;

class getPlanificationsByResponsibleCecyRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        return [
            'responsibleCecy.id' => ['required', 'integer'],
            'schoolPeriod.id' => ['required', 'integer'],
        ];
    }

    public function attributes()
    {
        return [
            'responsibleCecy.id' => 'Responsable del cecy',
            'schoolPeriod.id' => 'Periodo lectivo'
        ];
    }
}
