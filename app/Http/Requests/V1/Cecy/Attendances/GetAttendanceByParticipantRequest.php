<?php

namespace App\Http\Requests\V1\Cecy\Attendance;

use Illuminate\Foundation\Http\FormRequest;

class GetAttendanceByParticipantRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        return [
            'registration.id'=> ['required','integer'],
            'attendance.id'=> ['required','integer']
        ];
    }

    public function attributes()
    {
        return [
            'registration.id'=> 'id del registro',
            'attendance.id'=> 'id de la asistencia'
        ];
    }
}
