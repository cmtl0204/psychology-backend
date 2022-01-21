<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Cecy\Catalogue;    
use App\Http\Resources\V1\Cecy\Detailregistrations\DetailregistrationResource;
use App\Http\Resources\V1\Cecy\Detailregistrations\DetailregistrationCollection;
use App\Models\Cecy\DetailRegistration;
use App\Http\Requests\V1\Cecy\Certificates\ShowParticipantsRequest;

class QuemagController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:view-Planifications')->only(['view']);
        $this->middleware('permission:store-Planifications')->only(['store']);
        $this->middleware('permission:store-detailPlanifications')->only(['store']);
        $this->middleware('permission:update-detailPlanifications')->only(['update']);

    }

    public function showParticipants(ShowParticipantsRequest $responsibleCourse)
    {
    //trae datos de los participantes matriculados
    $responsibleCourse = course::where('course_id', $request->course()->id)->get();

    $detailPlanifications = $responsibleCourse
        ->registrations()
        ->participants()
        ->users()
        ->additionalInformations()
        ->detailPlanifications()
        ->planifications()
        ->course()
        ->paginate($request->input('per_page'));

    return (new CertificateResource($detailPlanifications))
        ->additional([
            'msg' => [
                'summary' => 'success',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }


/*******************************************************************************************************************
        * FILES
******************************************************************************************************************/

     //descargar matriz A7
     public function downloadFile(Catalogue $catalogue, File $file)
     {
         return $catalogue->downloadFile($file);
     }

    //descarga de plantilla
    public function downloadFileTemplate(Catalogue $catalogue, File $file)
       {
           return $catalogue->downloadFileTemplate($file);
       }

     //subir certificado Firmado 

     public function uploadFileCertificateFirm(UploadFileRequest $request, Catalogue $catalogue)
    {
        return $catalogue->uploadFileCertificateFirm($request);
    }

    //carga de codigos certificado excel

    public function uploadFileCertificate(UploadFileRequest $request, Catalogue $catalogue)
    {
        return $catalogue->uploadFileCertificate($request);
    }

    //descarga de certificados generados

    public function downloadFileCertificates(Catalogue $catalogue, File $file)
       {
           return $catalogue->downloadFileCertificates($file);
       }

     //previsualizar la platilla 
     public function showFile(Catalogue $catalogue, File $file)
     {
         return $catalogue->showFile($file);
     }

   
}
