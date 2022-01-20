<?php

namespace App\Http\Requests\V1\Cecy\Registrations;

use Illuminate\Foundation\Http\FormRequest;

class IndexRegistrationRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return false;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
           

        ];
    }

    public function attributes()
    {
        return [
         
        ];
    }
}
