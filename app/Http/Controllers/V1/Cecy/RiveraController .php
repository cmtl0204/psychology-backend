<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;   
use Illuminate\Http\Request;
use App\Models\Cecy\Catalogue;    
use App\Http\Resources\V1\Cecy\DetailInstructors\DetailInstructorResource;
use App\Http\Resources\V1\Cecy\DetailInstructors\DetailInstructorCollection;
use App\Models\Cecy\DetailInstructor;


use App\Models\Core\File;

class RiveraDetailInstructorsController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:store')->only(['store']);
        $this->middleware('permission:update')->only(['update']);
        $this->middleware('permission:delete')->only(['destroy', 'destroys']);
    }

    public function indexPlanification()
    {
        return (new Collection($))
        ->additional([
            'msg' => [
                'summary' => 'success',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function ShowInformCourseNeeds(Request $request)
    {
    //trae un informe de nececidades de un curso en especifico por el docente que se logea
    }

    public function ShowMonthlySchedule(DetailInstructor $detailInstructor)
    {
    //trae todos los cursos planificados de un mes en especifico
    }

    public function ShowRecordCompetitor(Request $request,DetailInstructor $detailInstructor )
    {
    //trae todos los participantes registrados de un curso en especifico
    }

    public function ShowPhotographicRecord(DetailInstructor $detailInstructor)
    {
    //trae un registro fotografico de un curso en especifico por el docente que se loguea
    }
}
