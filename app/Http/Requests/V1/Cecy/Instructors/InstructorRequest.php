<?php

namespace App\Http\Requests\V1\Cecy\Instructors;

use Illuminate\Foundation\Http\FormRequest;

class InstructorRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        return [

            'user.id' => ['required']
        ];
    }

    public function attributes()
    {
        return [
            'user.id' => 'Id responsable del cecy'
        ];
    }
}
