<?php

namespace App\Http\Requests\V1\Core\Images;

use Illuminate\Foundation\Http\FormRequest;

class DownloadImageRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

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
