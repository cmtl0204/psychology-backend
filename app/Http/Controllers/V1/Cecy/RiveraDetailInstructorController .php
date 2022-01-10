<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Models\Cecy\Course;    
use Illuminate\Http\Request;
use App\Models\Cecy\Catalogue;    
use App\Http\Resources\V1\Cecy\DetailInstructors\DetailInstructorResource;
use App\Http\Resources\V1\Cecy\DetailInstructors\DetailInstructorCollection;
use App\Models\Cecy\DetailInstructor;


use App\Models\Core\File;

class RiveraDetailInstructorController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:store')->only(['store']);
        $this->middleware('permission:update')->only(['update']);
        $this->middleware('permission:delete')->only(['destroy', 'destroys']);
    }

    public function index()
    {
        return (new DetailInstructorCollection($detailInstructo))
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
        $detailInstructor = new DetailInstructor();
        $detailInstructor->instructor()->associate(Course::find($request->input('instructor.id')));
        $detailInstructor->detail_planification()->associate(Topic::find($request->input('detail_planification.id')));
        $detailInstructor->state_certified()->associate(Catalogue::find($request->input('state_certified.id')));
        $detailInstructor->code_certified = $request->input('code_certified');

        return (new TopicResource($topic))
        ->additional([
            'msg' => [
                'summary' => 'Tema o subtema Creado',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function show(DetailInstructor $detailInstructor)
    {
        return (new DetailInstructorResource($detailInstructor))
        ->additional([
            'msg' => [
                'summary' => 'success',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function update(Request $request,DetailInstructor $detailInstructor )
    {
        $detailInstructor->instructor()->associate(Course::find($request->input('instructor.id')));
        $detailInstructor->detail_planification()->associate(Topic::find($request->input('detail_planification.id')));
        $detailInstructor->state_certified()->associate(Catalogue::find($request->input('state_certified.id')));
        $detailInstructor->code_certified = $request->input('code_certified');
        $detailInstructor->save();

        return (new DetailInstructorResource($detailInstructor))
        ->additional([
            'msg' => [
                'summary' => 'Tema o subtema Actualizado',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function destroy(DetailInstructor $detailInstructor)
    {
        $topic->delete();
        return (new DetailInstructorResource($detailInstructor))
            ->additional([
                'msg' => [
                    'summary' => 'Tema o subtema Eliminado',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
}
