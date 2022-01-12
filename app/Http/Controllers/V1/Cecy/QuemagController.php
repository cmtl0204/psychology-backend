<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Cecy\Catalogue;    
use App\Http\Resources\V1\Cecy\Detailregistrations\DetailregistrationResource;
use App\Http\Resources\V1\Cecy\Detailregistrations\DetailregistrationCollection;
use App\Models\Cecy\DetailRegistration;

class QuemagController extends Controller
{
    // public function __construct()
    // {
    //     $this->middleware('permission:store')->only(['store']);
    //     $this->middleware('permission:update')->only(['update']);
    //     $this->middleware('permission:delete')->only(['destroy', 'destroys']);
    // }

    public function indexListAttendaces()
    {
       //mostrar lista de aprobados y no aprobados
    }

    public function downloadCertifiedNoSignature()
    {
       //descargar certificado sin firma individual
    }

    public function downloadMatrixApproved()
    {
       //Descargar matriz de todos los aprovados
    }

    public function uploadCertifiedSigned()
    {
        //Cargar Certificado individual Firmado
    }

    public function uploadCodeCertified()
    {
        //Cargar codigos de Certificados
    }

    public function putCodeCertified()
    {
        //Asignar codigos de Certificados Instructores
    }

    public function destroyArchiveCertified()
    {
        //Eliminar Certificado subido incorrectamente 
    }
    
    public function storesCodeCertified()
    {
        //Pendiente si es generacion de certificados masivamente como seria el metodo
    }
   
    public function storeCodeCertifiedNoSignature()
    {
        //generacion de certificados sin firma individualmente
    }

    public function downloadsCertifiedNoSignature()
    {
        //descargas masivas de certificados sin firma
    }

     public function uploadsCertifiedSigned()
     {
     //cargas masivas de certificados firmados 
     }

}
