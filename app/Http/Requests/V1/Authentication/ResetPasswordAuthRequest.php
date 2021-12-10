<?php

namespace App\Http\Requests\V1\Authentication;

use Illuminate\Foundation\Http\FormRequest;

class ResetPasswordAuthRequest extends FormRequest
{

    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'token' => [
                'required'
            ],
            'password' => [
                'required',
                'min:8',
                'max:16'
            ],
            'passwordConfirmation' => [
                'required',
                'same:password'
            ],
        ];
    }

    public function attributes()
    {
       return  [
            'token' => 'token',
            'password' => 'contraseña',
            'passwordConfirmation' => 'confirmación de contraseña',
        ];

    }
}
