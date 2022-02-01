<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Cecy\Courses\getCoursesByResponsibleRequest;
use App\Http\Requests\V1\Cecy\DetailPlanifications\DetailPlanificationRequest;
use App\Http\Requests\V1\Cecy\Instructors\InstructorRequest;
use App\Http\Requests\V1\Cecy\Registrations\IndexRegistrationRequest;
use App\Http\Requests\V1\Cecy\Registrations\UpdateRegistrationRequest;
use App\Http\Resources\V1\Cecy\Courses\CourseCollection;
use App\Http\Resources\V1\Cecy\Participants\ParticipantCollection;
use App\Http\Resources\V1\Cecy\Planifications\PlanificationCollection;
use App\Http\Resources\V1\Cecy\Registrations\RegistrationCollection;
use App\Http\Resources\V1\Cecy\Registrations\RegistrationResource;
use App\Http\Resources\V1\Cecy\SchoolPeriods\SchoolPeriodsCollection;
use App\Http\Resources\V1\Core\Users\UserResource;
use App\Models\Cecy\DetailPlanification;
use App\Models\Cecy\Instructor;
use App\Models\Cecy\Participant;
use App\Models\Cecy\Planification;
use App\Models\Cecy\Registration;
use App\Models\Cecy\SchoolPeriod;
use Illuminate\Http\Request;


class RivasController extends Controller
{
    // public function __construct()
    // {
    //     $this->middleware('permission:store-catalogues')->only(['store']);
    //     $this->middleware('permission:update-catalogues')->only(['update']);
    //     $this->middleware('permission:delete-catalogues')->only(['destroy', 'destroys']);
    // }
    /*DDRC-C: Busca planificaciones vigentes por periodo asignadas al usuario logueado(responsable del CECY)*/
    public function getPlanificationsByPeriodState(InstructorRequest $request)
    {
        $instructor = Instructor::FirstWhere('user_id', $request->user()->id)->get();
        $catalogue = json_decode(file_get_contents(storage_path() . "/catalogue.json"), true);
        $planifications = $instructor
            ->planifications()
            ->period($request->input('period.id'))
            ->where('state', $catalogue['planification_state']['approved'])
            ->paginate($request->input('per_page'));

        return (new PlanificationCollection($planifications))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ])->response()->setStatusCode(200);
    }

    /*DDRC-C: Busca los participantes inscritos a una planificación especifica*/
    public function getPlanificationParticipants(DetailPlanificationRequest $request, Planification $planification)
    {
        $detailPlanifications = $planification->detailPlanifications()->get();

        $participants = Registration::whereIn('detail_planification_id', $detailPlanifications)
            ->paginate($request->input('per_page'));

        return (new ParticipantCollection($participants))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ])->response()->setStatusCode(200);
    }

    /*DDRC-C: Busca informacion de un participante(datos del usuario) y de registro a un curso especifico(informacion adicional y archivos)*/
    public function getParticipantInformation(IndexRegistrationRequest $request, Registration $registration)
    {
        // para traer informacion del estudiante
        // $user = User::FirstWhere('id', $request->participant()->id)->get();


        return (new ParticipantInformationResource($registration))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ])->response()->setStatusCode(200);
    }

    /*DDRC-C: actualiza una inscripcion, cambiando la observacion,y estado de una inscripción de un participante en un curso especifico  */
    public function updateParticipantRegistration(UpdateRegistrationRequest $request, Registration $registration)
    {
        $registration->observation = $request->input('observation');
        $registration->state()->associate(Catalogue::find($request->input('state.id')));
        $registration->save();

        return (new RegistrationResource($registration))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '201'
                ]
            ])->response()->setStatusCode(201);
    }

    /*DDRC-C: Matricula un participante */
    public function registerParticipant(Request $request, Participant $participant)
    {
        $registration = $participant->registration()->first();
        $registration->state()->associate(Catalogue::find($request->input('state.id')));
        $registration->save();

        return (new RegistrationResource($registration))
            ->additional([
                'msg' => [
                    'summary' => 'Participantes matriculados',
                    'detail' => '',
                    'code' => '201'
                ]
            ])
            ->response()->setStatusCode(201);
    }

    /*DDRC-C: Anular varias Matriculas */
    public function nullifyRegistrations(Request $request)
    {
        $registrations = Registration::whereIn('id', $request->input('ids'))->get();
        $registrations->state()->associate(Catalogue::find($request->input('state.id')));

        return (new RegistrationCollection($registrations))
            ->additional([
                'msg' => [
                    'summary' => 'Matriculas Anuladas',
                    'detail' => '',
                    'code' => '201'
                ]
            ])
            ->response()->setStatusCode(201);
    }

    /*DDRC-C: Trae una lista de periodos lectivos*/
    public function catalogue(SchoolPeriod $request)
    {
        $sorts = explode(',', $request->sort);

        $schoolPeriods = SchoolPeriod::customOrderBy($sorts)
            ->get();

        return (new SchoolPeriodsCollection($schoolPeriods))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ])->response()->setStatusCode(201);
    }

    /*DDRC-C: Trae una lista de nombres de cursos, paralelos y jornadas*/
    public function getCoursesParallelsWorkdays(getCoursesByResponsibleRequest $request)
    {
        $sorts = explode(',', $request->sort);
        $courseParallelWorkday = Planification::customOrderBy($sorts)
//            ->detailplanifications()
//            ->course()
            ->get();

        return (new CourseCollection($courseParallelWorkday))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ])->response()->setStatusCode(201);
    }

    /*DDRC-C: notifica a un participante de una observacion en su inscripcion*/
    public function notifyParticipant()
    {
        //TODO: revisar sobre el envio de notificaciones
        return 'por revisar';
    }

    /*DDRC-C: elimina una matricula de un participante en un curso especifico */
    public function nullifyRegistration(Registration $registration)
    {
        $registration->delete();

        return (new UserResource($registration))
            ->additional([
                'msg' => [
                    'summary' => 'Matrícula Anulada',
                    'detail' => '',
                    'code' => '201'
                ]
            ])
            ->response()->setStatusCode(201);
    }
}
