<?php

namespace App\Http\Requests\V1\Cecy\PhotographicRecords;

use Illuminate\Foundation\Http\FormRequest;

class StorePhotographicRecordRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        return [
            'detailPlanification.id' => ['required', 'integer'],
            'description' => ['required', 'string'],
            'numberWeek' => ['required', 'integer'],
            'urlImage' => ['required','string'],
            'weekAt' => ['required','date'],

        ];
    }

    public function attributes()
    {
        return [
            'detailPlanification.id' => 'Id detalle de la planificacion',
            'description' => 'Descripción',
            'numberWeek' => 'Numero de semanas',
            'urlImage' => 'Url de la imagen',
            'weekAt' => 'Fecha',
        ];
    }
}

