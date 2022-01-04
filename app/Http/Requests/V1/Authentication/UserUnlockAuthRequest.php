<?php

namespace App\Http\Requests\V1\Authentication;

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
            'username' => 'nombr de usuario'
        ];

    }
}
