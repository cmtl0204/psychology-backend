<?php

namespace App\Http\Requests\V1\Core\Images;

use Illuminate\Foundation\Http\FormRequest;

class UpdateImageRequest extends FormRequest
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
                'mimes:pdf,txt,doc,docx,xls,xlsx,csv,ppt,pptx,zip,rar,7z,tar,jpg,jpeg,png,bmp,tiff,tif,svg',
                'file',
                'max:1024000',
            ],
        ];

    }

    public function attributes()
    {
        return [
            'image' => 'imagen'
        ];

    }
}
