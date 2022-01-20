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
        $this->middleware('permission:view-courses')->only(['view']);
        $this->middleware('permission:view-planification')->only(['view']);
    }
    
    // Filtrar peridos lectivos
    public function getCoursesByPeriod()
    {
        return (new SchoolPeriodsCollection($courses))
    ->additional([
        'msg' => [
            'summary' => '',
            'detail' => '',
            'code' => '200'
        ]
    ]);
    }
    
    
    //Buscar por aprobado
    public function getPlanificationsByApproved(getPlanificationsByApprovedRequest $request)
    {
        $sorts = explode(',', $request->sort);

        $planifications = Planification::customOrderBy($sorts)
            ->category($request->input('state.id'))
            ->paginate();

        return (new PlanificationCollection($planifications))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
    //Buscar por no aprobado
    public function getPlanificationsByNotApproved(getPlanificationsByNotApprovedRequest $request)
    {
        $sorts = explode(',', $request->sort);

        $planifications = Planification::customOrderBy($sorts)
            ->category($request->input('state.id'))
            ->paginate();

        return (new PlanificationCollection($planifications))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
    
    public function indexPlanification()
    {
        // Va a visualizar todos las planificaciones
    }

    public function updateStateofCourse( )
    {
        // Actualiza el estado del curso dependiendo el OCS
    }
    
    // Mostrar los KPI
    public function getCoursesKPI(Course $courses)
    {
        return (new Course($courses))
        ->additional([
        'msg' => [
            'summary' => '',
            'detail' => '',
            'code' => '200'
        ]
    ]);
    }


    public function putAssignResponsibleTeacher()
    {
        //Asignar docente responsable
    }

    // Adjuntar el acta de aprobación
    public function uploadFile(UploadFileRequest $request, Catalogue $catalogue)
    {
        return $catalogue->uploadFile($request);
    }
}
