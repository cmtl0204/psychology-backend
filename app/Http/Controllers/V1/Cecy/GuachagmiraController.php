<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Cecy\Courses\GetCoursesByCategoryRequest;
use App\Http\Requests\V1\Cecy\Courses\GetCoursesByNameRequest;
use App\Http\Requests\V1\Cecy\Courses\GetInstructorsInformationByCourseRequest;
use App\Http\Requests\V1\Cecy\Courses\GetDetailPlanificationsByCourseRequest;
use App\Http\Requests\V1\Cecy\Courses\GetPrerequisitesByCourseRequest;
use App\Http\Requests\V1\Cecy\Courses\GetTopicsByCourseRequest;
use App\Http\Resources\V1\Cecy\Courses\CourseCollection;
use App\Http\Resources\V1\Cecy\Courses\DetailPlanificationByCourseCollection;
use App\Http\Resources\V1\Cecy\Courses\InstructorsInformationByCourseCollection;
use App\Http\Resources\V1\Cecy\Courses\PrerequisitesByCourseCollection;
use App\Http\Resources\V1\Cecy\Courses\TopicsByCourseCollection;
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
        Sirve para obtener los horarios de cada paralelo dado un curso
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
