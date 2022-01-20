<?php

namespace App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications;

use Illuminate\Foundation\Http\FormRequest;

class ShowAttendanceTeacherRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        return [
            'id' => ['required','integer']
        ];
    }

    public function attributes()
    {
        return [
            'id' => 'id de la  asistencia'
        ];
    }
}
