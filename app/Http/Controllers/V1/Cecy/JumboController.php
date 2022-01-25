<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Cecy\Attendance\GetUsersIgnugRequest;
use Illuminate\Http\Request;
use App\Models\Cecy\Catalogue;
use App\Models\Cecy\Instructor;
use App\Models\Cecy\Course;
use App\Http\Resources\V1\Cecy\Instructors\InstructorCollection;
use App\Http\Resources\V1\Cecy\Instructors\InstructorResource;
use App\Http\Resources\V1\Core\Users\UserResource;
use App\Http\Resources\V1\Cecy\Courses\CourseResource;
use App\Http\Request\V1\Cecy\Instructors\DestroysInstructorRequest;
use App\Models\Core\File;
use App\Models\Cecy\User;

class JumboController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:store')->only(['store']);
        $this->middleware('permission:update')->only(['update']);
        $this->middleware('permission:delete')->only(['destroy', 'destroys']);
    }

   //visualizar los usuarios de ignug
    public function getUsersIgnug(GetUsersIgnugRequest $request)
    {
        $users = user::whereIn('type_id', $request->input('ignug'))->get();
        return (new UserResource($users))
        ->additional([
            'msg' => [
                'summary' => 'usuarios traidos de ignug',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }


    public function updateInstructors(Request $request,Instructor $instructor )
    {
        $instructor->instructor()->associate(User::find($request->input('user.id')));
        $instructor->state_id()->associate(Catalogue::find($request->input('state_id')));
        $instructor->type_id()->associate(Catalogue::find($request->input('type_id')));
        $instructor->save();

        return (new InstructorResource($instructor))
        ->additional([
            'msg' => [
                'summary' => 'Instructor Actualizado',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    // para eliminar un instructor
    public function destroysInstructors(DestroysInstructorRequest $request)
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
        ]);

    }

    //visualizar todos los cursos
    public function getCourses(Course $course)
    {
        return (new CourseResource($course))
        ->additional([
            'msg' => [
                'summary' => 'Me trae los cursos',
                'detail' => '',
                'code' => '200'
            ]
        ]);

    }
    //Agregar perfil a un curso
    public function storeProfileCourse(StoreProfileCourseRequest $request)
    {
        $profile = new Profile();

        $profile->course_id()
            ->associate(Course::find($request->input('course_id')));

        $profile->required_knowledge = $request->input('required_knowledge');

        $profile->required_experience = $request->input('required_experience');

        $profile->required_skills = $request->input('required_skills');

        $profile->save();

        return (new ProfileInstructorCourseResource($profile))
            ->additional([
                'msg' => [
                    'summary' => 'Perfil del curso creado',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);

    }

}
