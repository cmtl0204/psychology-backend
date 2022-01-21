<?php

namespace App\Http\Requests\V1\Cecy\Attendance;

use Illuminate\Foundation\Http\FormRequest;

class SaveDetailAttendanceRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        return [
            'attendance.id'=> ['required','integer'],
            'registration.id'=> ['required','integer']
        ];
    }

    public function attributes()
    {
        return [
            'attendance.id'=> 'id de la asistencia',
            'registration.id'=> 'id del registro'
        ];
    }
}
