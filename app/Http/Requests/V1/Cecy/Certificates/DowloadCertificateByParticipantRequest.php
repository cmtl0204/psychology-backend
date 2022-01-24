<?php

namespace App\Http\Requests\V1\Cecy\Certificates;

use Illuminate\Foundation\Http\FormRequest;

class DowloadCertificateByParticipantRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        return [
            'certificate_type' => ['required','integer'],
            'state_id' => ['required','integer'],
            'code' => ['required']


        ];
    }

    public function attributes()
    {
        return [
            'certificate_type' => 'Tipo de certificado',
            'state_id' => 'Estado del certificado',
            'code' => 'codigo del certificado'
        ];
    }
}
