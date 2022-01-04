<?php

namespace App\Http\Requests\V1\Core\Images;

use Illuminate\Foundation\Http\FormRequest;

class IndexImageRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'id' => [
                'required',
                'integer',
            ],
        ];
    }

    public function attributes()
    {
       return [
            'id' => 'ID',
        ];
    }
}
