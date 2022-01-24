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
            'responsibleCourse.id' => ['required', 'integer'],
            'course.id' => ['required', 'integer'],
        ];
    }

    public function attributes()
    {
        return [
            'responsibleCourse.id' => 'Responsable del curso',
            'course.id' => 'Curso'
        ];
    }
}
