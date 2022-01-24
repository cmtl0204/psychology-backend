<?php

namespace App\Http\Requests\V1\Cecy\Topics;

use Illuminate\Foundation\Http\FormRequest;

class StoreTopicRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        return [
            'level' => ['required', 'integer'],
            'description' => ['required', 'max:240'],
        ];
    }

    public function attributes()
    {
        return [
            'level' => 'Tipo de nivel, tema o subtema',
            'description' => 'Descripción del tema o subtemas',
        ];
    }
}
