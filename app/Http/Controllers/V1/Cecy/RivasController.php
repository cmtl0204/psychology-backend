<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Cecy\Participants\IndexParticipantRequest;
use App\Http\Requests\V1\Cecy\Participants\StoreParticipantRequest;
use App\Http\Requests\V1\Cecy\Planifications\IndexPlanificationRequest;
use App\Http\Requests\V1\Core\Users\IndexUserRequest;
use App\Http\Resources\V1\Cecy\Courses\CourseResource;
use App\Http\Resources\V1\Cecy\Participants\ParticipantResource;
use App\Http\Resources\V1\Cecy\Prerequisites\PlanificationCollection;
use App\Http\Resources\V1\Core\Users\UserResource;
use App\Models\Cecy\Participant;
use App\Models\Cecy\Planification;
use Illuminate\Http\Request;


class RivasController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:store-catalogues')->only(['store']);
        $this->middleware('permission:update-catalogues')->only(['update']);
        $this->middleware('permission:delete-catalogues')->only(['destroy', 'destroys']);
    }
    /*DDRC-C: Busca planificaciones vigentes por periodo */
    public function getPlanificationsByPeriod(IndexPlanificationRequest $request)
    {
        $sorts = explode(',', $request->sort);

        $vigentPlanifications = Planification::customOrderBy($sorts)
            ->category($request->input('category.id'))
            ->paginate();

        return (new PlanificationCollection($vigentPlanifications))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
/*DDRC-C: Busca participantes de un curso especifico*/
    public function getCourseParticipants(ParticipantResource $request)
    {
        $sorts = explode(',', $request->sort);

        $vigentPlanifications = Planification::customOrderBy($sorts)
            ->category($request->input('category.id'))
            ->paginate();

        return (new PlanificationCollection($vigentPlanifications))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
    /*DDRC-C: Busca informacion de un participante y de registro a un curso especifico */
    public function getParticipantInfo(IndexUserRequest $request)
    {
        $sorts = explode(',', $request->sort);

        $vigentPlanifications = Planification::customOrderBy($sorts)
            ->category($request->input('category.id'))
            ->paginate();

        return (new PlanificationCollection($vigentPlanifications))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
/*DDRC-C: actualiza la informacion de una inscripcion de un participante a un curso especifico  */
    public function updateParticpantRegistration(IndexParticipantRequest $request)
    {
        $sorts = explode(',', $request->sort);

        $vigentPlanifications = Planification::customOrderBy($sorts)
            ->category($request->input('category.id'))
            ->paginate();

        return (new PlanificationCollection($vigentPlanifications))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

/*DDRC-C: notifica a un participante de una observacion en su inscripcion*/
    public function notifyParticipant()
    {
      
    }
/*DDRC-C: elimina una matricula de un participante en un curso especifico */
    public function nullifyRegistration()
    {
    }
}
