<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Core\Courses\IndexCoursesRequest;
use App\Http\Resources\V1\Cecy\Courses\CourseCollection;
use App\Models\Core\Courses;
use App\Models\Core\File;

class GuachagmiraCourseController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:view-courses')->only(['view']);
    }

    public function index(IndexCoursesRequest $request)
    {
        $sorts = explode(',', $request->sort);

        $courses = Course::customOrderBy($sorts)
            ->category($request->input('category_id'))
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

    // Files
    public function showFile(Courses $courses, File $file)
    {
        return $courses->showFile($file);
    }
}
