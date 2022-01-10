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

    public function index(Request $request)
    {
        $sorts = explode(',', $request->sort);

        $participants = Participant::customOrderBy($sorts)
            ->paginate();

        return (new Participant($participants))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    public function all(Request $request)
    {
        $participants = Participant::orderBy('user_id')
            ->type($request->input('type'))
            ->paginate($request->input('per_page'));

        return (new Participant($participants))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    
    public function store(Request $request)
    {
        $participant = Participant::where('user_id', $request->input('user_id'))
            ->first();

        if ($participant->user_id === $request->input('user_id')) {
            return (new Participant($participant))
                ->additional([
                    'msg' => [
                        'summary' => 'El participante ya se encuentra registrado',
                        'detail' => 'Intente con otro nombre de usuario',
                        'code' => '200'
                    ]
                ]);
        }

        $participant = new Participant();
        $participant->person_type_id()->associate(CecyCatalogue::find($request->input('person_type.id')));
        $participant->user_id()->associate(User::find($request->input('users.id')));
        $participant->additional_information()->associate(AdditionalInformation::find($request->input('additional_informations.id')));
        

        DB::transaction(function () use ($request, $participant) {
            $participant->save();

        });

        return (new Participant([$participant]))
            ->additional([
                'msg' => [
                    'summary' => 'Participante Creado',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    public function show(Participant $participant)
    {
        return (new Participant([$participant]))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    public function update(Request $request, Participant $participant)
    {
        $participant = new Participant();
        $participant->person_type_id()->associate(CecyCatalogue::find($request->input('person_type.id')));
        $participant->user_id()->associate(User::find($request->input('users.id')));
        $participant->additional_information()->associate(AdditionalInformation::find($request->input('additional_informations.id')));
        
        $participant->save();
        
        return (new Participant([$participant]))
            ->additional([
                'msg' => [
                    'summary' => 'Usuario Actualizado',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    public function destroy(Request $request, Participant $participant)
    {
        if ($request->participant()->id === $participant->id) {
            return response()->json([
                'msg' => [
                    'summary' => 'No se puede eliminar',
                    'detail' => 'No puede eliminar el usuario logueado',
                    'code' => '400'
                ],
            ], 400);
        }
        $participant->delete();
        return (new Participant([$participant]))
            ->additional([
                'msg' => [
                    'summary' => 'Usuario Eliminado',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    public function destroys(Request $request)
    {
        if (in_array($request->user()->id, $request->user_id)) {
            return response()->json([
                'msg' => [
                    'summary' => 'No se puedo eliminar',
                    'detail' => 'El usuario se encuentra logueado',
                    'code' => '400'
                ],
            ], 400);
        }

        $participant = Participant::whereIn('id', $request->input('ids'))->get();
        User::destroy($request->input('ids'));

        return (new Participant([$participant]))
            ->additional([
                'msg' => [
                    'summary' => 'Usuarios Eliminados',
                    'detail' => '',
                    'code' => '201'
                ]
            ]);
    }

}
