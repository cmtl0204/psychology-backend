<?php
namespace App\Http\Requests\V1\Cecy\Participants;

use Illuminate\Foundation\Http\FormRequest;

class StoreParticipantsRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        return [
            'user.id' => ['required', 'integer'],
            'person_type.id' => ['required', 'integer'],
        ];
    }

    public function attributes()
    {
        return [
            'participants.additional_information_id' => 'identificador de la informacion adicional',
            'participants.user_id' => 'identificador de usuario',
            'participants.person_type_id' => 'identificador del tipo de persona',
        ];
    }
}