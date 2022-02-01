<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Cecy\KPI\Planifications\ShowKpiRequest;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\DB;
use App\Notifications\DetailPlanificationChanged;
use App\Models\Cecy\Authority;
use App\Models\Cecy\Catalogue;
use App\Models\Cecy\Classroom;
use App\Models\Cecy\DetailPlanification;
use App\Models\Cecy\Instructor;
use App\Models\Cecy\Planification;
use App\Models\Core\Catalogue;
use App\Models\Core\State;
use App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications\GetDetailPlanificationsByPlanificationRequest;
use App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications\GetDetailPlanificationsByResponsibleCourseRequest;
use App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications\RegisterDetailPlanificationRequest;
use App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications\ShowDetailPlanificationRequest;
use App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications\UpdateDetailPlanificationRequest;
use App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications\DeleteDetailPlanificationRequest;
use App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications\DestroysDetailPlanificationRequest;
use App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications\GetPlanificationsByCourseRequest;
use App\Http\Requests\V1\Cecy\Planifications\UpdateDatesinPlanificationRequest;
use App\Http\Resources\V1\Cecy\DetailPlanifications\DetailPlanificationResource;
use App\Http\Resources\V1\Cecy\DetailsPlanifications\DetailPlanificationCollection;
use App\Http\Resources\V1\Cecy\Planifications\PlanificationByCourseCollection;
use App\Http\Resources\V1\Cecy\Planifications\PlanificationResource;
use App\Models\Cecy\Course;

class PerezController extends Controller
{
    public function __construct()
    {
        // $this->middleware('permission:view-planifications')->only(['view']);
        // $this->middleware('permission:update-planifications')->only(['view']);
        // $this->middleware('permission:view-detailPlanifications')->only(['view']);
        // $this->middleware('permission:store-detailPlanifications')->only(['store']);
        // $this->middleware('permission:update-detailPlanifications')->only(['update']);
        // $this->middleware('permission:delete-detailPlanifications')->only(['destroy']);
    }

    /**
     * Get all planifications filtered by and course
     */
    public function getPlanificationsByCourse(GetPlanificationsByCourseRequest $request, Course $course)
    {
        $sorts = explode(',', $request->sort);

        $planifications = $course->planifications()->customOrderBy($sorts)
            ->paginate($request->input('per_page'));

        return (new PlanificationByCourseCollection($planifications))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ])
            ->response()->setStatusCode(200);
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

        return (new DetailPlanificationCollection($detailPlanifications))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ])
            ->response()->setStatusCode(200);
    }

    /**
     * Get all detail planifications filtered by planification
     */
    public function getDetailPlanificationsByPlanification(GetDetailPlanificationsByPlanificationRequest $request)
    {
        // $sorts = explode(',', $request->sort);

        // $detailPlanifications = DetailPlanification::customOrderBy($sorts)
        // ->planification($request->input('planification.id'))
        // ->paginate($request->input('per_page'));

        $planification = Planification::find($request->input('planification.id'));
        $detailPlanifications = $planification
            ->detailPlanifications()
            ->paginate($request->input('per_page'));

        return (new DetailPlanificationCollection($detailPlanifications))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ])
            ->response()->setStatusCode(200);
    }

    /**
     * Store a detail planification record
     */
    public function registerDetailPlanification(RegisterDetailPlanificationRequest $request)
    {
        $loggedInInstructor = Instructor::where('user_id', $request->user()->id)->get();

        $planification = Planification::find($request->input('planification.id'));
        $responsibleCourse = $planification->reponsibleCourse();

        //validar que la planification le pertenezca al docente logeado
        // if ($loggedInInstructor->id !== $responsibleCourse->id) {
        //     return response()->json([
        //         'msg' => [
        //             'summary' => 'No le pertenece esta planificación',
        //             'detail' => '',
        //             'code' => '400'
        //         ]
        //     ], 400);
        // }

        //validar que la planification ha culminado
        if ($planification->state()->code === State::CULMINATED) {
            return response()->json([
                'msg' => [
                    'summary' => 'La planificación ha culminado.',
                    'detail' => '',
                    'code' => '400'
                ]
            ], 400);
        }

        $state = Catalogue::firstWhere('code', State::TO_BE_APPROVED);
        $classroom = Classroom::find($request->input('classroom.id'));
        $days = Catalogue::find($request->input('day.id'));
        $workday = Catalogue::find($request->input('workday.id'));
        $paralel = Catalogue::find($request->input('paralel.id'));

        $detailPlanification = new DetailPlanification();

        $detailPlanification->state()->associate($state);
        $detailPlanification->classroom()->associate($classroom);
        $detailPlanification->day()->associate($days);
        $detailPlanification->planification()->associate($planification);
        $detailPlanification->workday()->associate($workday);
        $detailPlanification->paralel()->associate($paralel);

        $detailPlanification->ended_time = $request->input('endedTime');
        $detailPlanification->started_time = $request->input('startedTime');

        if ($request->has('observations')) {
            $detailPlanification->observations = $request->input('observations');
        }

        $detailPlanification->save();

        return (new DetailPlanificationResource($detailPlanification))
            ->additional([
                'msg' => [
                    'summary' => 'Registro Creado',
                    'detail' => '',
                    'code' => '200'
                ]
            ])
            ->response()->setStatusCode(201);
    }

    /**
     * Return a detailPlanification record
     */
    public function showDetailPlanification(ShowDetailPlanificationRequest $request, DetailPlanification $detailPlanification)
    {
        return (new DetailPlanificationResource($detailPlanification))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ])
            ->response()->setStatusCode(200);
    }

    /**
     * Update a detail planification record
     */
    public function updateDetailPlanification(UpdateDetailPlanificationRequest $request, DetailPlanification $detailPlanification)
    {
        $loggedInstructor = Instructor::where('user_id', $request->user()->id)->get();
        $planification = Planification::find($request->input('planification.id'));
        $responsibleCourse = $planification->reponsibleCourse();

        if ($loggedInstructor->id !== $responsibleCourse->id) {
            return response()->json([
                'msg' => [
                    'summary' => 'No le pertece esta planificación',
                    'detail' => '',
                    'code' => '400'
                ]
            ], 400);
        }


        $classroom = Classroom::find($request->input('classroom.id'));
        $days = Catalogue::find($request->input('day.id'));
        $planification = Planification::find($request->input('planification.id'));
        $workday = Catalogue::find($request->input('workday.id'));
        $paralel = Catalogue::find($request->input('paralel.id'));

        $detailPlanification->classroom()->associate($classroom);
        $detailPlanification->day()->associate($days);
        $detailPlanification->planification()->associate($planification);
        $detailPlanification->workday()->associate($workday);
        $detailPlanification->paralel()->associate($paralel);

        $detailPlanification->ended_time = $request->input('endedTime');
        $detailPlanification->started_time = $request->input('startedTime');
        if ($request->has('observations')) {
            $detailPlanification->observations = $request->input('observations');
        }

        $detailPlanification->save();

        return (new DetailPlanificationResource($detailPlanification))
            ->additional([
                'msg' => [
                    'summary' => 'Registro actualizado',
                    'detail' => '',
                    'code' => '200'
                ]
            ])
            ->response()->setStatusCode(200);
    }

    /**
     * Update start_at and ended_at and needs in planification
     */
    public function updateDatesAndNeedsInPlanification(UpdateDatesinPlanificationRequest $request, Planification $planification)
    {
        $planification->started_at = $request->input('startedAt');
        $planification->ended_at = $request->input('endedAt');
        $planification->needs = $request->input('needs');

        return (new PlanificationResource($planification))
            ->additional([
                'msg' => [
                    'summary' => 'Registro actualizado',
                    'detail' => '',
                    'code' => '200'
                ]
            ])
            ->response()->setStatusCode(200);
    }

    /**
     * Delete a detail planification record
     */
    public function deleteDetailPlanification(DeleteDetailPlanificationRequest $request, DetailPlanification $detailPlanification)
    {
        $detailPlanification->delete();

        return (new DetailPlanificationResource($detailPlanification))
            ->additional([
                'msg' => [
                    'summary' => 'Registro eliminado',
                    'detail' => '',
                    'code' => '200'
                ]
            ])
            ->response()->setStatusCode(200);
    }

    /**
     * Delete a detail planification record
     */
    public function destroysDetailPlanifications(DestroysDetailPlanificationRequest $request)
    {
        $detailPlanifications = DetailPlanification::whereIn('id', $request->input('ids'))->get();
        DetailPlanification::destroy($request->input('ids'));

        return (new DetailPlanificationCollection($detailPlanifications))
            ->additional([
                'msg' => [
                    'summary' => 'Registros eliminados',
                    'detail' => '',
                    'code' => '200'
                ]
            ])
            ->response()->setStatusCode(200);
    }

    /**
     * KPI of planifications
     */
    public function kpi(ShowKpiRequest $request)
    {
        $planifications = Planification::withCount([
            'id' => function (Builder $query) {
                $query->where(
                    'state_id',
                    Catalogue::firstWhere('id', request()->input('state.id'))->id
                );
            },
        ])->get();

        return $planifications[0]->id_count;
    }
    /**
     * KPI of planificationsToBeApproved
     */
    public function planificationsToBeApproved($request)
    {
        $planifications = Planification::withCount([
            'id as planifications_to_be_approved' => function (Builder $query) {
                $query->where('state_id', State::TO_BE_APPROVED);
            },
        ])->get();

        return $planifications[0]->planifications_to_be_approved;
    }

    /**
     * KPI of planificationsInProcess
     */
    public function planificationsInProcess($request)
    {
        $planifications = Planification::withCount([
            'id as planifications_in_process' => function (Builder $query) {
                $query->where('state_id', State::IN_PROCESS);
            },
        ])->get();

        return $planifications[0]->planifications_in_process;
    }

    /**
     * KPI of planificationsCulminated
     */
    public function planificationsCulminated($request)
    {
        $planifications = Planification::withCount([
            'id as planifications_culminated' => function (Builder $query) {
                $query->where('state_id', State::CULMINATED);
            },
        ])->get();

        return $planifications[0]->planifications_culminated;
    }
}
