<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Resources\V1\Cecy\Attendances\AttendanceCollection;
use App\Http\Resources\V1\Cecy\Attendances\AttendanceResource;
use App\Http\Resources\V1\Cecy\Prerequisites\PlanificationResource;
use App\Http\Resources\V1\Cecy\Registrations\RegisterStudentResource;
use App\Models\Cecy\Attendance;
use App\Models\Cecy\DetailPlanification;
use App\Models\Cecy\Registration;
use Illuminate\Http\Client\Request;

class MolinaController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:view-courses')->only(['view']);
        $this->middleware('permission:view-attendances')->only(['view']);
        $this->middleware('permission:view-grades')->only(['view']);
        
    }

    //Ver todas las asistencias del estudiante
    public function getAttendace(Attendance $attendance)
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
    //Ver asistencia una por una del estudiante
    public function showAttendace(Attendance $attendance)
    {
        return (new AttendanceResource($attendance))
            ->additional([
                'msg' => [
                    'sumary' => 'consulta exitosa',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);


    }
    //Ver todos los cursos del estudiante en el cual esta matriculado
    public function getCourse(DetailPlanification $detailPlanification)
    {
        return (new PlanificationResource( $detailPlanification))
            ->additional([
                    'msg' => [
                        'sumary' => 'consulta exitosa', 
                        'detail' => '',
                        'code' => '200'
                    ]
                ]);

    }
    //Ver las notas del estudiante en curso que se encuentra
    public function showGrades(Registration $showGrades)
    {
        return (new RegisterStudentResource($showGrades))
            ->additional([
                    'msg' => [
                        'sumary' => 'consulta exitosa', 
                        'detail' => '',
                        'code' => '200'
                    ]
                ]);
    }
    //Descargar certificado del curso
    public function dowloadCertificate()
    {

    }
    // Guardar asistencia
    public function saveAttendances()
    {
    }
}
