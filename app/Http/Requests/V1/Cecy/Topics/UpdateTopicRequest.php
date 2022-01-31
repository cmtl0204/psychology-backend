<?php

namespace App\Http\Requests\V1\Cecy\Topics;

use Illuminate\Foundation\Http\FormRequest;

class UpdateTopicRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        return [
            'description' => ['required', 'max:240'],
        ];
    }

    public function attributes()
    {
        return [
            'description' => 'Descripción del tema o subtemas',
        ];
    }
}
