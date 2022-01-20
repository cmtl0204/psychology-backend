<?php

namespace App\Http\Requests\V1\Cecy\DetailPlanifications;

use Illuminate\Foundation\Http\FormRequest;

class GetDetailPlanificationInformNeedRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'responsibleCourse.id' =>  ['integer', 'required'],
            'sector.id' =>  ['integer', 'required'],
            'area.id' =>  ['integer', 'required'],
            'course.id' =>  ['integer', 'required']


        ];
    }

    public function attributes()
    {
        return [

            'responsibleCourse.id' => 'Id  del responsable del curso',
            'sector.id' => 'Id  del sector',
            'area.id' => 'Id  del area',
            'course.id' => 'Id  del curso',
        ];
    }
}
