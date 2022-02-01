<?php

namespace App\Http\Requests\V1\Cecy\Instructors;

use Illuminate\Foundation\Http\FormRequest;

class StoreInstructorRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        return [
            'type.id' => ['required', 'integer'],
            'state.id' => ['required', 'integer'],
            'user.id' => ['required', 'integer']
        ];
    }

    public function attributes()
    {
        return [
            'type.id' => 'Id del tipo de instructor',
            'state.id' => 'Estado del instructor',
            'user.id' => 'Id del usuario'
        ];
    }
}
