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

class SantillanController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:store-authorities_teacher')->only(['store']);
        $this->middleware('permission:update-authorities_teacher')->only(['update']);
        $this->middleware('permission:delete-authorities_teacher')->only(['destroy', 'destroys']);
    }

    //ver todas las asistencias
    public function getAttendaceTeacher()
    {
       
    }
    //crear una asistencia a partir de las fechas y horarios de detalle planicacion.
    public function storeAttendaceTeacher()
    {
       
    }

    //ver asistencia una por una 
    public function showAttendaceTeacher()
    {
       
    }

    //editar o actualizar una asistencia
    public function updateAttendaceTeacher()
    {
       
    }
    //eliminar una asistencia

    public function destroyAttendaceTeacher()
    {
       
    }

    //subir notas de los estudiantes 
    public function uploadGrades()
    {
       
    }

    //subir evidencia fotografica
    public function uploadPhotograficRegister()
    {
       
    }

     //descargar plantilla de las notas 
     public function downloadTemplates()
     {
        
     }
}
