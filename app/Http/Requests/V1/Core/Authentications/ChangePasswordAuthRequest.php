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
       return   [
            'password' => [
                'required',
                'min:6',
                'max:30'
            ],
            'password_confirmation' => [
                'required',
                'same:password'
            ]
        ];
    }


    public function attributes()
    {
       return  [
            'password_old' => 'Password Old',
            'password' => 'Password',
            'password_confirmation' => 'Password Confirmation',

        ];

    }
}
