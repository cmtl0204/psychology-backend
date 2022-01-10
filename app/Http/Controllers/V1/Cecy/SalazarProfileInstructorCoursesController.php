<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Resources\V1\Cecy\ProfileInstructorCourses\ProfileInstructorCourseCollection;
use App\Http\Resources\V1\Cecy\ProfileInstructorCourses\ProfileInstructorCourseResource;
use Illuminate\Http\Request;
use App\Models\Cecy\ProfileInstructorCourse;
use App\Models\Cecy\Course;    


class SalazarProfileInstructorCoursesController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:store')->only(['store']);
        $this->middleware('permission:update')->only(['update']);
        $this->middleware('permission:delete')->only(['destroy', 'destroys']);
    }

    public function index()
    {
        return (new ProfileInstructorCourseCollection($profileInstructorCourses))
        ->additional([
            'msg' => [
                'summary' => 'success',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function store(Request $request)
    {
        $profileInstructorCourse = new ProfileInstructorCourse();
        $profileInstructorCourse->course()->associate(Course::find($request->input('course.id')));
        $profileInstructorCourse->require_knowledge = $request->input('require_knowledge');
        $profileInstructorCourse->require_experience = $request->input('require_experience');
        $profileInstructorCourse->require_skills = $request->input('require_skills');





        return (new TopicResource($topic))
        ->additional([
            'msg' => [
                'summary' => 'Perfil Creado',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function show( ProfileInstructorCourse $profileInstructorCourse)
    {
        return (new ProfileInstructorCourseResource($profileInstructorCourse))
        ->additional([
            'msg' => [
                'summary' => 'success',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function update(Request $request,ProfileInstructorCourse $profileInstructorCourse )
    {
        $profileInstructorCourse = new ProfileInstructorCourse();
        $profileInstructorCourse->course()->associate(Course::find($request->input('course.id')));
        $profileInstructorCourse->require_knowledge = $request->input('require_knowledge');
        $profileInstructorCourse->require_experience = $request->input('require_experience');
        $profileInstructorCourse->require_skills = $request->input('require_skills');
        $profileInstructorCourse->save();

        return (new ProfileInstructorCourseResource($profileInstructorCourse))
        ->additional([
            'msg' => [
                'summary' => 'Perfil Actualizado',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function destroy(ProfileInstructorCourse $profileInstructorCourse)
    {
        $topic->delete();
        return (new ProfileInstructorCourseResource($profileInstructorCourse))
            ->additional([
                'msg' => [
                    'summary' => 'Perfil  Eliminado',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
}
