<?php

namespace App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications;

use Illuminate\Foundation\Http\FormRequest;

class GetPlanificationsByCourseRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        return [
            'course.id' => ['required', 'integer'],
        ];
    }

    public function attributes()
    {
        return [
            'course.id' => 'Curso'
        ];
    }
}
