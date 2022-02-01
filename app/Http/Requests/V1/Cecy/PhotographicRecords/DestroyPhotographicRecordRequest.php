<?php

namespace App\Http\Requests\V1\Cecy\PhotographicRecords;

use Illuminate\Foundation\Http\FormRequest;

class DestroyPhotographicRecordRequest  extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        return [
            'id' => ['required'],
        ];
    }

    public function attributes()
    {
        return [
            'id' => 'Id del registro fotografico',
        ];
    }
}
