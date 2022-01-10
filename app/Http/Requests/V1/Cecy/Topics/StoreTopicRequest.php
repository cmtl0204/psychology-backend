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
            'level.id' => ['required', 'integer'],
            'description' => ['required', 'max:240'],
        ];
    }

    public function attributes()
    {
        return [
            'level.id' => 'Tipo de nivel, tema o subtema',
            'description' => 'Descripción del tema o subtemas',
        ];
    }
}
