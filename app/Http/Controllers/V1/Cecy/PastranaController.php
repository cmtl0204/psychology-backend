<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Models\Cecy\Planification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Cecy\Courses\GetCoursesByCoordinatorCecyRequest;
use App\Http\Requests\V1\Core\Files\UploadFileRequest;
use App\Http\Requests\V1\Cecy\Planifications\UpdateAssignResponsibleCecyRequest;
use App\Http\Resources\V1\Cecy\Courses\CourseByCoordinatorCecyCollection;
use App\Http\Resources\V1\Cecy\Courses\CourseCollection;
use App\Models\Cecy\DetailPlanification;
use App\Models\Cecy\Catalogue;
use App\Models\Cecy\Course;
use App\Http\Resources\V1\Cecy\DetailPlanifications\DetailPlanificationResource;
use App\Http\Resources\V1\Cecy\DetailPlanifications\DetailPlanificationCollection;
use App\Http\Resources\V1\Cecy\Planifications\PlanificationResource;
use App\Models\Cecy\Authority;
use App\Models\Cecy\DetailSchoolPeriod;
use App\Models\Cecy\Instructor;
use App\Models\Core\Career;

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
    * MOSTRAR LOS KPI DE CURSOS APROBADOS, POR APROBAR Y EN PROCESO
    */
    public function getCoursesKPI(Request $request)
    {
        $courses = DB::table('courses as cr')
        ->join('catalogue as ct', 'ct.id', '=', 'cr.state_id')
        ->where('ct.name', '=', 'APPROVED, TO_BE_APPROVED, IN_PROCESS' ,state_id)
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
        $planification->course()->associate(Course::find($request->input('course.id')));
        $planification->detail_school_period()->associate(DetailSchoolPeriod::find($request->input('detail_school_period.id')));
        $planification->vicerrector()->associate(Authority::find($request->input('vicerrector.id')));
        $planification->responsible_course_period()->associate(Instructor::find($request->input('responsible_course_period.id')));
        $planification->responsible_ocs()->associate(Catalogue::find($request->input('responsible_ocs.id')));
        $planification->responsible_cecy()->associate(Authority::find($request->input('responsible_cecy.id')));
        $planification->aproved_at = $request->input('aproved_at');
        $planification->code = $request->input('code');
        $planification->ended_at = $request->input('ended_at');
        $planification->needs = $request->input('needs');
        $planification->observation = $request->input('observation');
        $planification->started_at = $request->input('started_at');
        $planification->save();

        return (new PlanificationResource($planification))
        ->additional([
            'msg' => [
                'summary' => 'success',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }
    /*
    * Asignar código al curso
    */
    public function assignCodeToCourse(Course $course, $request)
    {
        $course->carrerId()->associate(Career::find($request->input('carrer.id')));
        $course->category()->associate(Catalogue::find($request->input('category.id')));
        $course->certifiedTypeId()->associate(Catalogue::find($request->input('certifiedType.id')));
        $course->courseTypeId()->associate(Catalogue::find($request->input('courseType.id')));
        $course->modalityId()->associate(Catalogue::find($request->input('modality.id')));
        $course->specialityId()->associate(Catalogue::find($request->input('speciality.id')));
        $course->area()->associate(Catalogue::find($request->input('area.id')));
        $course->speciality()->associate(Catalogue::find($request->input('speciality.id')));
        $course->abbreviation = $request->input('abbreviation');
        $course->cost = $request->input('cost');
        $course->duration = $request->input('duration');
        $course->free = $request->input('free');
        $course->needs = $request->input('needs');
        $course->project = $request->input('project');
        $course->sumary = $request->input('sumary');
        $course->alignment = $request->input('alignment');
        $course->objective = $request->input('objective');
        $course->techniques_requisites = $request->input('techniquesRequisites');
        $course->teaching_strategies = $request->input('teachingStrategies');
        $course->evaluation_mechanism = $request->input('evaluationMechanisms');
        $course->learning_environment = $request->input('learningEnvironments');
        $course->practice_hours = $request->input('practiceHours');
        $course->theory_hours = $request->input('theoryHours');
        $course->bibliographies = $request->input('bibliographies');
        $course->code = $request->input('code');

        return (new CourseCollection($course))
            ->additional([
                'msg' => [
                    'summary' => 'Curso actualizado',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    /*
    * Ingresar el motivo del por cual el curso no esta aprobado
    */
    public function insertObservations(Course $course, $request)
    {
        $course->carrerId()->associate(Career::find($request->input('carrer.id')));
        $course->category()->associate(Catalogue::find($request->input('category.id')));
        $course->certifiedTypeId()->associate(Catalogue::find($request->input('certifiedType.id')));
        $course->courseTypeId()->associate(Catalogue::find($request->input('courseType.id')));
        $course->modalityId()->associate(Catalogue::find($request->input('modality.id')));
        $course->specialityId()->associate(Catalogue::find($request->input('speciality.id')));
        $course->area()->associate(Catalogue::find($request->input('area.id')));
        $course->speciality()->associate(Catalogue::find($request->input('speciality.id')));
        $course->abbreviation = $request->input('abbreviation');
        $course->cost = $request->input('cost');
        $course->duration = $request->input('duration');
        $course->free = $request->input('free');
        $course->needs = $request->input('needs');
        $course->project = $request->input('project');
        $course->sumary = $request->input('sumary');
        $course->alignment = $request->input('alignment');
        $course->objective = $request->input('objective');
        $course->techniques_requisites = $request->input('techniquesRequisites');
        $course->teaching_strategies = $request->input('teachingStrategies');
        $course->evaluation_mechanism = $request->input('evaluationMechanisms');
        $course->learning_environment = $request->input('learningEnvironments');
        $course->practice_hours = $request->input('practiceHours');
        $course->theory_hours = $request->input('theoryHours');
        $course->bibliographies = $request->input('bibliographies');
        $course->code = $request->input('code');
        $course->observation = $request->input('observation');

        return (new CourseCollection($course))
            ->additional([
                'msg' => [
                    'summary' => 'Curso actualizado',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    /*
    * Adjuntar el acta de aprobación
    */
    public function uploadFile(UploadFileRequest $request, Catalogue $catalogue)
    {
        return $catalogue->uploadFile($request);
    }
}
