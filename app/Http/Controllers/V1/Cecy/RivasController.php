<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Core\Catalogues\IndexCatalogueRequest;
use App\Http\Requests\V1\Core\Files\DestroysFileRequest;
use App\Http\Requests\V1\Core\Files\IndexFileRequest;
use App\Http\Requests\V1\Core\Files\UpdateFileRequest;
use App\Http\Requests\V1\Core\Files\UploadFileRequest;
use App\Http\Resources\V1\Core\Catalogues\CatalogueCollection;
use App\Models\Authentication\User;
use App\Models\Cecy\AdditionalInformation;
use App\Models\Cecy\Catalogue as CecyCatalogue;
use App\Models\Cecy\Participant;
use App\Models\Core\Catalogue;
use App\Models\Core\File;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ParticipantController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:store-catalogues')->only(['store']);
        $this->middleware('permission:update-catalogues')->only(['update']);
        $this->middleware('permission:delete-catalogues')->only(['destroy', 'destroys']);
    }
    /*DDRC-C: Busca participantes de cursos por periodo */
    public function getCoursesByPeriod($period)
    {
    }
/*DDRC-C: busca participantes de un curso especifico*/
    public function getCourseParticipants(Request $request)
    {
       
    }
    /*DDRC-C: busca informacion adicional de un participante  */

    
    public function getParticipantInfo(Request $request)
    {
        
    }
/*DDRC-C: actualiza la informacion de una inscripcion de un participante a un curso especifico  */
    public function updateParticpantRegistration(Participant $participant)
    {
       
    }

/*DDRC-C: notifica a un participante de una observacion en su inscripcion*/
    public function notifyParticipant(Request $request, Participant $participant)
    {
      
    }
/*DDRC-C: elimina una matricula de un participante en un curso especifico */
    public function nullifyRegistration(Request $request)
    {
    }
}
