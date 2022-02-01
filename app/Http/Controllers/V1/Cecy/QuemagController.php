<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Models\Cecy\Catalogue;
use App\Http\Requests\V1\Cecy\Certificates\ShowParticipantsRequest;
use App\Http\Requests\V1\Core\Files\UploadFileRequest;
use App\Http\Resources\V1\Cecy\Certificates\CertificateResource;
use App\Http\Resources\V1\Cecy\Courses\CourseCollection;
use App\Models\Cecy\Course;
use App\Models\Cecy\DetailPlanification;
use App\Models\Cecy\Planification;
use App\Models\Cecy\Registration;
use App\Models\Core\File;
use App\Models\Core\State;

class QuemagController extends Controller
{
    public function __construct()
    {
        //     $this->middleware('permission:view-Planifications')->only(['view']);
        //     $this->middleware('permission:store-Planifications')->only(['store']);
        //     $this->middleware('permission:store-detailPlanifications')->only(['store']);
        //     $this->middleware('permission:update-detailPlanifications')->only(['update']);

    }

    //trae participantes matriculados
    public function showParticipants(ShowParticipantsRequest $request, DetailPlanification $detailPlanification)
    {
        $responsibleCourse = course::where('course_id', $request->course()->id)->get();

        $registrations = $detailPlanification->registrations()
            ->paginate($request->input('per_page'));

        return (new CertificateResource($registrations))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    //Trae todos los cursos
    public function getPlanitifications()
    {
        $planifications = Planification::where(['state' => function ($state) {
            $state->where('code', State::APPROVED);
        }])->paginate...;

        return (new CourseCollection($planifications))
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
        $registratiton = Registration::find(1);

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
