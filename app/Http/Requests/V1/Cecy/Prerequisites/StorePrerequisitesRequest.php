<?php

namespace App\Http\Requests\V1\Cecy\Prerequisites;

use Illuminate\Foundation\Http\FormRequest;

class StorePrerequisiteRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        return [
            'prerequisite.id' => ['required', 'integer'],
            'course.id' => ['required', 'integer'],
        ];
    }

    public function attributes()
    {
        return [
            'prerequisite.id' => 'Identificador del prerequisito',
            'course.id' => 'Identificador del curso',
        ];
    }
}
