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
        // $this->middleware('permission:store-catalogues')->only(['store']);
        // $this->middleware('permission:update-catalogues')->only(['update']);
        // $this->middleware('permission:delete-catalogues')->only(['destroy', 'destroys']);
    }

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

    public function showPlanification(Planification $planification)
    {
        return (new ResponsibleCoursePlanificationResource($planification))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }


    public function storePlanification($request)
    {
        $course = Course::find($request->input('course.id'));
        $schoolPeriod = SchoolPeriod::find($request->input('schoolPeriod.id'));
        $responsibleCourse = Authority::find($request->input('responsibleCourse.id'));

        $planification = new Planification();

        $planification->course()->associate($course);
        $planification->schoolPeriod()->associate($schoolPeriod);
        $planification->responsibleCourse()->associate($responsibleCourse);

        $planification->started_at = $request->input('started_at');
        $planification->ended_at = $request->input('ended_at');

        $planification->save();

        return (new ResponsibleCoursePlanificationResource($planification))
            ->additional([
                'msg' => [
                    'summary' => 'Registro Creado',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    public function updatePlanification($request)
    {
        /**
         * 
         */
    }
    public function deletePlanification($request)
    {
        /**
         * 
         */
    }

    /**
     * Detail planifications
     */

    public function getAll($request)
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

    public function storePlanificationDetail($request)
    {
        $planification = Planification::find($request->input('planification.id'));
        $classroom = Classroom::find($request->input('classroom.id'));
        $days = Catalogue::find($request->input('day.id'));
        $workday = Catalogue::find($request->input('workday.id'));

        $detailPlanification = new DetailPlanification();

        $detailPlanification->planification()->associate($planification);
        $detailPlanification->classroom()->associate($classroom);
        $detailPlanification->day()->associate($days);

        $detailPlanification->started_at = $request->input('started_at');
        $detailPlanification->ended_at = $request->input('ended_at');
        $detailPlanification->plan_ended_at = $request->input('plan_ended_at');


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

    public function showDetailPlanification(DetailPlanification $detailPlanification)
    {
        return (new DetailPlanificactionResource($detailPlanification))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    public function updatePlanificationDetail($request)
    {
        /**
         * 
         */
    }
    public function deletePlanificationDetail($request)
    {
        /**
         * 
         */
    }
}
