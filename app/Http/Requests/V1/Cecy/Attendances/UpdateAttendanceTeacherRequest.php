<?php

namespace App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications;

use Illuminate\Foundation\Http\FormRequest;

class UpdateAttendanceTeacherRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        return [
            'type_id' => ['required','integer'],
            'duration' => ['required'],
            'registered_at' => ['required']
        ];
    }

    public function attributes()
    {
        return [
            'type_id' => 'tipo de asistencia',
            'duration' => 'duracion',
            'registered_at' => 'fecha'
        ];
    }
}
