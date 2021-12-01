<?php

namespace App\Http\Requests\V1\Core\Files;

use Illuminate\Foundation\Http\FormRequest;

class DestroysFileRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'ids' => [
                'required'
            ]
        ];
    }

    public function attributes()
    {
        return [
            'ids' => 'IDs'
        ];
    }
}
