<?php

namespace App\Http\Requests\V1\Core\Authentications;

use Illuminate\Foundation\Http\FormRequest;

class UserUnlockAuthRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'username' => ['required']
        ];
    }

    public function attributes()
    {
       return  [
            'username' => 'usuario'
        ];

    }
}
