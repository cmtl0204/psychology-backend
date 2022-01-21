<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;   
use Illuminate\Http\Request;
use App\Models\Cecy\Catalogue;    
use App\Http\Resources\V1\Cecy\DetailInstructors\DetailInstructorResource;
use App\Http\Resources\V1\Cecy\DetailInstructors\DetailInstructorCollection;
use App\Models\Cecy\Course;
use App\Http\Requests\V1\Cecy\Courses\GetCoursesByCategoryRequest;

use App\Models\Cecy\DetailInstructor;
use App\Models\Cecy\Planification;
use App\Http\Resources\V1\Cecy\Planifications\InformCourseNeedsResource;


class RiveraController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:show')->only(['show']);
        
    }


    public function showInformCourseNeeds(GetCoursesByCategoryRequest $request, Course $course)
    {
    //trae un informe de nececidades de un curso en especifico por el docente que se logea

    return (new InformCourseNeedsResource($course))
        ->additional([
            'msg' => [
                'summary' => 'success',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function showYearSchedule(getDateByshowYearScheduleRequest $request)
    {
    //trae todos los cursos planificados de un mes en especifico
    $responsibleCourse = Instructor::where('user_id', $request->user()->id)->get();

    $detailPlanifications = $responsibleCourse
        ->instructors()
        ->detailPlanifications()
        ->classrooms()
        ->planifications()
        ->course()
        ->paginate($request->input('per_page'));

    return (new DetailPlanificationInformNeedCollection($detailPlanifications))
        ->additional([
            'msg' => [
                'summary' => 'success',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function showRecordCompetitor(getCoursesByNameRequest $request)
    {
    //trae todos los participantes registrados de un curso en especifico
    $responsibleCourse = course::where('course_id', $request->course()->id)->get();

    $detailPlanifications = $responsibleCourse
        ->registrations()
        ->participants()
        ->users()
        ->additionalInformations()
        ->detailPlanifications()
        ->planifications()
        ->course()
        ->paginate($request->input('per_page'));

    return (new RegistrationRecordCompetitorCollection($registration))
        ->additional([
            'msg' => [
                'summary' => 'success',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function showPhotographicRecord()
    {
    //trae un registro fotografico de un curso en especifico por el docente que se loguea
    $responsibleCourse = Instructor::where('user_id', $request->user()->id)->get();

    $detailPlanifications = $responsibleCourse
        ->detailPlanifications()
        ->photographicRecords()

        // return (new PhotographicRecordResource($detailPlanifications))
        ->additional([
            'msg' => [
                'summary' => 'success',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }
}
