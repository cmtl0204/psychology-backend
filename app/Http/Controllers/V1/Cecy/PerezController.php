<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Core\Catalogues\IndexCatalogueRequest;
use App\Http\Requests\V1\Core\Files\DestroysFileRequest;
use App\Http\Requests\V1\Core\Files\IndexFileRequest;
use App\Http\Requests\V1\Core\Files\UpdateFileRequest;
use App\Http\Requests\V1\Core\Files\UploadFileRequest;
use App\Http\Resources\V1\Core\Catalogues\CatalogueCollection;
use App\Models\Cecy\Authority;
use App\Models\Cecy\Catalogue as CecyCatalogue;
use App\Models\Cecy\Course;
use App\Models\Cecy\DetailPlanification;
use App\Models\Cecy\Planification;
use App\Models\Cecy\SchoolPeriod;
use App\Models\Core\Catalogue;
use App\Models\Core\File;

class PerezController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:store-catalogues')->only(['store']);
        $this->middleware('permission:update-catalogues')->only(['update']);
        $this->middleware('permission:delete-catalogues')->only(['destroy', 'destroys']);
    }

    /**
     * Planificacions
     */

    public function getPlanifications($request, Authority $responsibleCourse)
    {
        /**
         * get course, school period, responsable, state,  start and end dates
         * participant type
         */
        $planifications = $responsibleCourse->planifications()
            ->paginate();

        return (new PlanificationCollection($planifications))
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
        return (new PlanificactionResource($planification))
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
        $state = CecyCatalogue::find($request->input('state.id'));
        $course = Course::find($request->input('course.id'));
        $schoolPeriod = SchoolPeriod::find($request->input('schoolPeriod.id'));
        $responsibleCourse = Authority::find($request->input('responsibleCourse.id'));

        $planification = new Planification();

        $planification->course()->associate($course);
        $planification->schoolPeriod()->associate($schoolPeriod);
        $planification->responsibleCourse()->associate($responsibleCourse);
        $planification->state()->associate($state);

        $planification->started_at = $request->input('started_at');
        $planification->ended_at = $request->input('ended_at');

        $planification->save();

        return (new PlanificationResource($planification))
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
        /**
         * get planification, classroom, workday, days, time, instructores
         */
    }

    public function storePlanificationDetail($request)
    {
        /**
         *
         */
        $planification = Planification::find($request->input('planification.id'));
        $classroom = Classroom::find($request->input('classroom.id'));
        $days = CecyCatalogue::find($request->input('day.id'));
        $workday = CecyCatalogue::find($request->input('workday.id'));

        $detailplanification = new DetailPlanification();

        $detailplanification->planification()->associate($planification);
        $detailplanification->classroom()->associate($classroom);
        $detailplanification->day()->associate($days);

        $detailplanification->started_at = $request->input('started_at');
        $detailplanification->ended_at = $request->input('ended_at');
        $detailplanification->plan_ended_at = $request->input('plan_ended_at');


        $detailplanification->save();

        return (new DetailPlanificationResource($detailPlanification))
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

    /**
     * Catalogues
     */
    public function allCataloguesTypes(IndexCatalogueRequest $request)
    {
        $catalogues = Catalogue::orderBy('name')
            ->type($request->query('type'))
            ->paginate();

        return (new CecyCatalogueCollection($catalogues))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }


    public function index(IndexCatalogueRequest $request)
    {
        $sorts = explode(',', $request->sort);

        $catalogues = Catalogue::customOrderBy($sorts)
            ->type($request->input('type'))
            ->paginate();

        return (new CatalogueCollection($catalogues))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    public function all(IndexCatalogueRequest $request)
    {
        $catalogues = Catalogue::orderBy('name')
            ->type($request->input('type'))
            ->paginate($request->input('per_page'));

        return (new CatalogueCollection($catalogues))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    // Files
    public function indexFiles(IndexFileRequest $request, Catalogue $catalogue)
    {
        return $catalogue->indexFiles($request);
    }

    public function uploadFile(UploadFileRequest $request, Catalogue $catalogue)
    {
        return $catalogue->uploadFile($request);
    }

    public function downloadFile(Catalogue $catalogue, File $file)
    {
        return $catalogue->downloadFile($file);
    }

    public function showFile(Catalogue $catalogue, File $file)
    {
        return $catalogue->showFile($file);
    }

    public function updateFile(UpdateFileRequest $request, Catalogue $catalogue, File $file)
    {
        return $catalogue->updateFile($request, $file);
    }

    public function destroyFile(Catalogue $catalogue, File $file)
    {
        return $catalogue->destroyFile($file);
    }

    public function destroyFiles(Catalogue $catalogue, DestroysFileRequest $request)
    {
        return $catalogue->destroyFiles($request);
    }
}
