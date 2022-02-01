<?php

namespace App\Http\Requests\V1\Cecy\Attendance;

use Illuminate\Foundation\Http\FormRequest;

class DestroyDetailAttendanceRequest  extends FormRequest
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
            'id' => 'Id del detalle de la planificaions',
        ];
    }
}
