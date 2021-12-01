<?php

namespace App\Http\Requests\V1\Core\Files;

use Illuminate\Foundation\Http\FormRequest;

class UpdateFileRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'name'=>[
                'required'
            ],
        ];
    }

    public function attributes()
    {
       return [
            'name' => 'nombre',
        ];
    }
}
