<?php

namespace App\Http\Requests\V1\Cecy\Courses;

use Illuminate\Foundation\Http\FormRequest;

class getSchedulesInformationByCourseRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [];
    }

    public function attributes()
    {
        return [];
    }
}
