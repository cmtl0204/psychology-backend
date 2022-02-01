<?php

namespace App\Http\Requests\V1\Cecy\Attendance;

use Illuminate\Foundation\Http\FormRequest;

class StoreDetailAttendanceRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        return [
            'attendance_id' => ['required', 'integer'],
            'registration_id' => ['required'],
            'type_id' => ['required']
        ];
    }

    public function attributes()
    {
        return [
            'attendance_id' => 'id de la asistencia',
            'registration_id' => 'id del registro',
            'type_id' => 'tipo de asistencia'
        ];
    }
}

