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
            'responsibleCourse.id' => ['required', 'integer'],
            'schoolPeriod.id' => ['required', 'integer'],
        ];
    }

    public function attributes()
    {
        return [
            'responsibleCourse.id' => 'Responsable del curso',
            'schoolPeriod.id' => 'Periodo lectivo'
        ];
    }
}
