<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Models\Core\State;
use App\Http\Resources\V1\Cecy\DetailPlanifications\DetailPlanificationResource;
use App\Http\Resources\V1\Cecy\SchoolPeriods\SchoolPeriodsCollection;
use App\Http\Resources\V1\Cecy\Planifications\PlanificationCollection;
use App\Http\Resources\V1\Cecy\Planifications\PlanificationResource;
use App\Http\Resources\V1\Cecy\Courses\CourseResource;
use App\Http\Resources\V1\Cecy\Notifications\IndexNotificationResource;
use App\Http\Requests\V1\Cecy\DetailPlanifications\UpdateDetailPlanificationRequest;
use App\Http\Requests\V1\Cecy\Planifications\UpdatePlanificationRequest;
use App\Http\Requests\V1\Cecy\Courses\GetCoursesByCareerRequest;
use App\Http\Requests\V1\Cecy\Planifications\GetPlanificationsByResponsibleCecyRequest;
use App\Http\Requests\V1\Cecy\Planifications\StorePlanificationByCourseRequest;
use App\Http\Requests\V1\Cecy\Planifications\IndexPlanificationRequest;
use App\Http\Resources\V1\Core\CareerResource;
use App\Models\Cecy\Authority;
use App\Models\Cecy\Classroom;
use App\Models\Cecy\Course;
use App\Models\Cecy\DetailSchoolPeriod;
use App\Models\Cecy\Instructor;
use App\Models\Cecy\DetailPlanification;
use App\Models\Cecy\Planification;
use App\Models\Core\Career;
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
    //filtrar cursos por carrera
    public function getCoursesByCareer(GetCoursesByCareerRequest $request, Career $career)
    {
        $sorts = explode(',', $request->sort);

        $courses = Course::customOrderBy($sorts)
            ->career(($request->input('career.id')))
            ->state(($request->input('state.id')))
            ->paginate($request->input('per_page'));

        return (new CourseResource($courses))
            ->additional([
                'msg' => [
                    'summary' => '',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

// asignar responsable a una planificacion
    public function storePlanificationByCourse(StorePlanificationByCourseRequest $request)
    {
        $planifications = new Planification();
        $planifications->course()->associate(Course::find($request->input('name')));
        $planifications->participant_type()->associate(Course::find($request->input('participant_type.id')));
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
    public function storeCourseNew(StorePlanificationByCourseRequest $request, Course $course)
    {
        $course = new Course();
        $course->name = $request->input('search');
        $course->participant_type = $request->input('search');
        $course->state = $request->input('estado del curso');
        $course->duration = $request->input('search');
        // $courses->started_at()->associate(Planification::find($request->input('fecha inicio de planificacion')));
        // $courses->ended_at()->associate(Planification::find($request->input('fecha fin de planificacion')));
        $course->save();

        return (new CourseResource($course))
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
    public function getPlanificationByResponsibleCecy(GetPlanificationsByResponsibleCecyRequest $request, Career $career)
    {

        $sorts = explode(',', $request->sort);

        $courses = Course::customOrderBy($sorts)
            ->career(($request->input('career.id')))
            ->state(($request->input('state.id')))
            ->paginate($request->input('per_page'));

        return (new CourseResource($courses))
            ->additional([
                'msg' => [
                    'summary' => '',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

//actualizar informacion del detalle planificación
public function updatedetailPlanificationByCecy(UpdateDetailPlanificationRequest $request)
{
    $loggedAuthority = Authority::where('user_id', $request->user()->id)->get();
    $planification = Planification::find($request->input('planification.id'));

    $classroom = Classroom::find($request->input('classroom.id'));
    $days = Catalogue::find($request->input('day.id'));
    $planification = Planification::find($request->input('planification.id'));
    $workday = Catalogue::find($request->input('workday.id'));
    $state = Catalogue::find($request->input('state.id'));

    $detailPlanification = DetailPlanification::find($request->input('detailPlanification.id'));

    $detailPlanification->classroom()->associate($classroom);
    $detailPlanification->day()->associate($days);
    //$detailPlanification->planification()->associate($planification);
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
//actualizar informacion de la planificacion
public function updatePlanificationByCecy(UpdatePlanificationRequest $request, Planification $planification)
{
    $loggedAuthority = Authority::where('user_id', $request->user()->id)->get();
    $planification = Planification::find($request->input('planification.id'));
    $responsibleCecy = $planification->reponsibleCecy();

    $planification->course()->associate(Course::find($request->input('course.id')));
    $planification->detail_school_period()->associate(DetailSchoolPeriod::find($request->input('detail_school_period.id')));
    $planification->vicerrector()->associate(Authority::find($request->input('vicerrector.id')));
    $planification->responsible_ocs()->associate(Catalogue::find($request->input('responsible_ocs.id')));
    $planification->ended_at = $request->input('ended_at');
    $planification->started_at = $request->input('started_at');
    $planification->save();
}
//Asignar codigo a la planificacion
public function assignCodeToPlanification(Planification $planification, $request)
{
    $planification->code=$request->input('code');
    return (new PlanificationResource($planification))
    ->additional([
        'msg' => [
            'summary' => 'Curso actualizado',
            'detail' => '',
            'code' => '200'
        ]
    ]);

}

//Aprobacion de planificacion
public function approvePlanification($request, Planification $planification)
{
$planification->state()->associate(State::FirstWhere('code', State::APPROVED));
$planification->observation = $request->input('observation');
$planification->save();

return (new PlanificationResource($planification))
    ->additional([
        'msg' => [
            'summary' => 'Planificacion actualizada',
            'detail' => '',
            'code' => '200'
        ]
    ]);
}



//recibir notificaciones
    // public function notification(NotificationRequest $notification)
    // {

    //     $notification = Notification::where('id', $request->id)->get();

    //     return (new NotificationResource($notification))
    //         ->additional([
    //             'msg' => [
    //                 'summary' => 'success',
    //                 'detail' => '',
    //                 'code' => '200'
    //             ]
    //         ]);
    //     $user = Authority::where('user_id', $request->user()->id)->get();
    // }
}
