<?php

namespace App\Http\Requests\V1\Core\Careers;

use App\Http\Requests\V1\JobBoard\JobBoardFormRequest;
use Illuminate\Foundation\Http\FormRequest;

class StoreCareerRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        $rules = [
            'description' => [
                'nullable',
                'min:10',
                'max:1000',
            ],
            'type.id' => [
                'required',
                'integer',
//                Rule::unique('pgsql-job-board.skills', 'type_id')->ignore($this->id),
            ]
        ];
        return JobBoardFormRequest::rules($rules);
    }

    public function attributes()
    {
        $attributes = [
            'description' => 'descripción',
            'type.id' => 'tipo-id',
        ];
        return JobBoardFormRequest::attributes($attributes);
    }
}
