<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Resources\V1\Cecy\DetailPlanifications\DetailPlanificationResource;
use App\Http\Resources\V1\Cecy\SchoolPeriods\SchoolPeriodsCollection;
use App\Http\Resources\V1\Cecy\Planifications\PlanificationCollection;
use App\Http\Resources\V1\Cecy\Planifications\PlanificationResource;
use App\Http\Resources\V1\Cecy\Courses\CourseResource;
use App\Http\Resources\V1\Cecy\Notifications\IndexNotificationResource;
use App\Http\Requests\V1\Cecy\DetailPlanifications\UpdateDetailPlanificationRequest;
use App\Http\Requests\V1\Cecy\Planifications\UpdatePlanificationRequest;
use App\Http\Requests\V1\Cecy\Courses\GetCoursesByCoordinatorRequest;
use App\Http\Requests\V1\Cecy\Planifications\GetPlanificationsByResponsibleCecyRequest;
use App\Http\Requests\V1\Cecy\Planifications\StorePlanificationByCourseRequest;
use App\Http\Requests\V1\Cecy\Planifications\IndexPlanificationRequest;
use App\Models\Cecy\Authority;
use App\Models\Cecy\Classroom;
use App\Models\Cecy\Course;
use App\Models\Cecy\DetailSchoolPeriod;
use App\Models\Cecy\Instructor;
use App\Models\Cecy\DetailPlanification;
use App\Models\Cecy\Planification;
use App\Models\Core\Catalogue;

class GuanunaController extends Controller
{
    // public function __construct()
    // {
    //     $this->middleware('permission:view-Planifications')->only(['view']);
    //     $this->middleware('permission:store-Planifications')->only(['store']);
    //     $this->middleware('permission:store-detailPlanifications')->only(['store']);
    //     $this->middleware('permission:update-detailPlanifications')->only(['update']);
    //     $this->middleware('permission:view-details_planifications')->only(['view']);
    //}
    /**
     *  Planifications
     */

    //--Coordinador de carrera
    //obtener informacion de los cursos planificacion al coordinadoor de carrera
    public function getPlanificationsByCareer(GetCoursesByCoordinatorRequest $request)
    {
        $career = Career::find($request->input('career.id'));

        $Planifications = $career
            ->planifications()
            ->course()
            ->instructor()
            ->paginate($request->input('per_page'));

        return (new PlanificationCollection($Planifications))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

// asignar responsable
    public function storePlanificationByCourse(StorePlanificationByCourseRequest $request)
    {
        $planifications = new Planification();
        $planifications->course()->associate(Course::find($request->input('name')));
        $planifications->participant_type_id()->associate(Course::find($request->input('participant_type_id')));
        $planifications->duration()->associate(Course::find($request->input('duration')));
        $planifications->responsibleCourse()->associate(Instructor::find($request->input('user.id')));
        $planifications->ended_at = $request->input('fin de la planificación');
        $planifications->started_at = $request->input('inicio de la planificación');
        $planifications->state_id = $request->input('Estado de la planificacion');
        $planifications->save();

        return (new PlanificationResource($planifications))
            ->additional([
                'msg' => [
                    'summary' => 'planificación creada',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

//crear curso no existente
    public function storePlanificationCourseNew(StorePlanificationByCourseRequest $request)
    {
        $courses = new Course();
        $courses->name = $request->input('search');
        $courses->participant_type_id = $request->input('search');
        $courses->state_id = $request->input('estado del curso');
        $courses->duration = $request->input('search');
        $courses->started_at()->associate(Planification::find($request->input('fecha inicio de planificacion')));
        $courses->ended_at()->associate(Planification::find($request->input('fecha fin de planificacion')));
        $courses->save();

        return (new CourseResource($courses))
            ->additional([
                'msg' => [
                    'summary' => 'Curso creado',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

//consultar de la planificacion
    public function getPlanification(IndexPlanificationRequest $planifications)
    {
        return (new PlanificationCollection ($planifications))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

///Responsable del CECY
//mostrar informacion al responsable del cecy
    public function getPlanificationByResponsibleCecy(GetPlanificationsByResponsibleCecyRequest $request)
    {

        {
            $user = Authority::where('user_id', $request->user()->id)->get();

            $Planifications = $user
                ->Planifications()
                ->Courses()
                ->instructors()
                ->paginate($request->input('per_page'));

            return (new PlanificationCollection($Planifications))
                ->additional([
                    'msg' => [
                        'summary' => 'success',
                        'detail' => '',
                        'code' => '200'
                    ]
                ]);
        }
    }

//actualizar informacion de la planificacion
    public function updatePlanificationByCecy(UpdatePlanificationRequest $request, Planification $planification)
    {
        $planification->course()->associate(Course::find($request->input('course.id')));
        $planification->detail_school_period()->associate(DetailSchoolPeriod::find($request->input('detail_school_period.id')));
        $planification->vicerrector()->associate(Authority::find($request->input('vicerrector.id')));
        $planification->responsible_ocs()->associate(Catalogue::find($request->input('responsible_ocs.id')));
        $planification->aproved_at = $request->input('aproved_at');
        $planification->code = $request->input('code');
        $planification->ended_at = $request->input('ended_at');
        $planification->needs = $request->input('needs');
        $planification->observation = $request->input('observation');
        $planification->started_at = $request->input('started_at');
        $planification->save();
    }

//actualizar informacion del detalle planificación
    public function updatedetailPlanificationByCecy(UpdateDetailPlanificationRequest $request)
    {
        $classroom = Classroom::find($request->input('classroom.id'));
        $days = Catalogue::find($request->input('day.id'));
        $planification = Planification::find($request->input('planification.id'));
        $workday = Catalogue::find($request->input('workday.id'));
        $state = Catalogue::find($request->input('state.id'));

        $detailPlanification = DetailPlanification::find($request->input('detailPlanification.id'));

        $detailPlanification->classroom()->associate($classroom);
        $detailPlanification->day()->associate($days);
        $detailPlanification->planification()->associate($planification);
        $detailPlanification->workday()->associate($workday);

        $detailPlanification->days_number = $request->input('days_number');
        $detailPlanification->ended_at = $request->input('ended_at');
        $detailPlanification->plan_ended_at = $request->input('plan_ended_at');
        $detailPlanification->started_at = $request->input('started_at');
        $detailPlanification->save();

        return (new DetailPlanificationResource ($detailPlanification))
            ->additional([
                'msg' => [
                    'summary' => 'Actualizado correctamente',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

//recibir notificaciones
    public function notification(NotificationRequest $notification)
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
        $user = Authority::where('user_id', $request->user()->id)->get();
    }
}
