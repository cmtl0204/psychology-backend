<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Cecy\Courses\GetCoursesByCategoryRequest;
use App\Http\Requests\V1\Cecy\Courses\GetCoursesByNameRequest;
use App\Http\Requests\V1\Cecy\Courses\GetInstructorsInformationByCourseRequest;
use App\Http\Requests\V1\Cecy\Courses\GetDetailPlanificationsByCourseRequest;
use App\Http\Requests\V1\Cecy\Courses\GetTopicsByCourseRequest;
use App\Http\Requests\V1\Cecy\Participants\StoreParticipantRequest;
use App\Http\Resources\V1\Cecy\Courses\CourseCollection;
use App\Http\Resources\V1\Cecy\Courses\DetailPlanificationByCourseCollection;
use App\Http\Resources\V1\Cecy\Courses\InstructorsInformationByCourseCollection;
use App\Http\Resources\V1\Cecy\Courses\PrerequisitesByCourseCollection;
use App\Http\Resources\V1\Cecy\Courses\TopicsByCourseCollection;
use App\Http\Resources\V1\Cecy\Participants\ParticipantResource;
use App\Models\Authentication\User;
use App\Models\Cecy\Catalogue;
use App\Models\Cecy\Course;
use App\Models\Cecy\Participant;
use App\Models\Cecy\Planification;
use App\Models\Cecy\Prerequisite;
use App\Models\Core\File;
use App\Models\Core\Image;

class GuachagmiraController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:view-courses')->only(['view']);
        $this->middleware('permission:view-topics')->only(['view']);
        $this->middleware('permission:view-prerequisites')->only(['view']);
        $this->middleware('permission:view-detailPlanifications')->only(['view']);
        $this->middleware('permission:view-Instructors')->only(['view']);
        $this->middleware('permission:view-Planifications')->only(['view']);
    }

    public function getCoursesByCategory(getCoursesByCategoryRequest $request)
    {
        $sorts = explode(',', $request->sort);

        $courses = Course::customOrderBy($sorts)
            ->category($request->input('category.id'))
            ->paginate();

        return (new CourseCollection($courses))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
    public function getCoursesByName(getCoursesByNameRequest $request)
    {
        $sorts = explode(',', $request->sort);

        $courses = Course::customOrderBy($sorts)
            ->name($request->input('name'))
            ->paginate();

        return (new CourseCollection($courses))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
    /*
        Obtener la información persona de cada instructor que dicta dado un curso
    */
    public function getInstructorsInformationByCourse(GetInstructorsInformationByCourseRequest $request)
    {
        $planification = Planification::where('course_id', $request->input('course.id'));
        $instructors  = $planification
            ->detailPlanification()
            ->instructors()
            ->user();

        return (new InstructorsInformationByCourseCollection($instructors))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
    /*
        Obtener los horarios de cada paralelo dado un curso
    */
    public function getDetailPlanificationsByCourse(GetDetailPlanificationsByCourseRequest $request)
    {
        $planification = Planification::where('course_id', $request->input('course.id'));
        $detailPlanification =  $planification
            ->detailPlanification();

        return (new DetailPlanificationByCourseCollection($detailPlanification))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
    /*
        Obtener los prerequisitos dado un curso
    */
    public function getPrerequisitesByCourse(Course $course)
    {
        $prerequisites = $course->prerequisite()->get();

        return (new PrerequisitesByCourseCollection($prerequisites))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
    /*
        Obtener los topicos  dado un curso
    */
    public function getTopicsByCourse(GetTopicsByCourseRequest $request)
    {
        $topics = Prerequisite::where([
            ['course_id', $request->input('course.id')],
            // ['parent_id', $request->input('parent.id')],
        ])->course();

        return (new TopicsByCourseCollection($topics))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }


    public function show(Course $course)
    {
        $course = Course::find($course);

        return (new CourseCollection($course))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
    public function registerParticipant(StoreParticipantRequest $request)
    {

        $participant = new Participant();

        $participant->user()->associate(User::find($request->input('user.id')));
        $participant->personType()->associate(Catalogue::find($request->input('personType.id')));
        $participant->state()->associate(Catalogue::find($request->input('state.id')));

        return (new ParticipantResource($participant))
            ->additional([
                'msg' => [
                    'summary' => 'Registro Creado',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    // Files
    public function showFile(Course $courses, File $file)
    {
        return $courses->showFile($file);
    }

    public function showImage(Course $courses, Image $image)
    {
        return $courses->showImage($image);
    }
    // public function showFile(Participant $participant, File $file)
    // {
    //     return $participant->showFile($file);
    // }

    // public function showImage(Participant $participant, Image $image)
    // {
    //     return $participant->showImage($image);
    // }
}
