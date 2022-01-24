<?php

namespace App\Http\Requests\V1\Cecy\Courses;

use Illuminate\Foundation\Http\FormRequest;

class GetInstructorsInformationByCourseRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'courses.id' => ['required', 'integer'],
        ];
    }

    public function attributes()
    {
        return [
            'courses.id' => 'Id del curso'
        ];
    }
}
