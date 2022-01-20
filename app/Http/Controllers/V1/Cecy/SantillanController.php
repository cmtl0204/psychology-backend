<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Cecy\Attendances\GetAttendanceDetailPlanificationRequest;
use App\Http\Requests\V1\Cecy\Planifications\GetPlanificationByResponsableCourseRequest;
use App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications\GetAttendanceTeacherRequest;
use App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications\ShowAttendanceTeacherRequest;
use App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications\StoreAttendanceTeacherRequest;
use App\Http\Requests\V1\Cecy\ResponsibleCourseDetailPlanifications\UpdateAttendanceTeacherRequest;
use App\Http\Requests\V1\Cecy\Topics\DestroysAttendanceTeacherRequest;
use App\Http\Resources\V1\Cecy\Attendances\AttendanceCollection;
use App\Http\Resources\V1\Cecy\Attendances\AttendanceDetailPlanificationCollection;
use App\Http\Resources\V1\Cecy\Attendances\AttendanceResource;
use App\Http\Resources\V1\Cecy\Attendances\DetailAttendanceResource;
use App\Http\Resources\V1\Cecy\DetailPlanifications\DetailPlanificationResource;
use App\Http\Resources\V1\Cecy\Planifications\PlanificationResource;
use App\Http\Resources\V1\Cecy\Registrations\RegisterStudentResource;
use App\Models\Cecy\Attendance;
use App\Models\Cecy\Catalogue;
use App\Models\Cecy\PhotograficRecord;
use Illuminate\Http\Client\Request;

class SantillanController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:store-authorities_teacher')->only(['store']);
        $this->middleware('permission:update-authorities_teacher')->only(['update']);
        $this->middleware('permission:delete-authorities_teacher')->only(['destroy', 'destroys']);
    }

    //ver todas las asistencias
    public function getAttendanceTeacher(GetAttendanceTeacherRequest $attendance)
    {
        return (new AttendanceCollection($attendance))
            ->additional([
                'msg' => [
                    'sumary' => 'consulta exitosa',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
    //asistencias de los estudiantes de un curso
    public  function ShowParticipantCourse(ShowParticipantsRequest $participants){

        $participants = course::where('course_id', $request->course()->id)->get();

        $registration = $participants
            ->detailAttendaces()
            ->registrations()
            ->attendances()
            ->participants()
            ->users()
            ->detailPlanifications()
            ->planifications()
            ->course()
            ->paginate($request->input('per_page'));

        return (new DetailAttendanceResource($registration))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
    //estudiantes de un curso y sus notas
    public  function ShowParticipantCourse(ShowParticipantsRequest $participants){

        $participants = course::where('course_id', $request->course()->id)->get();

        $registration = $participants
            ->registrations()
            ->participants()
            ->users()
            ->detailPlanifications()
            ->planifications()
            ->course()
            ->paginate($request->input('per_page'));

        return (new RegisterStudentResource($registration))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
    //cursos de un docente instructor
    public function showInstructorCourse(GetPlanificationByResponsableCourseRequest $responsableCorse){

        $responsableCourse = planification::where('responsable_course_id', $request->planification()->id)->get();

        $detailPlanification = $responsableCourse
            ->detailPlanifications()
            ->classRooms()
            ->planifications()
            ->intructors()
            ->users()
            ->course()
            ->paginate($request->input('per_page'));

        return (new DetailPlanificationResource($detailPlanification))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
    //traer fechas y horarios de un curso
    public function getDetailPlanification(GetAttendanceDetailPlanificationRequest $detailPlanification){
        return (new AttendanceDetailPlanificationCollection($detailPlanification))
            ->additional([
                    'msg' => [
                        'sumary' => 'consulta exitosa',
                        'detail' => '',
                        'code' => '200'
                    ]
                ]);
    }

    //crear una asistencia a partir de las fechas y horarios de detalle planificacion.
    public function storeAttendanceTeacher(StoreAttendanceTeacherRequest $request)
    {
        $attendance = new Attendance();

        $attendance->type_id()
            ->associate(Catalogue::find($request->input('type_id')));

        $attendance->duration = $request->input('duration');

        $attendance->register_at = $request->input('register_at');

        $attendance->save();

        return (new AttendanceResource($attendance))
            ->additional([
                'msg' => [
                    'summary' => 'Registro Creado',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    //ver asistencia una por una
    public function showAttendanceTeacher(ShowAttendanceTeacherRequest $attendance)
    {
        return (new AttendanceResource($attendance))
            ->additional([
                'msg' => [
                    'summary' => 'Asistencias encontradas',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    //editar o actualizar una asistencia
    public function updateAttendanceTeacher(UpdateAttendanceTeacherRequest $attendance, Request $request)
    {

        $attendance->type_id()
            ->associate(Catalogue::find($request->input('type_id')));

        $attendance->duration = $request->input('duration');

        $attendance->register_at = $request->input('register_at');

        $attendance->save();

        return (new AttendanceResource($attendance))
            ->additional([
                'msg' => [
                    'summary' => 'Registro actualizado',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
    //eliminar una asistencia

    public function destroysAttendanceTeacher(DestroysAttendanceTeacherRequest $attendance)
    {
        $attendance = Attendance::whereIn('id', $request->input('ids'))->get();
        Attendance::destroy($request->input('ids'));

        return (new AttendanceResource($attendance))
            ->additional([
                'msg' => [
                    'summary' => 'Asistencia eliminada',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    /*******************************************************************************************************************
     * FILES
     ******************************************************************************************************************/

    //subir notas de los estudiantes
    public function uploadFile(UploadFileRequest $request, Catalogue $catalogue)
    {
        return $catalogue->uploadFile($request);
    }


    //descargar plantilla de las notas
    public function downloadFile(Catalogue $catalogue, File $file)
    {
        return $catalogue->downloadFile($file);
    }

    //previsualizar la platilla de notas
    public function showFile(Catalogue $catalogue, File $file)
    {
        return $catalogue->showFile($file);
    }

    //eliminar el archivo existente para poder cargar de nuevo
    public function destroyFile(Catalogue $catalogue, File $file)
    {
        return $catalogue->destroyFile($file);
    }


    /*******************************************************************************************************************
     * IMAGES
     ******************************************************************************************************************/
    //subir evidencia fotografica
    public function uploadImage(UploadImageRequest $request, PhotograficRecord $photograficRecord)
    {
        $storagePath = storage_path('app/private/images/');
        $image = InterventionImage::make($image);
        $path = $storagePath . time() . '.jpg';
        $image->save($path, 75);

        return $photograficRecord->uploadImage($request);

    }

}
