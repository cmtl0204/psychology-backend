<?php

namespace App\Http\Requests\V1\Core\Authentications;

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
                'max:30'
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
            'password_confirmation' => 'confirmación de contraseña',
        ];

    }
}
