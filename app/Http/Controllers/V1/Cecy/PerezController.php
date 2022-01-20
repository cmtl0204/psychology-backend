<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Cecy\Planifications\UpdateDatesinPlanificationRequest;
use Illuminate\Support\Facades\DB;
use App\Notifications\DetailPlanificationChanged;
use App\Models\Cecy\Authority;
use App\Models\Cecy\Classroom;
use App\Models\Cecy\DetailPlanification;
use App\Models\Cecy\Planification;
use App\Models\Cecy\Instructor;
use App\Models\Core\Catalogue;
use App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications\GetDetailPlanificationsByPlanificationRequest;
use App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications\GetDetailPlanificationsByResponsibleCourseRequest;
use App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications\RegisterDetailPlanificationByResponsibleCourseRequest;
use App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications\ShowDetailPlanificationByResponsibleCourseRequest;
use App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications\UpdateDetailPlanificationByResponsibleCourseRequest;
use App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications\DeleteDetailPlanificationByResponsibleCourseRequest;
use App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications\GetPlanificationsByCourseRequest;
use App\Http\Resources\V1\Cecy\DetailPlanifications\ResponsibleCourseDetailPlanificationResource;
use App\Http\Resources\V1\Cecy\DetailsPlanifications\ResponsibleCourseDetailPlanificationCollection;
use App\Http\Resources\V1\Cecy\Planifications\PlanificationByCourseCollection;
use App\Http\Resources\V1\Cecy\Planifications\PlanificationResource;

class PerezController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:view-planifications')->only(['view']);
        $this->middleware('permission:update-planifications')->only(['view']);
        $this->middleware('permission:view-detailPlanifications')->only(['view']);
        $this->middleware('permission:store-detailPlanifications')->only(['store']);
        $this->middleware('permission:update-detailPlanifications')->only(['update']);
        $this->middleware('permission:delete-detailPlanifications')->only(['destroy']);
    }
    /**
     * Get all planifications filtered by responsible_course and course
     */
    public function getPlanificationsByCourse(GetPlanificationsByCourseRequest $request)
    {
        $planifications = Planification::where([
            ['responsible_course', $request->input('responsibleCourse.id')],
            ['course_id', $request->input('course.id')]
        ])->get();

        return (new PlanificationByCourseCollection($planifications))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
    /**
     * Get all detail planifications filtered by responsible_course
     */
    public function getDetailPlanificationsByResponsibleCourse(GetDetailPlanificationsByResponsibleCourseRequest $request)
    {
        $responsibleCourse = Instructor::where('user_id', $request->user()->id)->get();

        $detailPlanifications = $responsibleCourse
            ->detailPlanifications()
            ->paginate($request->input('per_page'));

        return (new ResponsibleCourseDetailPlanificationCollection($detailPlanifications))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
    /**
     * Get all detail planifications filtered by planification and course
     */
    public function getDetailPlanificationsByPlanification(GetDetailPlanificationsByPlanificationRequest $request)
    {

        $detailPlanifications = Planification::where([
            ['planification_id', $request->input('responsibleCourse.id')],
            ['course_id', $request->input('course.id')]
        ])->get();

        return (new ResponsibleCourseDetailPlanificationCollection($detailPlanifications))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
    /**
     * Store a detail planification record  
     */
    public function registerDetailPlanificationByResponsibleCourse(RegisterDetailPlanificationByResponsibleCourseRequest $request)
    {
        $classroom = Classroom::find($request->input('classroom.id'));
        $days = Catalogue::find($request->input('day.id'));
        $planification = Planification::find($request->input('planification.id'));
        $workday = Catalogue::find($request->input('workday.id'));

        $detailPlanification = new DetailPlanification();

        $detailPlanification->classroom()->associate($classroom);
        $detailPlanification->day()->associate($days);
        $detailPlanification->planification()->associate($planification);
        $detailPlanification->workday()->associate($workday);

        $detailPlanification->paralel = $request->input('paralel');
        $detailPlanification->days_number = $request->input('daysNumber');
        $detailPlanification->ended_time = $request->input('endedTime');
        $detailPlanification->started_time = $request->input('startedTime');

        DB::transaction(function () use ($request, $detailPlanification) {
            $detailPlanification->save();
            $detailPlanification->instructors()->attach($request->input('instructors.id'));
        }, 5);

        return (new ResponsibleCourseDetailPlanificationResource($detailPlanification))
            ->additional([
                'msg' => [
                    'summary' => 'Registro Creado',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
    /**
     * Return a detailPlanification record
     */
    public function showDetailPlanificationByResponsibleCourse(ShowDetailPlanificationByResponsibleCourseRequest $request, DetailPlanification $detailPlanification)
    {
        return (new ResponsibleCourseDetailPlanificationResource($detailPlanification))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
    /**
     * Update a detail planification record
     */
    public function updateDetailPlanificationByResponsibleCourse(UpdateDetailPlanificationByResponsibleCourseRequest $request, DetailPlanification $detailPlanification)
    {
        $responsableCecyId = $detailPlanification->planification()->responsable_cecy_id;
        $responsableCecy = Authority::find($responsableCecyId);
        $user = $responsableCecy->user();

        $classroom = Classroom::find($request->input('classroom.id'));
        $days = Catalogue::find($request->input('day.id'));
        $planification = Planification::find($request->input('planification.id'));
        $workday = Catalogue::find($request->input('workday.id'));


        $detailPlanification->classroom()->associate($classroom);
        $detailPlanification->day()->associate($days);
        $detailPlanification->planification()->associate($planification);
        $detailPlanification->workday()->associate($workday);

        $detailPlanification->paralel = $request->input('paralel');
        $detailPlanification->days_number = $request->input('daysNumber');
        $detailPlanification->ended_time = $request->input('endedTime');
        $detailPlanification->started_time = $request->input('startedTime');

        DB::transaction(function () use ($request, $detailPlanification, $user) {
            $detailPlanification->save();
            // $detailPlanification->instructors()->updateExistingPivot($request->input('instructors.id'));
            $detailPlanification->instructors()->updateExistingPivot($request->input('instructors.id'), ['instructor_id']);
            //$user es el responsable de cecy
            // $user->notify(new DetailPlanificationChanged($detailPlanification));
        }, 5);

        return (new ResponsibleCourseDetailPlanificationResource($detailPlanification))
            ->additional([
                'msg' => [
                    'summary' => 'Registro Creado',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
    /**
     * Update start_at and ended_at in planification 
     */
    public function updateDatesinPlanificationRequest(UpdateDatesinPlanificationRequest $request, Planification $planification)
    {
        $planification->started_at = $request->input('startedAt');
        $planification->started_time = $request->input('startedTime');

        return (new PlanificationResource($planification))
            ->additional([
                'msg' => [
                    'summary' => 'Registro Creado',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
    /**
     * Delete a detail planification record
     */
    public function deleteDetailPlanificationByResponsibleCourse(DeleteDetailPlanificationByResponsibleCourseRequest $request, DetailPlanification $detailPlanification)
    {
        $instructors = $detailPlanification->instructors();

        DB::transaction(function () use ($instructors, $detailPlanification) {
            $detailPlanification->instructors()->detach($instructors);
            $detailPlanification->delete();
        }, 5);


        return (new ResponsibleCourseDetailPlanificationResource($detailPlanification))
            ->additional([
                'msg' => [
                    'summary' => 'Registro eliminado',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
}
