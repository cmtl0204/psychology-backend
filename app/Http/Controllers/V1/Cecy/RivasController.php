<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Cecy\Courses\IndexCourseRequest;
use App\Http\Requests\V1\Cecy\Participants\IndexParticipantRequest;
use App\Http\Requests\V1\Cecy\Participants\StoreParticipantRequest;
use App\Http\Requests\V1\Cecy\Participants\UpdateParticipantRequest;
use App\Http\Requests\V1\Cecy\Planifications\IndexPlanificationRequest;
use App\Http\Requests\V1\Cecy\Registrations\IndexRegistrationRequest;
use App\Http\Requests\V1\Core\Users\IndexUserRequest;
use App\Http\Resources\V1\Cecy\Courses\CourseResource;
use App\Http\Resources\V1\Cecy\Participants\ParticipantResource;
use App\Http\Resources\V1\Cecy\Planifications\PlanificationByResponsibleCourseCollection;
use App\Http\Resources\V1\Cecy\Planifications\PlanificationCollection as PlanificationsPlanificationCollection;
use App\Http\Resources\V1\Cecy\Prerequisites\PlanificationCollection;
use App\Http\Resources\V1\Cecy\Registrations\RegistrationCollection;
use App\Http\Resources\V1\Cecy\Registrations\RegistrationResource;
use App\Http\Resources\V1\Cecy\SchoolPeriods\SchoolPeriodsCollection;
use App\Http\Resources\V1\Core\Users\UserResource;
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
    /*DDRC-C: Busca planificaciones vigentes por periodo */
    public function getPlanificationsByPeriod(InstructorRequest $request)
    {
        $user = Instructor::where('user_id', $request->user()->id)->get();

        $Planifications = $user
            ->planifications()
            ->course()
            ->paginate($request->input('per_page'));

        return (new PlanificationByResponsibleCourseCollection($Planifications))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
    /*DDRC-C: Busca participantes de un curso especifico*/
    public function getCourseParticipants(IndexRegistrationRequest $request)
    {
        $registrations = Registration::find($request->input('registrations.id'))
        ->participant()
        ->get();

        return (new RegistrationCollection($registrations))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
    /*DDRC-C: Busca informacion de un participante y de registro a un curso especifico */
    public function getParticipantInfo(IndexUserRequest $request)
    {
        $sorts = explode(',', $request->sort);

        $registrations = Registration::find($request->input('registrations.id'))
        ->participant()
        ->AdditionalInformation()
        ->paginate($request->input('per_page'));
        

        return (new RegistrationCollection($registrations))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
    /*DDRC-C: actualiza una inscripcion, cambiando la observacion de una inscripción de un participante en un curso especifico  */
    public function updateParticipantRegistration(UpdateRegistrationRequest $request, Registration $registration)
    {
        
        
        $registration->observation = $request->input('observation');
        $registration->save();
        
        return (new RegistrationResource($registration))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    /*DDRC-C: Matricula a varios participantes */
    public function RegisterParticipants(RegistrationRequest $request)
    {
        if (in_array($request->registration()->id, $request->ids)) {
            return response()->json([
                'msg' => [
                    'summary' => 'Error al eliminar',
                    'detail' => 'El usuario se encuentra logueado',
                    'code' => '400'
                ],
            ], 400);
        }

        $registration = Registration::whereIn('id', $request->input('ids'))->get();

        $registration->save();

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
    /*DDRC-C: Anulas varias Matriculas */
    public function nullifyRegistrations(DestroysRegistrationRequest $request)
    {
        if (in_array($request->registration()->id, $request->ids)) {
            return response()->json([
                'msg' => [
                    'summary' => 'Error al eliminar',
                    'detail' => 'El usuario se encuentra logueado',
                    'code' => '400'
                ],
            ], 400);
        }

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
            ]);
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
            ]);
    }
    /*DDRC-C: notifica a un participante de una observacion en su inscripcion*/
    public function notifyParticipant(NotificationRequest $notification)
    {
        
        $notification = Notification::where('id', $request->id)->get();
        
        return (new NotificationResource($notification))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
        $user = Instructor::where('user_id', $request->user()->id)->get();
    }
    /*DDRC-C: elimina una matricula de un participante en un curso especifico */
    public function nullifyRegistration(Request $request,Registration $registration)
    {
        $registration->delete();

        return (new UserResource($registration))
            ->additional([
                'msg' => [
                    'summary' => 'Usuario Eliminado',
                    'detail' => '',
                    'code' => '201'
                ]
            ])
            ->response()->setStatusCode(201);
    }
}
