<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;    
use Illuminate\Http\Request;
use App\Models\Cecy\Catalogue;    
use App\Models\Cecy\Instructor;
use App\Http\Resources\V1\Cecy\Instructors\InstructorCollection;
use App\Http\Resources\V1\Cecy\Instructors\InstructorResource;
use App\Models\Core\File;

class JumboInstructorController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:store')->only(['store']);
        $this->middleware('permission:update')->only(['update']);
        $this->middleware('permission:delete')->only(['destroy', 'destroys']);
    }

    public function index()
    {
        return (new InstructorCollection($instructor))
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

    public function update(Request $request,Instructor $Instructor )
    {
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

    public function destroy(Instructor $Instructor)
    {
        $topic->delete();
        return (new InstructorResource($Instructor))
            ->additional([
                'msg' => [
                    'summary' => 'Instructor Eliminado',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
}
