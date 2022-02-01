<?php
namespace App\Http\Requests\V1\Cecy\Participants;

use Illuminate\Foundation\Http\FormRequest;

class IndexDetailAttendanceRequest extends FormRequest
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
