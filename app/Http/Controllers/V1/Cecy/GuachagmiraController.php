<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Cecy\Courses\GetCoursesByCategoryRequest;
use App\Http\Requests\V1\Cecy\Courses\GetCoursesByNameRequest;
use App\Http\Requests\V1\Cecy\Participants\StoreUserAndParticipantRequest;
use App\Http\Requests\V1\Core\Files\DestroysFileRequest;
use App\Http\Requests\V1\Core\Files\UpdateFileRequest;
use App\Http\Resources\V1\Cecy\Courses\CourseCollection;
use App\Http\Resources\V1\Cecy\Courses\TopicsByCourseCollection;
use App\Http\Resources\V1\Cecy\DetailPlanifications\DetailPlanificationResource;
use App\Http\Resources\V1\Cecy\Participants\ParticipantResource;
use App\Http\Resources\V1\Cecy\Prerequisites\PrerequisiteCollection;
use App\Http\Resources\V1\Cecy\Users\UserResource;
use App\Http\Resources\V1\Core\Users\UserCollection;
use App\Models\Authentication\User;
use App\Models\Cecy\Catalogue;
use App\Models\Cecy\Course;
use App\Models\Cecy\Instructor;
use App\Models\Cecy\Participant;
use App\Models\Core\File;
use App\Models\Core\Image;
use Illuminate\Support\Facades\DB;

class GuachagmiraController extends Controller
{
    public function __construct()
    {
        // $this->middleware('permission:view-courses')->only(['view']);
        // $this->middleware('permission:view-topics')->only(['view']);
        // $this->middleware('permission:view-prerequisites')->only(['view']);
        // $this->middleware('permission:view-detailPlanifications')->only(['view']);
        // $this->middleware('permission:view-Instructors')->only(['view']);
        // $this->middleware('permission:view-Planifications')->only(['view']);
    }

    public function getCoursesByCategory(getCoursesByCategoryRequest $request)
    {
        $sorts = explode(',', $request->sort);

        $courses = Course::customOrderBy($sorts)
            ->category($request->input('category.id'))
            ->paginate();

        return (new CourseCollection($courses))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ])->response()->setStatusCode(200);
    }

    public function getCoursesByName(getCoursesByNameRequest $request)
    {
        $sorts = explode(',', $request->sort);

        $courses = Course::customOrderBy($sorts)
            ->name($request->input('name'))
            ->paginate();

        return (new CourseCollection($courses))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ])->response()->setStatusCode(200);
    }

    /*
        Obtener la información personal de cada instructor que dicta dado un curso
    */
    public function getInstructorsInformationByCourse(Course $course)
    {
        $planification = $course->planifications()->get();
        $detailPlanifications =  $planification->detailPlanifications()->get();
        $instructors =  $detailPlanifications->instructors()->get();
        $user_instructors = $instructors->user()->get();

        return (new UserCollection($user_instructors))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ])->response()->setStatusCode(200);
    }

    /*
        Obtener los horarios de cada paralelo dado un curso
    */
    public function getDetailPlanificationsByCourse(Course $course)
    {
        $planification = $course->planifications()->get();
        $detailPlanification = $planification
            ->detailPlanifications();

        return (new DetailPlanificationResource($detailPlanification))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ])->response()->setStatusCode(200);
    }

    /*
        Obtener los prerequisitos dado un curso
    */
    public function getPrerequisitesByCourse(Course $course)
    {
        $prerequisites = $course->prerequisite()->get();

        return (new PrerequisiteCollection($prerequisites))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ])
            ->response()->setStatusCode(200);
    }

    /*
        Obtener los topicos  dado un curso
    */

    public function getTopicsByCourse(Course $course)
    {
        $topics = $course->topics()->get();

        return (new TopicsByCourseCollection($topics))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    public function storeUser(StoreUserAndParticipantRequest $request)
    {
        $user = User::where('username', $request->input('username'))
            ->orWhere('email', $request->input('email'))->first();

        if (isset($user) && $user->username === $request->input('username')) {
            return (new UserResource($user))
                ->additional([
                    'msg' => [
                        'summary' => 'El usuario ya se encuentra registrado',
                        'detail' => 'Intente con otro nombre de usuario',
                        'code' => '200'
                    ]
                ])
                ->response()->setStatusCode(400);
        }

        if (isset($user) && $user->email === $request->input('email')) {
            return (new UserResource($user))
                ->additional([
                    'msg' => [
                        'summary' => 'El correo electrónico ya está en uso',
                        'detail' => 'Intente con otro correo electrónico',
                        'code' => '200'
                    ]
                ])->response()->setStatusCode(400);
        }

        $user = new User();
        $user->identificationType()->associate(Catalogue::find($request->input('identificationType.id')));
        $user->sex()->associate(Catalogue::find($request->input('sex.id')));
        $user->gender()->associate(Catalogue::find($request->input('gender.id')));
        $user->bloodType()->associate(Catalogue::find($request->input('bloodType.id')));
        $user->ethnicOrigin()->associate(Catalogue::find($request->input('ethnicOrigin.id')));
        $user->civilStatus()->associate(Catalogue::find($request->input('civilStatus.id')));

        $user->username = $request->input('username');
        $user->password = $request->input('password');
        $user->name = $request->input('name');
        $user->lastname = $request->input('lastname');
        $user->birthdate = $request->input('birthdate');
        $user->email = $request->input('email');

        DB::transaction(function () use ($request, $user) {
            $user->save();
            $user->addPhones($request->input('phones'));
            $user->addEmails($request->input('emails'));
            $participant = $this->storeParticipant($request, $user);
            $participant->save();
        });

        return (new UserResource($user))
            ->additional([
                'msg' => [
                    'summary' => 'Participante Creado',
                    'detail' => '',
                    'code' => '200'
                ]
            ])
            ->response()->setStatusCode(200);
    }


    public function storeParticipant(StoreUserAndParticipantRequest $request, User $user)
    {
        $catalogue = json_decode(file_get_contents(storage_path() . "/catalogue.json"), true);
        $state = Catalogue::where('code', $catalogue['participant_state']['to_be_approved'])->get();

        $participant = new Participant();
        $participant->user()->associate($user);
        $participant->personType()->associate(Catalogue::find($request->input('personType.id')));
        $participant->state()->associate($state);
        return $participant;
    }

    // Files
    public function showFileCourse(Course $courses, File $file)
    {
        return $courses->showFile($file);
    }

    public function showImageCourse(Course $courses, Image $image)
    {
        return $courses->showImage($image);
    }

    public function showFileInstructor(Instructor $instructor, File $file)
    {
        return $instructor->showFile($file);
    }

    public function showImageInstructor(Instructor $instructor, Image $image)
    {
        return $instructor->showImage($image);
    }

    public function downloadFile(User $user, File $file)
    {
        return $user->downloadFile($file);
    }

    public function showFile(User $user, File $file)
    {
        return $user->showFile($file);
    }

    public function updateFile(UpdateFileRequest $request, User $user, File $file)
    {
        return $user->updateFile($request, $file);
    }

    public function destroyFile(User $user, File $file)
    {
        return $user->destroyFile($file);
    }

    public function destroyFiles(User $user, DestroysFileRequest $request)
    {
        return $user->destroyFiles($request);
    }
}
