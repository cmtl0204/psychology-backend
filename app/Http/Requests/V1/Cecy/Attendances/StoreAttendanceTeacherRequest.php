<?php

namespace App\Http\Requests\V1\Cecy\Attendance;

use Illuminate\Foundation\Http\FormRequest;

class StoreAttendanceTeacherRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        return [
            'type.id' => ['required', 'integer'],
            'duration' => ['required'],
            'registeredAt' => ['required']
        ];
    }

    public function attributes()
    {
        return [
            'type.id' => 'tipo de asistencia',
            'duration' => 'duracion',
            'registeredAt' => 'fecha'
        ];
    }
}
