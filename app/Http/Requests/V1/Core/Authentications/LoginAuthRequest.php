<?php

namespace App\Http\Requests\V1\Core\Authentications;


use Illuminate\Foundation\Http\FormRequest;

class LoginAuthRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'username' => 'required',
            'password' => ['required'],
            'deviceName' => ['required', 'max:100'],
        ];
    }

    public function attributes()
    {
       return [
            'username' => 'nombre de usuario',
            'password' => 'contraseña',
            'deviceName' => 'nombre del dispositivo',
        ];
    }
}
