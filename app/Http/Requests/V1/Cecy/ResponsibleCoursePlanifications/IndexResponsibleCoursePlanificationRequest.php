<?php

namespace App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications;

use Illuminate\Foundation\Http\FormRequest;

class IndexResponsibleCoursePlanificationRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        return [
            'planification.id' => ['required', 'integer'],
        ];
    }
    
    public function attributes()
    {
        return [
            'planification.id' => 'Planificación',
        ];
    }
}
