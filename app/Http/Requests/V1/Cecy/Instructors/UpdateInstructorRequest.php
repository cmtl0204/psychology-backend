<?php

namespace App\Http\Requests\V1\Cecy\Instructors;

use Illuminate\Foundation\Http\FormRequest;

class UpdateInstructorRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        return [
            'type_id' => ['required','integer'],
            'state_id' => ['required'],
            'user_id' => ['required']
        ];
    }

    public function attributes()
    {
        return [
            'type_id' => 'Si el instructor es de la senescyt o de la setec',
            'state_id' => 'Si esta activo o inactivo ',
            'user_id' => 'Los usuarios de ignug'
        ];
    }
}
