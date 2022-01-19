<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Cecy\Topic;
use App\Models\Cecy\Course;
use App\Models\Cecy\Catalogue;
use App\Models\Cecy\Prerequisite;
use App\Http\Resources\V1\Cecy\Topics\TopicResource;
use App\Http\Resources\V1\Cecy\Topics\TopicCollection;
use App\Http\Requests\V1\Cecy\Topics\StoreTopicRequest;
use App\Http\Resources\V1\Cecy\Courses\CourseResource;
use App\Http\Resources\V1\Cecy\Courses\CoursePrerequisiteResource;
use App\Http\Resources\V1\Cecy\Courses\CourseCollection;
use App\Http\Requests\V1\Cecy\Courses\UpdateCourseRequest;
use App\Http\Resources\V1\Cecy\Prerequisites\PrerequisiteCollection;
use App\Http\Resources\V1\Cecy\Prerequisites\PrerequisiteResource;
use App\Http\Requests\V1\Cecy\Prerequisites\DestroyPrerequisiteRequest;
use App\Http\Requests\V1\Cecy\Prerequisites\StorePrerequisiteRequest;


class AlvaradoController extends Controller
{
    // public function __construct()
    // {
    //     $this->middleware('permission:store-catalogues')->only(['store']);
    //     $this->middleware('permission:update-catalogues')->only(['update']);
    //     $this->middleware('permission:delete-catalogues')->only(['destroy', 'destroys']);
    // }

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

    public function updateCourse(UpdateCourseRequest $request, Course $course)
    {
        $course->area()->associate(Catalogue::find($request->input('area.id')));
        $course->speciality()->associate(Catalogue::find($request->input('speciality.id')));
        $course->alignment = $request->input('alignment');
        $course->objective = $request->input('objective');
        $course->techniques_requisites = $request->input('techniquesRequisites');
        $course->teaching_strategies = $request->input('teachingStrategies');
        $course->evaluation_mechanism = $request->input('evaluationMechanisms');
        $course->learning_environment = $request->input('learningEnvironments');
        $course->practice_hours = $request->input('practiceHours');
        $course->theory_hours = $request->input('theoryHours');
        $course->bibliographies = $request->input('bibliographies');
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

    // TEMAS Y SUBTEMAS
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

    public function storeTopic(StoreTopicRequest $request)
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
    // PREREQUISITOS
    public function getPrerequisites(Course $course)
    {
        $prerequisite = $course->prerequisite()->get();
        return (new PrerequisiteCollection($prerequisite))
        ->additional([
            'msg' => [
                'summary' => 'success',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function getCoursesPrerequisites(Course $course)
    {
        return (new CoursePrerequisiteResource($course))
        ->additional([
            'msg' => [
                'summary' => 'success',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function storePrerequisite(StorePrerequisiteRequest $request)
    {
        $prerequisite = new Prerequisite();
        $prerequisite->course()->associate(Course::find($request->input('course.id')));
        $prerequisite->prerequisite()->associate(Course::find($request->input('prerequisite.id')));
        $prerequisite->save();
        return (new PrerequisiteResource($prerequisite))
        ->additional([
            'msg' => [
                'summary' => 'success',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function updatePrerequisite(StorePrerequisiteRequest $request, Prerequisite $prerequisite )
    {
        $prerequisite->course()->associate(Course::find($request->input('course.id')));
        $prerequisite->prerequisite()->associate(Course::find($request->input('prerequisite.id')));
        $prerequisite->save();
        return (new PrerequisiteResource($prerequisite))
        ->additional([
            'msg' => [
                'summary' => 'success',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function DestroyPrerequisite(Prerequisite $prerequisite)
    {
        $prerequisite->delete();
        return (new PrerequisiteResource($prerequisite))
        ->additional([
            'msg' => [
                'summary' => 'Prerequisito Eliminado',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function destroysPrerequisites(DestroyPrerequisiteRequest $request)
    {
        $prerequisite = Prerequisite::whereIn('id', $request->input('ids'))->get();
        Prerequisite::destroy($request->input('ids'));

        return (new PrerequisiteCollection($prerequisite))
            ->additional([
                'msg' => [
                    'summary' => 'Prerequisitos Eliminados',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
}
