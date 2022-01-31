<?php

namespace App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications;

use Illuminate\Foundation\Http\FormRequest;

class ShowDetailPlanificationRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        return [
            // 'detailPlanification.id' => ['required', 'integer'],
        ];
    }

    public function attributes()
    {
        return [
            // 'detailPlanification.id' => 'Detalle de planificación',
        ];
    }
}
