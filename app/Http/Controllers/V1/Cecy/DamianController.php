<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Cecy\Registrations\RegisterStudentRequest;
use App\Http\Resources\V1\Cecy\Registrations\RegisterStudentResource;
use App\Models\Cecy\AdditionalInformation;
use App\Models\Cecy\Catalogue;
use App\Models\Cecy\Participant;
use App\Models\Cecy\Registration;

class DamianController extends Controller
{
    //inscripcion al curso
    public function registerStudent(RegisterStudentRequest $request)
    {
        $registration = new Registration();

        $registration->participant()
            ->associate(Participant::find($request->input('participant.id')));

        $registration->type()
            ->associate(Catalogue::find($request->input('type.id')));

        $registration->number = $request->input('number');
        $registration->registered_at = $request->input('registeredAt');

        $registration->save();

        return (new RegisterStudentResource($registration))
            ->additional([
                'msg' => [
                    'summary' => 'Registro Creado',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
    public function storeAdditionalInformation(storeAdditionalInformationRequest $request)
    {
        $additionalInformation = new AdditionalInformation();

        $additionalInformation->registration()
            ->associate(Registration::find($request->input('registration.id')));

        $additionalInformation->worked = $request->input('worked');
        $additionalInformation->company_activity = $request->input('companyActivity');
        $additionalInformation->company_address = $request->input('companyAddress');
        $additionalInformation->company_email = $request->input('companyEmail');
        $additionalInformation->company_name = $request->input('companyName');
        $additionalInformation->company_phone = $request->input('companyPhone');
        $additionalInformation->company_sponsored = $request->input('companySponsored');
        $additionalInformation->contact_name = $request->input('contactName');
        $additionalInformation->course_knows = $request->input('courseKnows');
        $additionalInformation->course_follows = $request->input('courseFollows');

        $additionalInformation->save();



        return (new storeAdditionalInformationResource($additionalInformation))
            ->additional([
                'msg' => [
                    'summary' => 'Registro Creado',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

}
