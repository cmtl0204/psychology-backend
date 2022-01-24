<?php

namespace App\Http\Controllers\V1\Core;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Core\Locations\IndexLocationRequest;
use App\Http\Resources\V1\Core\LocationCollection;
use App\Models\Core\Location;

class LocationController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:store-locations')->only(['store']);
        $this->middleware('permission:update-locations')->only(['update']);
        $this->middleware('permission:delete-locations')->only(['destroy', 'destroys']);
    }

    public function index(IndexLocationRequest $request)
    {
        $sorts = explode(',', $request->sort);

        $locations = Location::customOrderBy($sorts)
            ->type($request->input('type'))
            ->paginate(1000);

        return (new LocationCollection($locations))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
}
