<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Resources\V1\Cecy\DetailPlanifications\ResponsibleCourseDetailPlanificationResource;
use App\Http\Resources\V1\Cecy\DetailsPlanifications\ResponsibleCourseDetailPlanificationCollection;
use App\Models\Cecy\Authority;
use App\Models\Cecy\Course;
use App\Models\Cecy\DetailPlanification;
use App\Models\Cecy\Planification;
use App\Models\Cecy\SchoolPeriod;
use App\Models\Core\Catalogue;
use App\Http\Resources\V1\Cecy\Planifications\ResponsibleCoursePlanificationResource;
use App\Http\Resources\V1\Cecy\Planifications\ResponsibleCoursePlanificationCollection;

class PerezController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:view-detailPlanifications')->only(['view']);
        $this->middleware('permission:store-detailPlanifications')->only(['store']);
        $this->middleware('permission:update-detailPlanifications')->only(['update']);
        $this->middleware('permission:delete-detailPlanifications')->only(['destroy']);
        $this->middleware('permission:view-planifications')->only(['view']);
    }
    /**
     *  Planifications
     */

    public function getPlanifications($request)
    {
        $responsibleCourse = Authority::find($request->input('responsibleCourse.id'));
        $schoolPeriod = SchoolPeriod::find($request->input('schoolPeriod.id'));

        $planifications = $responsibleCourse->planifications()
            ->paginate();

        return (new ResponsibleCoursePlanificationCollection($planifications))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
    /**
     * Detail planifications
     */

    public function index(IndexResponsibleCourseDetailPlanificationRequest $request)
    {
        $planification = Planification::find($request->input('planification.id'));

        $detailplanifications = $planification->detailPlanifications()
            ->paginate();

        return (new ResponsibleCourseDetailPlanificationCollection($detailplanifications))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    public function store(StoreResponsibleCourseDetailPlanificationRequest $request)
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

        $detailPlanification->days_number = $request->input('days_number');
        $detailPlanification->ended_at = $request->input('ended_at');
        $detailPlanification->plan_ended_at = $request->input('plan_ended_at');
        $detailPlanification->started_at = $request->input('started_at');

        $detailPlanification->save();

        return (new ResponsibleCourseDetailPlanificationResource($detailPlanification))
            ->additional([
                'msg' => [
                    'summary' => 'Registro Creado',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    public function show(ShowResponsibleCourseDetailPlanificationRequest $request)
    {
        $detailPlanification = DetailPlanification::find($request->input('detailPlanification.id'));
        return (new DetailPlanificactionResource($detailPlanification))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    public function update(UpdateResponsibleCourseDetailPlanificationRequest $request)
    {
        $classroom = Classroom::find($request->input('classroom.id'));
        $days = Catalogue::find($request->input('day.id'));
        $planification = Planification::find($request->input('planification.id'));
        $workday = Catalogue::find($request->input('workday.id'));

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

        return (new ResponsibleCourseDetailPlanificationResource($detailPlanification))
            ->additional([
                'msg' => [
                    'summary' => 'Registro Creado',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    public function delete(DeteleResponsibleCourseDetailPlanificationRequest $request)
    {
        $detailPlanification = DetailPlanification::find($request->input('detailPlanification.id'));
        $detailPlanification->delete();
        return (new DetailPlanificactionResource($detailPlanification))
            ->additional([
                'msg' => [
                    'summary' => 'Registro eliminado',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
}
