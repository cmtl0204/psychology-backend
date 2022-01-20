<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Resources\V1\Cecy\Attendances\AttendanceCollection;
use App\Http\Resources\V1\Cecy\Attendances\AttendanceResource;
use App\Http\Resources\V1\Cecy\Courses\CourseCollection;
use App\Http\Resources\V1\Cecy\DetailRegistrations\DetailRegistrationResource;
use App\Models\Cecy\Attendance;
use App\Models\Cecy\Course;
use App\Models\Cecy\DetailRegistration;
use Illuminate\Http\Client\Request;

class MolinaController extends Controller
{
    /*public function __construct()
    {
        $this->middleware('permission:view-courses')->only(['view']);
        $this->middleware('permission:view-attendances')->only(['view']);
        $this->middleware('permission:view-grades')->only(['view']);
    }*/

    //Ver todas las asistencias del estudiante
    public function getAttendace()
    {
    }
    //Ver asistencia una por una del estudiante
    public function showAttendace()
    {
    }
    //Ver todos los cursos del estudiante
    public function getCourse()
    {
    }
    //Ver las notas del estudiante
    public function showGrades()
    {
    }
    //Descargar certificado
    public function dowloadCertificate()
    {
    }
    // Guardar asistencia
    public function saveAttendances()
    {
    }
}
