<?php

namespace App\Http\Requests\V1\Cecy\Courses;

use Illuminate\Foundation\Http\FormRequest;

class GetCoursesByNameRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'name' =>  ['string', 'required'],
        ];
    }

    public function attributes()
    {
        return [

            'name' => 'Nombre del curso',
        ];
    }
}
