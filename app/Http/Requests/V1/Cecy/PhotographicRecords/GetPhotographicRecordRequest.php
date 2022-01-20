<?php

namespace App\Http\Requests\V1\Cecy\PhotographicRecords;

use Illuminate\Foundation\Http\FormRequest;

class GetPhotographicRecordRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'detailPlanification.id' =>  ['integer', 'required'],
        ];
    }

    public function attributes()
    {
        return [

            'detailPlanification.id' => 'Id  del dtalle de planificacion',

        ];
    }
}
