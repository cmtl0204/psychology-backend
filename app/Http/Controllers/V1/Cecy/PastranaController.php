<?php

namespace App\Http\Controllers\V1\Cecy;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Cecy\Courses\GetCoursesByCoordinatorCecyRequest;
use App\Http\Requests\V1\Core\Files\UploadFileRequest;
use App\Http\Resources\V1\Cecy\Courses\CourseByCoordinatorCecyCollection;
use App\Models\Cecy\DetailPlanification;
use App\Models\Cecy\Catalogue;
use App\Models\Cecy\Course;
use App\Http\Resources\V1\Cecy\DetailPlanifications\DetailPlanificationResource;
use App\Http\Resources\V1\Cecy\DetailPlanifications\DetailPlanificationCollection;

class PastranaController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:view-courses')->only(['view']);
        $this->middleware('permission:view-planification')->only(['view']);
    }
    /**
     * Obtener cursos y Filtrarlos por peridos lectivos , carrera o estado
     */
    public function getCoursesByCoordinatorCecy(GetCoursesByCoordinatorCecyRequest $request)
    {
        $sorts = explode(',', $request->sort);

        $courses = Course::customOrderBy($sorts)
            ->career(($request->input('career.id')))
            ->academicPeriod(($request->input('academicPeriod.id')))
            ->state(($request->input('state.id')))
            ->paginate($request->input('per_page'));

        return (new CourseByCoordinatorCecyCollection($courses))
            ->additional([
                'msg' => [
                    'summary' => '',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    /*
    * Mostrar los KPI
    */
    public function getCoursesKPI($request)
    {
        
    }


    public function putAssignResponsibleTeacher($request)
    {
        //Asignar docente responsable de cecy
    }

    public function assignCodeToCourse($request)
    {
        //Asignar código
    }

    public function insertObservations($request)
    {
        //Insertar motivo en observations
    }

    /*
    * Adjuntar el acta de aprobación
    */ 
    public function uploadFile(UploadFileRequest $request, Catalogue $catalogue)
    {
        return $catalogue->uploadFile($request);
    }
}
