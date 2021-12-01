<?php

namespace App\Http\Requests\V1\Core\Images;

use Illuminate\Foundation\Http\FormRequest;

class UploadImageRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'images.*' => [
                'required',
                'mimes:jpg,jpeg,png,jpeg 2000,bmp',
                'file',
                'max:102400',
            ],
        ];
    }

    public function attributes()
    {
        return [
            'images.*' => 'imagen'
        ];
    }
}
