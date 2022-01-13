<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Cecy\Registrations\StoreRegistrationRequest;
use App\Http\Resources\V1\Cecy\Registrations\RegistrationResource;
use App\Models\Cecy\Catalogue;
use App\Models\Cecy\Participant;
use App\Models\Cecy\Registration;

class DamianController extends Controller
{
    //inscripcion al curso
    public function registerStudent(StoreRegistrationRequest $request)
    {
        $registration = new Registration();

        $registration->participant()
            ->associate(Participant::find($request->input('participant.id')));

        $registration->type()
            ->associate(Catalogue::find($request->input('type.id')));

        $registration->number = $request->input('number');
        $registration->registered_at = $request->input('registeredAt');

        $registration->save();

        return (new RegistrationResource($registration))
            ->additional([
                'msg' => [
                    'summary' => 'Registro Creado',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

}
