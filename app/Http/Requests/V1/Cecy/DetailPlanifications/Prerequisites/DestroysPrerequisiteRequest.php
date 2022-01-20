<?php

namespace App\Http\Requests\V1\Cecy\Prerequisites;

use Illuminate\Foundation\Http\FormRequest;

class DestroysPrerequisiteRequest  extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        return [
            'ids' => ['required'],
        ];
    }

    public function attributes()
    {
        return [
            'ids' => 'ID`s de los prerequisitos',
        ];
    }
}
