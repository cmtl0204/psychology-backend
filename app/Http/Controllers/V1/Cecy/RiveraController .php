<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Cecy\Catalogue;
use App\Http\Resources\V1\Cecy\DetailInstructors\DetailInstructorResource;
use App\Http\Resources\V1\Cecy\DetailInstructors\DetailInstructorCollection;
use App\Models\Cecy\Course;
use App\Http\Requests\V1\Cecy\Courses\GetCoursesByCategoryRequest;
use App\Http\Requests\V1\Cecy\Planifications\GetDateByshowYearScheduleRequest;
use App\Http\Requests\V1\Cecy\Courses\GetCoursesByNameRequest;
use App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications\GetDetailPlanificationsByResponsibleCourseRequest;




use App\Models\Cecy\DetailInstructor;
use App\Models\Cecy\Instructor;
use App\Http\Resources\V1\Cecy\Planifications\InformCourseNeedsResource;
use App\Http\Resources\V1\Cecy\DetailPlanifications\DetailPlanificationInformNeedResource;
use App\Http\Resources\V1\Cecy\Registrations\RegistrationRecordCompetitorResource;

use App\Http\Resources\V1\Cecy\PhotographicRecords\PhotographicRecordResource;
use App\Models\Cecy\DetailPlanification;
use App\Models\Cecy\Planification;

class RiveraController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:show')->only(['show']);
    }


    public function showInformCourseNeeds(GetCoursesByCategoryRequest $request, Course $course)
    {
        //trae un informe de nececidades de una planificacion, un curso en especifico por el docente que se logea
        $planificacion = DetailPlanification::where('panification_id', $request->planification()->id)->get();

        $planifications =  $planificacion
        ->instructors()
        ->detailPlanifications()
        ->classrooms()
        ->planifications()
        ->course()
        ->paginate($request->input('per_page'));

        return (new InformCourseNeedsResource($course))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ])
            ->response()->setStatusCode(200);
    }

    public function showYearSchedule(GetDateByshowYearScheduleRequest $request)
    {
        //trae todos los cursos planificados de un año en especifico
        $instructor = Instructor::where('user_id', $request->user()->id)->get();

        $Instructor = $instructor
            ->instructors()
            ->detailPlanifications()
            ->classrooms()
            ->planifications()
            ->course()
            ->paginate($request->input('per_page'));

        return (new DetailPlanificationInformNeedResource($Instructor))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ])
            ->response()->setStatusCode(200);
    }

    public function showRecordCompetitor(getCoursesByNameRequest $request, Course $course)
    {
        //trae todos los participantes registrados de un curso en especifico
        $Course = Planification::where('course_id', $request->course()->id)->get();

        $course = $Course
            ->registrations()
            ->participants()
            ->users()
            ->additionalInformations()
            ->detailPlanifications()
            ->planifications()
            ->course()
            ->paginate($request->input('per_page'));

        return (new RegistrationRecordCompetitorResource($course))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ])
            ->response()->setStatusCode(200);
    }

    public function showPhotographicRecord(GetDetailPlanificationsByResponsibleCourseRequest $request)
    {
        //trae el registro fotografico de un curso en especifico por el docente que se loguea
        $responsibleCourse = Instructor::where('user_id', $request->user()->id)->get();

        $Planifications = $responsibleCourse
            ->detailPlanifications()
            ->photographicRecords()
            ->paginate($request->input('per_page'));

        return (new PhotographicRecordResource($Planifications))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ])
            ->response()->setStatusCode(200);
    }
}
