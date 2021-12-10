<?php

namespace App\Http\Requests\V1\Core\Authentications;

use Illuminate\Foundation\Http\FormRequest;

class ChangePasswordAuthRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'currentPassword' => [
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
            ]
        ];
    }


    public function attributes()
    {
        return [
            'currentPassword' => 'contraseña actual',
            'password' => 'contraseña',
            'passwordConfirmation' => 'confirmación de contraseña',

        ];

    }
}
