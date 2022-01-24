<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;    
use Illuminate\Http\Request;
use App\Models\Cecy\Catalogue;    
use App\Models\Cecy\Instructor;
use App\Http\Resources\V1\Cecy\Instructors\InstructorCollection;
use App\Http\Resources\V1\Cecy\Instructors\InstructorResource;
use App\Models\Core\File;

class JumboController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:store')->only(['store']);
        $this->middleware('permission:update')->only(['update']);
        $this->middleware('permission:delete')->only(['destroy', 'destroys']);
    }

    public function getCourses(Course $course)
    {
        return (new CourseCollection($course))
        ->additional([
            'msg' => [
                'summary' => 'success',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function indexInstructors()
    {
        //Aqui va traer todos los instructores
    }

    public function storeInstructors(Request $request)
    {
        // Para crear un nuevo Instructor
        $Instructor = new Instructor();
        $Instructor->instructor()->associate(Course::find($request->input('user.id')));
        $Instructor->state_id()->associate(Instructor::find($request->input('state_id')));
        $Instructor->type_id()->associate(Catalogue::find($request->input('type_id')));
       

        return (new InstructorResource($instructor))
        ->additional([
            'msg' => [
                'summary' => 'Instructor Creado',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

     public function show(Instructor $Instructor)
    {
        return (new InstructorResource($Instructor))
        ->additional([
            'msg' => [
                'summary' => 'success',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    } 

    public function updateInstructors(Request $request,Instructor $Instructor )
    {
        //Me va permitir editar modificar al instructor 
        $Instructor->instructor()->associate(Course::find($request->input('user.id')));
        $Instructor->state_id()->associate(Instructor::find($request->input('state_id')));
        $Instructor->type_id()->associate(Catalogue::find($request->input('type_id')));
        $Instructor->save();

        return (new InstructorResource($detailInstructor))
        ->additional([
            'msg' => [
                'summary' => 'Instructor Actualizado',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function destroyInstructors(Instructor $Instructor)
    {
       //Me va permitir elimminar  al instructor
       $instructor->delete();
        return (new InstructorResource($instructor))
        ->additional([
            'msg' => [
                'summary' => 'Instructor Eliminado',
                'detail' => '',
                'code' => '200'
            ]
        ]);
       
    }

}

//crud de ​Instituciones
//crud de autoridades 