<?php

namespace App\Http\Requests\V1\Cecy\DetailPlanifications;

use Illuminate\Foundation\Http\FormRequest;

class DetailPlanificationRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'planification.id' =>  ['integer', 'required'],
        


        ];
    }

    public function attributes()
    {
        return [

            'planification.id' => 'Id  de la jornada',
    
        ];
    }
}
