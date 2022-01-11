<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Resources\V1\Cecy\SchoolPeriods\SchoolPeriodsCollection;
use App\Http\Resources\V1\Cecy\DetailsPlanifications\ResponsibleCourseDetailPlanificationCollection;
use App\Models\Cecy\Authority;
use App\Models\Cecy\Course;
use App\Models\Cecy\DetailPlanification;
use App\Models\Cecy\Planification;
use App\Models\Cecy\SchoolPeriod;
use App\Models\Core\Catalogue;
use App\Models\Core\Career;

class GuanunaController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:view-Planifications')->only(['view']);
        $this->middleware('permission:store-Planifications')->only(['store']);
        $this->middleware('permission:store-detailPlanifications')->only(['store']);
        $this->middleware('permission:update-detailPlanifications')->only(['update']);
        $this->middleware('permission:view-details_planifications')->only(['view']);
    }
    /**
     *  Planifications
     */

     //--Coordinador de carrera
//buscar peridos lectivos y carrera
public function getCoursesByPeriod()
{
}
//mostrar informacion de la planificacion
public function indexPlanification()
{

}
//Crear un curso y asignar responsable
public function postPlanificationCourse()
{

}
//consultar el detalle de planificacion
public function getdetailPlanification()
{

}
//recibir notificaciones
public function getnotification()
{
  
}
//--Responsable del CECY
//buscar peridos lectivos y carrera

//mostrar informacion de la planificación

//editar informacion del detalle planificación
public function updatedetailPlanification()
{

}
//eliminar datos.,

//recibir notificaciones
 

}