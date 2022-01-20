<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Models\Cecy\Institution;
use Illuminate\Http\Request;
use App\Models\Cecy\Catalogue;
use App\Http\Resources\V1\Cecy\Institution\InstitutionResource;
use App\Http\Resources\V1\Cecy\Institution\InstitutionCollection;

class MatangoController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:store-catalogues')->only(['store']);
        $this->middleware('permission:update-catalogues')->only(['update']);
        $this->middleware('permission:delete-catalogues')->only(['destroy', 'destroys']);
    }


    public function getCoursesByResponsibleCourse(/*requestpendiente*/ $request)
    {

    }

    
    public function getCoursesByPeriod()
    {
        //busca peridos lectivos y carrera
    }


    public function getCarrers()
    {
        //trae todas las carreras
    }

    
    

    public function postNedsReport(Request $request)
    {
       //llena informacion general del informe de necesidades como Nombre corto, duracion, modalidad, entidad que lo valida, tipo de adquisicion, etc
    }

}
