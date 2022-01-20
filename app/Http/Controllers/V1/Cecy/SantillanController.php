<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Resources\V1\Cecy\Attendances\AttendanceCollection;
use App\Http\Resources\V1\Cecy\Attendances\AttendanceDetailPlanificationCollection;
use App\Http\Resources\V1\Cecy\Attendances\AttendanceResource;
use App\Models\Cecy\Attendance;
use App\Models\Cecy\Catalogue;
use App\Models\Cecy\DetailPlanification;
use App\Models\Cecy\PhotograficRecord;
use App\Models\Cecy\Registration;
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
    public function getAttendanceTeacher(Attendance $attendance)
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
    //traer fechas y horarios de un curso
    public function getDetailPlanification(DetailPlanification $detailPlanification){
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
    public function storeAttendanceTeacher(Request $request)
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
    public function showAttendanceTeacher(Attendance $attendance)
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
    public function updateAttendanceTeacher(Attendance $attendance, Request $request)
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

    public function destroyAttendanceTeacher(Attendance $attendance)
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
