<?php

namespace App\Http\Requests\V1\Cecy\Courses;

use Illuminate\Foundation\Http\FormRequest;

class GetCoursesByCategoryRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'category.id' =>  ['integer', 'required'],
        ];
    }

    public function attributes()
    {
        return [

            'category.id' => 'Id  de la categoria',
        ];
    }
}
