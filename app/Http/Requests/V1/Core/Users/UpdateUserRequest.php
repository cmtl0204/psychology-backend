<?php

namespace App\Http\Requests\V1\Core\Users;

use Illuminate\Foundation\Http\FormRequest;

class UpdateUserRequest extends FormRequest
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
            'username' => ['required', 'max:50'],
            'name' => ['required', 'max:100'],
            'lastname' => ['required', 'max:100'],
            'email' => ['required', 'max:100'],
        ];
    }

    public function attributes()
    {
        return [
            'username' => 'nombre de usuario',
            'name' => 'nombre',
            'lastname' => 'apellido',
            'email' => 'correo electrónico'
        ];
    }
}
