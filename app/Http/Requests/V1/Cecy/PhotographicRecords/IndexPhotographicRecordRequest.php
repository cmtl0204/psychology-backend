<?php
namespace App\Http\Requests\V1\Cecy\PhotographicRecords;

use Illuminate\Foundation\Http\FormRequest;

class IndexPhotographicRecordRequest extends FormRequest
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

    public function messages()
    {
        return [

        ];
    }
}
