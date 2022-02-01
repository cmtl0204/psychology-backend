<?php

namespace App\Http\Requests\V1\Cecy\KPI\Planifications;

use Illuminate\Foundation\Http\FormRequest;

class ShowKpiRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        return [
            'state.id' => ['required','integer'],
        ];
    }

    public function attributes()
    {
        return [
            'state.id' => 'Estado de planificación',
        ];
    }
}
