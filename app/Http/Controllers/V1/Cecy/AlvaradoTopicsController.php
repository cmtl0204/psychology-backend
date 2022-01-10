<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Cecy\Topic;
use App\Models\Cecy\Course;
use App\Models\Cecy\Catalogue;
use App\Http\Resources\V1\Cecy\Topics\TopicResource;
use App\Http\Resources\V1\Cecy\Topics\TopicCollection;

class AlvaradoTopicsController extends Controller
{
    // public function __construct()
    // {
    //     $this->middleware('permission:store-catalogues')->only(['store']);
    //     $this->middleware('permission:update-catalogues')->only(['update']);
    //     $this->middleware('permission:delete-catalogues')->only(['destroy', 'destroys']);
    // }
    
    public function index()
    {
        $topics = $course->topics()->get();
        return (new TopicCollection($topics))
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
        $topic = new Topic();
        $topic->course()->associate(Course::find($request->input('course.id')));
        $topic->parent()->associate(Topic::find($request->input('parent.id')));
        $topic->nivel()->associate(Catalogue::find($request->input('nivel.id')));
        $topic->description = $request->input('description');

        return (new TopicResource($topic))
        ->additional([
            'msg' => [
                'summary' => 'Tema o subtema Creado',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function show(Topic $topic)
    {
        return (new TopicResource($topic))
        ->additional([
            'msg' => [
                'summary' => 'success',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function update(Request $request,Topic $topic )
    {
        $topic->course()->associate(Course::find($request->input('course.id')));
        $topic->parent()->associate(Topic::find($request->input('parent.id')));
        $topic->nivel()->associate(Catalogue::find($request->input('nivel.id')));
        $topic->description = $request->input('description');
        $topic->save();

        return (new TopicResource($topic))
        ->additional([
            'msg' => [
                'summary' => 'Tema o subtema Actualizado',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function destroy(Topic $topic)
    {
        $topic->delete();
        return (new TopicResource($topic))
            ->additional([
                'msg' => [
                    'summary' => 'Tema o subtema Eliminado',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    public function editarInformacionCurso()
    {
        return (new TopicCollection($topic))
        ->additional([
            'msg' => [
                'summary' => 'success',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function CrearPrerequisitos()
    {
        return (new TopicCollection($topic))
        ->additional([
            'msg' => [
                'summary' => 'success',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function DeletePrerequisitos()
    {
        return (new TopicCollection($topic))
        ->additional([
            'msg' => [
                'summary' => 'success',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }
}
