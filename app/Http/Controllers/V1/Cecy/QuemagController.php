<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Models\Cecy\Catalogue;
use App\Http\Requests\V1\Cecy\Certificates\ShowParticipantsRequest;
use App\Http\Requests\V1\Core\Files\UploadFileRequest;
use App\Http\Resources\V1\Cecy\Certificates\CertificateResource;
use App\Http\Resources\V1\Cecy\Courses\CourseCollection;
use App\Models\Cecy\Course;
use App\Models\Core\File;

class QuemagController extends Controller
{
     public function __construct()
    {
    //     $this->middleware('permission:view-Planifications')->only(['view']);
    //     $this->middleware('permission:store-Planifications')->only(['store']);
    //     $this->middleware('permission:store-detailPlanifications')->only(['store']);
    //     $this->middleware('permission:update-detailPlanifications')->only(['update']);

    }

    public function showParticipants(ShowParticipantsRequest $request)
    {

    //trae participantes matriculados
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


    //Trae todos los cursos
    
    public function getCourses()
    {
    $courses = Course::get();

    return (new CourseCollection($courses))
    ->additional([
        'msg' => [
            'summary' => 'Me trae los cursos',
            'detail' => '',
            'code' => '200'
        ]
    ]);

    }

/*******************************************************************************************************************
        * FILES
******************************************************************************************************************/

     //Descargar matriz 
     public function downloadFile(Catalogue $catalogue, File $file)
     {
         return $catalogue->downloadFile($file);
     }

    //Descarga de plantilla
    public function downloadFileTemplate(Catalogue $catalogue, File $file)
       {
           return $catalogue->downloadFileTemplate($file);
       }

     //Subir certificado Firmado

     public function uploadFileCertificateFirm(UploadFileRequest $request, Catalogue $catalogue)
    {
        return $catalogue->uploadFileCertificateFirm($request);
    }

    //Carga de codigos certificado excel

    public function uploadFileCertificate(UploadFileRequest $request, Catalogue $catalogue)
    {
        return $catalogue->uploadFileCertificate($request);
    }

    //Descarga de certificados generados

    public function downloadFileCertificates(Catalogue $catalogue, File $file)
       {
           return $catalogue->downloadFileCertificates($file);
       }

     //Previsualizar la platilla
     public function showFile(Catalogue $catalogue, File $file)
     {
         return $catalogue->showFile($file);
     }


}
