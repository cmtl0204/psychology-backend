<?php

namespace App\Http\Requests\V1\Core\Images;

use Illuminate\Foundation\Http\FormRequest;

class DestroysImageRequest extends FormRequest
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
