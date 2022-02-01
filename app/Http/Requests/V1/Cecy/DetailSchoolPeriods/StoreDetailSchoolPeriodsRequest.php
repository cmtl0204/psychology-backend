<?php

namespace App\Http\Requests\V1\Cecy\DetailPlanifications;

use Illuminate\Foundation\Http\FormRequest;

class StoreDetailSchoolPeriodsRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'schoolPeriod.id' =>  ['integer', 'required'],
            'especialEndedAt'=>  ['required'],
            'especialStartedAt'=>  ['required'],
            'extraordinaryEndedAt'=>  ['required'],
            'extraordinaryStartedAt'=>  ['required'],
            'nullificationEndedAt'=>  ['required'],
            'nullificationStartedAt'=>  ['required'],
            'ordinaryEndedAt'=>  ['required'],
            'ordinaryStartedAt'=>  ['required'],
        ];
    }

    public function attributes()
    {
        return [
            'schoolPeriod.id' =>  'ID del periodo academico',
            'especialEndedAt'=>  'Fecha de fin para el periodo academico especial',
            'especialStartedAt'=>  'Fecha de inicio para el periodo academico especial',
            'extraordinaryEndedAt'=>  'Fecha de fin para el periodo academico estraordinaria',
            'extraordinaryStartedAt'=>  'Fecha de inicio para el periodo academico estraordinaria',
            'nullificationEndedAt'=>  'Fecha de fin para el periodo de anulación',
            'nullificationStartedAt'=>  'Fecha de inicio para el periodo de anulación',
            'ordinaryEndedAt'=>  'Fecha de fin para el periodo academico ordinario',
            'ordinaryStartedAt'=>  'Fecha de inicio para el periodo academico ordinario',    
        ];
    }
}
