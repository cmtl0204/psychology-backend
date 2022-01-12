<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;   
use Illuminate\Http\Request;
use App\Models\Cecy\Catalogue;    
use App\Http\Resources\V1\Cecy\DetailInstructors\DetailInstructorResource;
use App\Http\Resources\V1\Cecy\DetailInstructors\DetailInstructorCollection;
use App\Models\Cecy\DetailInstructor;


use App\Models\Core\File;

class RiveraController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:show')->only(['show']);
        
    }


    public function showInformCourseNeeds()
    {
    //trae un informe de nececidades de un curso en especifico por el docente que se logea
    }

    public function showMonthlySchedule()
    {
    //trae todos los cursos planificados de un mes en especifico
    }

    public function showRecordCompetitor()
    {
    //trae todos los participantes registrados de un curso en especifico
    }

    public function showPhotographicRecord()
    {
    //trae un registro fotografico de un curso en especifico por el docente que se loguea
    }
}
