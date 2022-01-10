<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Resources\V1\Cecy\Authorities\AuthorityCollection;
use App\Http\Resources\V1\Cecy\Authorities\AuthorityResource;
use App\Models\Authentication\User;
use App\Models\Cecy\Authority;
use App\Models\Cecy\Catalogue;
use App\Models\Cecy\Institution;
use App\Models\Core\State;
use Illuminate\Http\Client\Request;

class CatalogueController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:store-authorities')->only(['store']);
        $this->middleware('permission:update-authorities')->only(['update']);
        $this->middleware('permission:delete-authorities')->only(['destroy', 'destroys']);
    }

    public function index()
    {
        return (new AuthorityCollection($authorities))
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
        $authority = new Authority();
        $authority->course()->associate(Institution::find($request->input('institution.id')));
        $authority->course()->associate(User::find($request->input('user.id')));
        $authority->parent()->associate(State::find($request->input('state.id')));
        $authority->nivel()->associate(Catalogue::find($request->input('position.id')));
        $authority->position_started_at = $request->input('position_started_at');
        $authority->position_ended_at = $request->input('position_ended_at');
        $authority->firm = $request->input('firm');


        return (new AuthorityResource($authority))
            ->additional([
                'msg' => [
                    'summary' => 'Authoridad creada',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    public function show(Authority $authority)
    {
        return (new AuthorityResource($authority))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    public function update(Request $request, Authority $authority)
    {
        $authority->course()->associate(Institution::find($request->input('institution.id')));
        $authority->course()->associate(User::find($request->input('user.id')));
        $authority->parent()->associate(State::find($request->input('state.id')));
        $authority->nivel()->associate(Catalogue::find($request->input('position.id')));
        $authority->position_started_at = $request->input('position_started_at');
        $authority->position_ended_at = $request->input('position_ended_at');
        $authority->firm = $request->input('firm');
        $authority->save();

        return (new AuthorityResource($authority))
            ->additional([
                'msg' => [
                    'summary' => 'Autoridad actualizada',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    public function destroy(Authority $authority)
    {
        $authority->delete();
        return (new AuthorityResource($authority))
            ->additional([
                'msg' => [
                    'summary' => 'Autoridad eliminada',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
}
