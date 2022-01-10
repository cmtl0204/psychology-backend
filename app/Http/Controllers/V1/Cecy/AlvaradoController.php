<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Cecy\Topic;
use App\Models\Cecy\Course;
use App\Models\Cecy\Catalogue;
use App\Http\Resources\V1\Cecy\Topics\TopicResource;
use App\Http\Resources\V1\Cecy\Topics\TopicCollection;
use App\Http\Requests\V1\Cecy\Topics\StoreTopicRequest;


class AlvaradoTopicsController extends Controller
{
    // public function __construct()
    // {
    //     $this->middleware('permission:store-catalogues')->only(['store']);
    //     $this->middleware('permission:update-catalogues')->only(['update']);
    //     $this->middleware('permission:delete-catalogues')->only(['destroy', 'destroys']);
    // }
    
    public function getTopics(Course $course)
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

    public function storeTopic(StoreTopicRequest $request, Course $course )
    {   
        $topic = new Topic();
        $topic->course()->associate(Course::find($request->input('course.id')));
        $topic->level()->associate(Catalogue::find($request->input('level.id')));
        if($request->input('level.id') === '2') {
            $topic->parent()->associate(Topic::find($request->input('parent.id')));
        }         
        $topic->description = $request->input('description');
        $topic->save();

        return (new TopicResource($topic))
        ->additional([
            'msg' => [
                'summary' => 'Tema o subtema Creado',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }


    public function updateTopic(StoreTopicRequest $request, Topic $topic )
    {
        $topic->course()->associate(Course::find($request->input('course.id')));
        $topic->level()->associate(Catalogue::find($request->input('level.id')));
        if($request->input('level.id') === '2') {
            $topic->parent()->associate(Topic::find($request->input('parent.id')));
        }  
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

    public function destroyTopic(Topic $topic)
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

    public function destroysTopics(DestroysTopicRequest $request)
    {
        $topic = Topic::whereIn('id', $request->input('ids'))->get();
        Topic::destroy($request->input('ids'));

        return (new TopicCollection($topic))
            ->additional([
                'msg' => [
                    'summary' => 'Temas o subtemas Eliminados',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    public function updateInformationCourse(UpdateCourseRequest $request, Course $course)
    {
        $course->area()->associate(Catalogue::find($request->input('area.id')));
        $course->speciality()->associate(Catalogue::find($request->input('speciality.id')));
        $course->alignment = $request->input('alignment');
        $course->objective = $request->input('objective');
        $course->techniques_requisites = $request->input('techniquesRequisites');
        $course->teaching_strategies = $request->input('teachingStrategies');
        $course->evaluation_mechanism = $request->input('evaluationMechanism');
        $course->learning_environment = $request->input('learningEnvironment');
        $course->practice_hours = $request->input('practiceHours');
        $course->theory_hours = $request->input('theoryHours');
        $course->bibliographys = $request->input('bibliographys');
        $course->save();

        return (new CourseResource($course))
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
