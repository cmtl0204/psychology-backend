<?php

namespace App\Http\Requests\V1\Cecy\Instructors;

use Illuminate\Foundation\Http\FormRequest;

class StoreProfileCourseRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        return [
            'course_id' => ['required','integer'],
            'required_knowledge' => ['required'],
            'required_experience' => ['required'],
            'required_skills' => ['required']
        ];
    }

    public function attributes()
    {
        return [
            'course_id' => 'id del curso',
            'required_knowledge' => 'conocimiento requerido',
            'required_experience' => 'experiencia requerida',
            'required_skills' => 'Habilidades requeridas'
        ];
    }
}
