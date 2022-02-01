<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Resources\V1\Cecy\Courses\CourseCollection;
use Illuminate\Http\Request;
use App\Models\Cecy\Catalogue;
use App\Models\Cecy\Instructor;
use App\Models\Cecy\Course;
use App\Http\Resources\V1\Cecy\Instructors\InstructorResource;
use App\Http\Requests\V1\Cecy\Instructor\DestroysInstructorRequest;
use App\Http\Requests\V1\Cecy\ProfileInstructorCourses\StoreProfileCourseRequest;
use App\Http\Resources\V1\Cecy\ProfileInstructorCourses\ProfileInstructorCourseResource;
use App\Models\Cecy\ProfileInstructorCourse;

class JumboController extends Controller
{
    public function __construct()
    {
//        $this->middleware('permission:store')->only(['store']);
//        $this->middleware('permission:update')->only(['update']);
//        $this->middleware('permission:delete')->only(['destroy', 'destroys']);
    }


    public function updateTypeInstructors(Request $request,Instructor $instructor )
    {
        $instructor->type()->associate(Catalogue::find($request->input('type.id')));
        $instructor->save();

        return (new InstructorResource($instructor))
        ->additional([
            'msg' => [
                'summary' => 'Instructor Actualizado',
                'detail' => '',
                'code' => '200'
            ]
        ])
        ->response()->setStatusCode(200);
        
    }

    // para eliminar un instructor
    public function destroyInstructors(DestroysInstructorRequest $request)
    {
       $instructor = Instructor::whereIn('id', $request->input('ids'))->get();
        Instructor::destroy($request->input('ids'));
        return (new InstructorResource($instructor))
        ->additional([
            'msg' => [
                'summary' => 'Instructor Eliminado',
                'detail' => '',
                'code' => '200'
            ]
        ])
        ->response()->setStatusCode(200);

    }

    //visualizar todos los cursos
    public function getCourses()
    {
        $courses = Course::get();

        return (new CourseCollection($courses))
        ->additional([
            'msg' => [
                'summary' => 'Me trae los cursos',
                'detail' => '',
                'code' => '200'
            ]
        ])
        ->response()->setStatusCode(200);

    }
    //Agregar perfil a un curso
    public function storeProfileCourse(StoreProfileCourseRequest $request)
    {
        $profile = new ProfileInstructorCourse();

        $profile->course()
            ->associate(Course::find($request->input('course.id')));

        $profile->required_knowledge = $request->input('required_knowledge');

        $profile->required_experience = $request->input('required_experiences');

        $profile->required_skills = $request->input('required_skills');

        $profile->save();

        return (new ProfileInstructorCourseResource($profile))
            ->additional([
                'msg' => [
                    'summary' => 'Perfil del curso creado',
                    'detail' => '',
                    'code' => '200'
                ]
            ])
            ->response()->setStatusCode(200);

    }

}
