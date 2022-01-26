<?php

namespace App\Http\Requests\V1\Cecy\Participants;

use Illuminate\Foundation\Http\FormRequest;

class StoreParticipantRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        return [
            'user_id' => ['required', 'integer'],
            'type.id' => ['required', 'integer'],
            'state.id' => ['required', 'integer'],
        ];
    }

    public function attributes()
    {
        return [
            'user_id' => 'Id del usuario',
            'type.id' => 'Id del tipo de participante',
            'state.id' => 'Id del estado del participante'
        ];
    }
}
