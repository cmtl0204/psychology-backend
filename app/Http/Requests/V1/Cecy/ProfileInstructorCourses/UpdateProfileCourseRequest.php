<?php

namespace App\Http\Requests\V1\Cecy\ProfileInstructorCourses;

use Illuminate\Foundation\Http\FormRequest;

class UpdateProfileCourseRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        return [
            'course.id' => ['required', 'integer'],
            'requiredKnowledges' => ['required'],
            'requiredExperiences' => ['required'],
            'requiredSkills' => ['required']
        ];
    }

    public function attributes()
    {
        return [
            'course.id' => 'id del curso',
            'requiredKnowledges' => 'conocimiento requerido',
            'requiredExperiences' => 'experiencia requerida',
            'requiredSkills' => 'Habilidades requeridas'
        ];
    }
}
