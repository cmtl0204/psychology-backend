<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Models\Cecy\DetailPlanification;
use Illuminate\Http\Request;
use App\Models\Cecy\Catalogue;
use App\Http\Resources\V1\Cecy\DetailPlanifications\DetailPlanificationResource;
use App\Http\Resources\V1\Cecy\DetailPlanifications\DetailPlanificationCollection;

class PastranaController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:store-catalogues')->only(['store']);
        $this->middleware('permission:update-catalogues')->only(['update']);
        $this->middleware('permission:delete-catalogues')->only(['destroy', 'destroys']);
    }
  
    public function getCoursesByPeriod()
    {
        // Buscar peridos lectivos y carrera
    }
    
    public function indexPlanification()
    {
        // Va a visualizar todos las planificaciones
    }

    public function updateStateofCourse( )
    {
        // Actualiza el estado del curso dependiendo el OCS
    }

    public function bringCourseStates( )
    {
        // Traer el estado de los cursos del KPI, ya sea en el front end o por API
    }

    public function uploadsArrays( )
    {
        // Descargar matrices cuando el curso no esta aprobado
    }

    public function putAssignResponsibleTeacher()
    {
        //Asignar docente responsable
    }
}
