<?php

namespace App\Http\Requests\V1\Cecy\Attendance;

use Illuminate\Foundation\Http\FormRequest;

class StoreAttendanceRequest extends FormRequest
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
            'duration' => 'duracion de la clase',
            'registeredAt' => 'fecha de la clase'
        ];
    }
}
