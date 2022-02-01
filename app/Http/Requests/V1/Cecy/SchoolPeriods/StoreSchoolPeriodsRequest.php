<?php

namespace App\Http\Requests\V1\Cecy\DetailPlanifications;

use Illuminate\Foundation\Http\FormRequest;

class StoreSchoolPeriodsRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'state.id' =>  ['integer', 'required'],
            'code' =>  ['required'],
            'ended_at' =>  ['required'],
            'minimum_note' =>  ['required'],
            'name' =>  ['required'],
            'started_at' =>  ['required'],
        ];
    }

    public function attributes()
    {
        return [
            'state.id' =>  'Id del estado del periodo lectivo',
            'code' =>  'codigo unico del periodo lectivo',
            'ended_at' =>  'Fecha de finalización del perido lectivo',
            'minimum_note' =>  'minimo de nota para aprovar los cursos',
            'name' =>  'Nombre del periodo lectivo',
            'started_at' =>  'Fecha de inicio del perido lectivo',
        ];
    }
}
