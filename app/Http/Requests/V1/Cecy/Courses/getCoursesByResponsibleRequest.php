<?php

namespace App\Http\Requests\V1\Cecy\Courses;

use Illuminate\Foundation\Http\FormRequest;

class getCoursesByCategoryRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'responsible.id' =>  ['integer', 'required'],
        ];
    }

    public function attributes()
    {
        return [

            'responsible.id' => 'Id  del docente responsable del curso',
        ];
    }
}
