<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Core\Courses\IndexCoursesRequest;
use App\Http\Requests\V1\Core\Files\DestroysFileRequest;
use App\Http\Requests\V1\Core\Files\IndexFileRequest;
use App\Http\Requests\V1\Core\Files\UpdateFileRequest;
use App\Http\Requests\V1\Core\Files\UploadFileRequest;
use App\Http\Resources\V1\Core\Courses\CoursesCollection;
use App\Models\Core\Courses;
use App\Models\Core\File;

class ChambaCourseController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:store-courses')->only(['store']);
        $this->middleware('permission:update-courses')->only(['update']);
        $this->middleware('permission:delete-courses')->only(['destroy', 'destroys']);
    }

    public function index(IndexCoursesRequest $request)
    {
        $sorts = explode(',', $request->sort);

        $courses = Courses::customOrderBy($sorts)
            ->type($request->input('type'))
            ->paginate();

        return (new CoursesCollection($courses))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    public function all(IndexCoursesRequest $request)
    {
        $courses = Courses::orderBy('name')
            ->type($request->input('type'))
            ->paginate($request->input('per_page'));

        return (new CoursesCollection($courses))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    // Files
    public function indexFiles(IndexFileRequest $request, Courses $courses)
    {
        return $courses->indexFiles($request);
    }

    public function uploadFile(UploadFileRequest $request, Courses $courses)
    {
        return $courses->uploadFile($request);
    }

    public function downloadFile(Courses $courses, File $file)
    {
        return $courses->downloadFile($file);
    }

    public function showFile(Courses $courses, File $file)
    {
        return $courses->showFile($file);
    }

    public function updateFile(UpdateFileRequest $request, Courses $courses, File $file)
    {
        return $courses->updateFile($request, $file);
    }

    public function destroyFile(Courses $courses, File $file)
    {
        return $courses->destroyFile($file);
    }

    public function destroyFiles(Courses $courses, DestroysFileRequest $request)
    {
        return $courses->destroyFiles($request);
    }
}
