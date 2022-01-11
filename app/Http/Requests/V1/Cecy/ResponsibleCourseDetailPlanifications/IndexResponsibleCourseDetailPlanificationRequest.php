<?php

namespace App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications;

use Illuminate\Foundation\Http\FormRequest;

class IndexResponsibleCourseDetailPlanificationRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        return [
            'schoolPeriod.id' => ['required', 'integer'],
        ];
    }

    public function attributes()
    {
        return [
            'schoolPeriod.id' => 'Periodo lectivo',
        ];
    }
}
