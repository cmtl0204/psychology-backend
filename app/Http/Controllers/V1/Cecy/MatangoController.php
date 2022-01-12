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

    public function getCoursesByTeacher()
    {
       //trae los cursos asigandos al docente que este logueado
    }

    
    public function getCoursesByPeriod()
    {
        //busca peridos lectivos y carrera
    }


    public function getCarrers()
    {
        //trae todas las carreras
    }

    public function getmodalities()
    {
        //trae de todas las modalidades (Presencial o virtual)
    }

    public function getTypeOfAcquisition()
    {
        //trae los tipos de adquisicion (Gratis o Pago)
    }

    public function getCourseCategory()
    {
        //trae los tipos de categoria de curso (Tecnico, arte, patrimonio,etc)
    }
    
    public function getValidatingEntity()
    {
        //trae las entidades que validad un curso (Senecyt, SETEC, CECY)
    }
    
    public function getCourseType()
    {
        //trae los tipos de curso (Tecnico o Administrativo)
    }
    

    public function postNedsReport(Request $request)
    {
       //llena informacion general del informe de necesidades como Nombre corto, duracion, modalidad, entidad que lo valida, tipo de adquisicion, etc
    }

}
