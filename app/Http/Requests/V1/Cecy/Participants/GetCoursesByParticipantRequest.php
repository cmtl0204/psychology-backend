<?php
namespace App\Http\Requests\V1\Cecy\Participants;

use Illuminate\Foundation\Http\FormRequest;

class GetCoursesByParticipantRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        return [
            
        ];
    }

    public function attributes()
    {
        return [
            'participant.id' => ['required', 'integer'],
        
        ];
    }

    public function messages()
    {
        return [

            'participant.id' => 'Id del participante',
        ];
    }
}