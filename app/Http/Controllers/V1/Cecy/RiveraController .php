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


    public function showInformCourseNeeds(Course $course)
    {
        //trae un informe de nececidades de una planificacion, un curso en especifico por el docente que se logea


        $planification = $course->planifications()->get()
            ->detailPlanifications()
            ->instructors()
            ->classrooms()
            /*         ->planifications() */
            ->course();

        return (new InformCourseNeedsResource($planification))
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
        $year = Planification::whereYear('started_at', $request->input('startedAt'))->get();

        $planificacion = $year
            ->instructors()
            ->detailPlanifications()
            ->classrooms()
            ->planifications()
            ->course()
            ->paginate($request->input('per_page'));

        return (new DetailPlanificationInformNeedResource($planificacion))
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
        $planification = $course->planifications()->get();
        $detailPlanification = $planification->detailPlanifications()->get();
        $registrations = $detailPlanification->registrations()->get();
        //trae todos los participantes registrados de un curso en especifico
       /*  $Course = Planification::where('course_id', $request->course()->id)->get(); */

/*         $registration = $registrations
            ->planifications()
            ->detailPlanifications()
            ->additionalInformations()
            ->users()
            ->participants()
            ->registrations()
             ->course() 
            ->paginate($request->input('per_page')); */

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

    public function showPhotographicRecord(GetDetailPlanificationsByResponsibleCourseRequest $request, Course $course)
    {
        //trae el registro fotografico de un curso en especifico por el docente que se loguea
        $planification = $course->planifications()->get();
        $detailPlanification = $planification->detailPlanifications()->get();
        $detailPlanificationInstructor = $detailPlanification->instructors()->get();
        $instructor = $detailPlanificationInstructor->users()->get();
        /* $detailPlanificationInstructor = $detailPlanification->certificateable()->get; */

  /*       $Planifications = $responsibleCourse
            ->detailPlanifications()
            ->photographicRecords()
            ->paginate($request->input('per_page')); */
     /*    $responsibleCourse = Instructor::where('user_id', $request->user()->id)->get();

        $Planifications = $responsibleCourse
            ->detailPlanifications()
            ->photographicRecords()
            ->paginate($request->input('per_page')); */

        return (new PhotographicRecordResource($instructor))
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
