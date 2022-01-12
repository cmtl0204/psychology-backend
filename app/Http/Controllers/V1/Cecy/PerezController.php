<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Models\Cecy\Classroom;
use App\Models\Cecy\DetailPlanification;
use App\Models\Cecy\Planification;
use App\Models\Cecy\Instructor;
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

    public function getDetailPlanificationsByResponsibleCourse(IndexResponsibleCourseDetailPlanificationRequest $request)
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

    public function registerDetailPlanificationByResponsibleCourse(StoreResponsibleCourseDetailPlanificationRequest $request)
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

        $detailPlanification->instructors()->attach($request->input('instructors.id'));

        $detailPlanification->days_number = $request->input('daysNumber');
        $detailPlanification->ended_at = $request->input('endedAt');
        $detailPlanification->ended_time = $request->input('endedTime');
        $detailPlanification->started_at = $request->input('startedAt');
        $detailPlanification->started_time = $request->input('startedTime');

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

    public function showDetailPlanificationByResponsibleCourse(ShowResponsibleCourseDetailPlanificationRequest $request)
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

    public function updateDetailPlanificationByResponsibleCourse(UpdateResponsibleCourseDetailPlanificationRequest $request)
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

        $detailPlanification->instructors()->attach($request->input('instructors.id'));

        $detailPlanification->days_number = $request->input('daysNumber');
        $detailPlanification->ended_at = $request->input('endedAt');
        $detailPlanification->ended_time = $request->input('endedTime');
        $detailPlanification->started_at = $request->input('startedAt');
        $detailPlanification->started_time = $request->input('startedTime');

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

    public function deleteDetailPlanificationByResponsibleCourse(DeteleResponsibleCourseDetailPlanificationRequest $request)
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
