<?php

namespace App\Http\Requests\V1\Cecy\Courses;

use Illuminate\Foundation\Http\FormRequest;

class GetDateByshowYearScheduleRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'startedAt' => ['required', 'date'],
            'sector.id' => ['required', 'integer'],
            'area.id' => ['required', 'integer'],


        ];
    }

    public function attributes()
    {
        return [
            'startedAt' => 'fecha de la planificacion'
            'sector.id' => 'sector de la planificacion',
            'area.id' => 'area de la planificacion',

        ];
    }
}
