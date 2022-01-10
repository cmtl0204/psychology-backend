<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Core\Catalogues\IndexCatalogueRequest;
use App\Http\Requests\V1\Core\Files\DestroysFileRequest;
use App\Http\Requests\V1\Core\Files\IndexFileRequest;
use App\Http\Requests\V1\Core\Files\UpdateFileRequest;
use App\Http\Requests\V1\Core\Files\UploadFileRequest;
use App\Http\Resources\V1\Core\Catalogues\CatalogueCollection;
use App\Models\Cecy\Course;
use App\Models\Cecy\Participant;
use App\Models\Cecy\AditionalInformations;
use App\Models\Cecy\indexCourses;
use App\Models\Cecy\indexAditionalInformations;
use App\Models\Cecy\indexAditionalInformations;


use App\Models\Core\File;

class RiveraController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:store-catalogues')->only(['index']);
    }

    public function index(IndexCatalogueRequest $request)
    {
        $sorts = explode(',', $request->sort);

        $catalogues = Catalogue::customOrderBy($sorts)
            ->type($request->input('type'))
            ->paginate();

        return (new CatalogueCollection($catalogues))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    public function all(IndexCatalogueRequest $request)
    {
        $catalogues = Catalogue::orderBy('name')
            ->type($request->input('type'))
            ->paginate($request->input('per_page'));

        return (new CatalogueCollection($catalogues))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    // subcaso 10 generar excel consultas
    public function indexCourses(IndexFileRequest $request, Course $course)
    {
        return $course->indexCourses($request);
    }
    public function indexDetailPlanifications(IndexFileRequest $request, DetailPlanifications $detailPlanifications)
    {
        return $detailPlanifications->indexDetailPlanifications($request);
    }
    public function indexAditionalInformations(IndexFileRequest $request, aditionalInformations $aditionalInformations)
    {
        return $aditionalInformations->indexAditionalInformations($request);
    }
    public function indexParticipants(IndexFileRequest $request, Participants $participants)
    {
        return $participants->indexParticipants($request);
    }
    public function indexAttendances(IndexFileRequest $request, Attendances $attendances)
    {
        return $attendances->indexAttendances($request);
    }
    public function indexPlanifications(IndexFileRequest $request, Planification $planification)
    {
        return $planification->indexFiles($request);
    }
    public function indexInstructors(IndexFileRequest $request, Instructors $instructor)
    {
        return $instructor->indexFiles($request);
    }

}
