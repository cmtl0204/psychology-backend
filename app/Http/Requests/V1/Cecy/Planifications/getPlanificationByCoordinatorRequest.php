<?php

namespace App\Http\Requests\V1\Cecy\Planifications;

use Illuminate\Foundation\Http\FormRequest;

class GetPlanificationByCoordinatorRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        return [
            'code'=>['requiered','string','max:100'],
            'responsibleCourse.id' => ['required', 'integer'],
            'course.id' => ['required', 'integer'],
            'state.id' => ['required', 'integer'],
        ];
    }

    public function attributes()
    {
        return [
            'code' => 'codigo del curso',
            'responsibleCourse.id' => 'Responsable del curso',
            'course.id' => 'nombre del curso',
            'state.id' => 'estado del curso'
        ];
    }
}
