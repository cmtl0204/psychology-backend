<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Resources\V1\Cecy\Courses\CourseResource;
use App\Models\Cecy\Planification;
use App\Models\Core\State;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Cecy\Courses\GetCoursesByCoordinatorCecyRequest;
use App\Http\Requests\V1\Core\Files\UploadFileRequest;
use App\Http\Requests\V1\Cecy\Planifications\UpdateAssignResponsibleCecyRequest;
use App\Http\Resources\V1\Cecy\Courses\CourseByCoordinatorCecyCollection;
use App\Models\Cecy\Course;
use App\Http\Resources\V1\Cecy\Planifications\PlanificationResource;
use App\Models\Cecy\Authority;
use App\Models\Core\File;

class PastranaController extends Controller
{
    //public function __construct()
    //{
    //$this->middleware('permission:view-courses')->only(['view']);
    //$this->middleware('permission:view-planification')->only(['view']);
    //}
    /**
     * Obtener cursos y Filtrarlos por peridos lectivos , carrera o estado
     */
    public function getCourses(GetCoursesByCoordinatorCecyRequest $request)
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
            ])
            ->response()->setStatusCode(200);
    }

    /*
    * MOSTRAR LOS KPI DE CURSOS APROBADOS, POR APROBAR Y EN PROCESO
    */
    public function getCoursesKPI(Request $request)
    {
        $courses = DB::table('courses as cr')
            ->join('catalogue as ct', 'ct.id', '=', 'cr.state_id')
            ->where('ct.name', '=', 'APPROVED, TO_BE_APPROVED, IN_PROCESS', state_id)
            ->select(DB::raw('count(*) as course_count'))
            ->first()
            ->paginate($request->input('per_page'));


        echo $courses->course_count;
    }

    /*
    * Asignar docente responsable de cecy de la planificación
    */
    public function updateAssignResponsibleCecy(UpdateAssignResponsibleCecyRequest $request, Planification $planification)
    {
        $planification->responsibleCecy()->associate(Authority::find($request->input('responsibleCecy.id')));
        $planification->save();

        return (new PlanificationResource($planification))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ])
            ->response()->setStatusCode(200);
    }

    /*
    * Asignar código al curso
    */
    public function assignCodeToCourse($request, Course $course)
    {
        $course->code = $request->input('code');
        $course->save();

        return (new CourseResource($course))
            ->additional([
                'msg' => [
                    'summary' => 'Curso actualizado',
                    'detail' => '',
                    'code' => '200'
                ]
            ])
            ->response()->setStatusCode(200);
    }

    /*
    * Ingresar el motivo del por cual el curso no esta aprobado
    */
    public function approveCourse($request, Course $course)
    {
        $course->state()->associate(State::firstWhere('code', State::APPROVED));
        $course->observation = $request->input('observation');
        $course->save();

        return (new CourseResource($course))
            ->additional([
                'msg' => [
                    'summary' => 'Curso actualizado',
                    'detail' => '',
                    'code' => '200'
                ]
            ])
            ->response()->setStatusCode(200);
    }

    /*
    * Adjuntar el acta de aprobación
    */
    public function uploadFile(UploadFileRequest $request, File $file)
    {
        return $file->uploadFile($request);
    }
}
