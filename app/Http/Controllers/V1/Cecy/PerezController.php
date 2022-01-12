<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Models\Cecy\DetailPlanification;
use App\Models\Cecy\Planification;
use App\Models\Core\Catalogue;
use App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications\IndexResponsibleCourseDetailPlanificationRequest;
use App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications\ShowResponsibleCourseDetailPlanificationRequest;
use App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications\StoreResponsibleCourseDetailPlanificationRequest;
use App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications\UpdateResponsibleCourseDetailPlanificationRequest;
use App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications\DeteleResponsibleCourseDetailPlanificationRequest;
use App\Http\Resources\V1\Cecy\DetailPlanifications\ResponsibleCourseDetailPlanificationResource;
use App\Http\Resources\V1\Cecy\DetailsPlanifications\ResponsibleCourseDetailPlanificationCollection;

class PerezController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:view-detailPlanifications')->only(['view']);
        $this->middleware('permission:store-detailPlanifications')->only(['store']);
        $this->middleware('permission:update-detailPlanifications')->only(['update']);
        $this->middleware('permission:delete-detailPlanifications')->only(['destroy']);
    }

    public function index(IndexResponsibleCourseDetailPlanificationRequest $request)
    {
        $detailPlanifications = DetailPlanification::where(
            'planification_id',
            '=',
            $request->input('planification.id')
        )->get();

        foreach ($detailPlanifications as $detailPlanification) {
            $detailPlanification->instructors = $detailPlanification->detailInstructors();
        }

        return (new ResponsibleCourseDetailPlanificationCollection($detailPlanifications))
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
        return (new ResponsibleCourseDetailPlanificationResource($detailPlanification))
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

    public function destroy(DeteleResponsibleCourseDetailPlanificationRequest $request)
    {
        $detailPlanification = DetailPlanification::find($request->input('detailPlanification.id'));
        $detailPlanification->delete();
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
// $detailPlanifications = DB::table('users')
        //     ->join('instructors', function ($join) {
        //         $join->on('users.id', '=', 'instructors.user_id')
        //             ->where('instructors.user_id', '=', request()->user()->id);
        //     })
        //     ->join('detail_instructors', 'instructors.id', 'instructor_id')
        //     ->join('detail_planifications', 'detail_planifications.id', 'detail_planification_id')
        //     ->join('planifications', '.planifications.id', 'planification_id')
        //     ->join('school_periods', 'school_periods.id', 'school_period_id')
        //     ->join('school_periods', function ($join, $re) {
        //         $join->on('school_periods.id', '=', 'planifications.school_period_id')
        //             ->where('planifications.school_period_id', '=', request()->input('school_period_id'));
        //     })
        //     ->join('', 'school_periods.id', 'school_period_id')
        //     ->select('detail_planifications.*', 'user.name', 'school_periods.name')
        //     ->get();


        // $detailInstructors = $instructor->detailInstructors();

        // $detailPlanifications = [];

        // foreach ($detailInstructors as $detailInstructor) {
        //     $detailInstructor->detailPlanification();
        //     array_push($detailPlanifications, $detailInstructor->detailPlanification());
        // }