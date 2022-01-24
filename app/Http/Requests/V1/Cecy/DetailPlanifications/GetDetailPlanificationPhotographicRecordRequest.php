<?php

namespace App\Http\Requests\V1\Cecy\DetailPlanifications;

use Illuminate\Foundation\Http\FormRequest;

class GetDetailPlanificationPhotographicRecordRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'workday.id' =>  ['integer', 'required'],
        


        ];
    }

    public function attributes()
    {
        return [

            'workday.id' => 'Id  de la jornada',
    
        ];
    }
}
