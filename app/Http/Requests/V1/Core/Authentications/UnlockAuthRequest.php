<?php

namespace App\Http\Requests\V1\Core\Authentications;

use Illuminate\Foundation\Http\FormRequest;

class UnlockAuthRequest extends FormRequest
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
                'min:6',
                'max:50'
            ],
            'password_confirmation' => [
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
