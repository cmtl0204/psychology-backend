<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Cecy\Courses\getCoursesByCategoryRequest;
use App\Http\Requests\V1\Cecy\Courses\getCoursesByNameRequest;
use App\Http\Requests\V1\Cecy\Courses\getInstructorsInformationByCourseRequest;
use App\Http\Requests\V1\Cecy\Courses\getSchedulesInformationByCourseRequest;
use App\Http\Resources\V1\Cecy\Courses\CourseCollection;
use App\Models\Cecy\Course;
use App\Models\Core\File;

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
    public function getInstructorsInformationByCourse(getInstructorsInformationByCourseRequest $request)
    {
    }
    public function getSchedulesInformationByCourse(getSchedulesInformationByCourseRequest $request)
    {
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
}
