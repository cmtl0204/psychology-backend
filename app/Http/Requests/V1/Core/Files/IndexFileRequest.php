<?php

namespace App\Http\Requests\V1\Core\Files;

use Illuminate\Foundation\Http\FormRequest;

class IndexFileRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [];
    }

    public function attributes()
    {
        return [
        ];
    }
}
