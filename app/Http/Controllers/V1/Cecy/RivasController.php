<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Cecy\Certificates\ShowParticipantsRequest;
use App\Http\Requests\V1\Cecy\Participants\IndexParticipantRequest;
use App\Http\Requests\V1\Cecy\Participants\UpdateParticipantRequest;
use App\Http\Requests\V1\Cecy\Registrations\IndexRegistrationRequest;
use App\Http\Requests\V1\Core\Users\IndexUserRequest;
use App\Http\Resources\V1\Cecy\DetailPlanifications\DetailPlanificationResource;
use App\Http\Resources\V1\Cecy\Participants\ParticipantCollection;
use App\Http\Resources\V1\Cecy\Planifications\PlanificationCollection;
use App\Http\Resources\V1\Cecy\Registrations\RegistrationCollection;
use App\Http\Resources\V1\Cecy\Registrations\RegistrationResource;
use App\Http\Resources\V1\Cecy\SchoolPeriods\SchoolPeriodsCollection;
use App\Http\Resources\V1\Core\Users\UserResource;
use App\Models\Authentication\User;
use App\Models\Cecy\DetailPlanification;
use App\Models\Cecy\Instructor;
use App\Models\Cecy\Notification;
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
            ->courses()
            ->where('code', $catalogue['planification_state']['approved'])
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
    public function getPlanificationParticipants(DetailPlanificationRequest $request)
    {
        $detailPlanification = DetailPlanification::FirstWhere('planification_id',$request->input('planification.id'));

        $participants=Registration::Where('detail_planification_id',$detailPlanification->id)
        ->participant()
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
    public function getParticipantInformation(IndexRegistrationRequest $request)
    {
        // para traer informacion del estudiante
        // $user = User::FirstWhere('id', $request->participant()->id)->get();
        $registrations = Registration::where('id',$request->input('registrations.id'))
            ->participant()
            ->AdditionalInformation() 
            ->paginate($request->input('per_page'));


        return (new ParticipantInformationResource($registrations))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ])->response()->setStatusCode(200);
    }

    /*DDRC-C: actualiza una inscripcion, cambiando la observacion,y estado de una inscripción de un participante en un curso especifico  */
    public function updateParticipantRegistration(updateRegistrationRequest $request, Registration $registration)
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
    public function registerParticipant(Request $request,Participant $participant)
    {
        $registration=Registration::where('participant_id',$participant->id);
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
    /*DDRC-C: Anulas varias Matriculas */
    public function nullifyRegistrations(Request $request)
    {

        $registration = Registration::whereIn('id', $request->input('ids'))->get();
        Registration::destroy($request->input('ids'));

        return (new RegistrationCollection($registration))
            ->additional([
                'msg' => [
                    'summary' => 'Usuarios Eliminados',
                    'detail' => '',
                    'code' => '201'
                ]
            ])
            ->response()->setStatusCode(201);
    }

    /*DDRC-C: Trae una lista de periodos lectivos*/
    public function getSchoolPeriods(SchoolPeriod $request)
    {
        $sorts = explode(',', $request->sort);

        $schoolPeriods = SchoolPeriod::customOrderBy($sorts)
            ->paginate();

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
    public function getCoursesParallelsWorkdays(CourseInfoRequest $request)
    {
        $sorts = explode(',', $request->sort);
        $cpw = Planification::customOrderBy($sorts)
            ->detailplanifications()
            ->course()
            ->get();

        return (new CourseParallelWorkdayCollection($cpw))
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
                    'summary' => 'Matrícula Eliminada',
                    'detail' => '',
                    'code' => '201'
                ]
            ])
            ->response()->setStatusCode(201);
    }
}
