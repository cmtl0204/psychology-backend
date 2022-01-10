<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Resources\V1\Cecy\Attendances\AttendanceShowTeacherCollection;
use App\Http\Resources\V1\Cecy\Attendances\AttendanceShowTeacherResource;
use App\Models\Cecy\Attendance;
use App\Models\Cecy\Catalogue;
use App\Models\Cecy\Course;
use App\Models\Cecy\DetailRegistration;
use Illuminate\Http\Client\Request;

class SantillanAttendanceController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:store-authorities_teacher')->only(['store']);
        $this->middleware('permission:update-authorities_teacher')->only(['update']);
        $this->middleware('permission:delete-authorities_teacher')->only(['destroy', 'destroys']);
    }

    //ver todas las asistencias
    public function getAttendaceTeacher(Attendance $attendances)
    {
        return (new AttendanceShowTeacherCollection($attendances))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
    //crear una asistencia a partir de las fechas y horarios de detalle planicacion.
    public function storeAttendaceTeacher(Request $request)
    {
        $attendance = new Attendance();
        $attendance->course()->associate(DetailRegistration::find($request->input('detail_registration.id')));
        $attendance->nivel()->associate(Catalogue::find($request->input('type.id')));
        $attendance->registered_at = $request->input('registered_at');
        $attendance->duration = $request->input('duration');

        return (new AttendanceShowTeacherResource($attendance))
            ->additional([
                'msg' => [
                    'summary' => 'asistencia creada',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    //ver asistencia una por una 
    public function showAttendaceTeacher(Attendance $attendance)
    {
        return (new AttendanceShowTeacherResource($attendance))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    //editar o actualizar una asistencia
    public function updateAttendaceTeacher(Request $request, Attendance $attendance)
    {
        $attendance = new Attendance();
        $attendance->course()->associate(DetailRegistration::find($request->input('detail_registration.id')));
        $attendance->nivel()->associate(Catalogue::find($request->input('type.id')));
        $attendance->registered_at = $request->input('registered_at');
        $attendance->duration = $request->input('duration');
        $attendance->save();

        return (new AttendanceShowTeacherResource($attendance))
            ->additional([
                'msg' => [
                    'summary' => 'asistencia actualizada',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
    //eliminar una asistencia

    public function destroyAttendaceTeacher(Attendance $attendance)
    {
        $attendance->delete();
        return (new AttendanceShowTeacherResource($attendance))
            ->additional([
                'msg' => [
                    'summary' => 'asistencia eliminada',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
}
