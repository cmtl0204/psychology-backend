<?php

namespace App\Http\Controllers\V1\Core;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Core\Locations\IndexLocationRequest;
use App\Http\Resources\V1\Core\Catalogues\CatalogueCollection;
use App\Http\Resources\V1\Core\Users\LocationCollection;
use App\Models\Core\Location;

class LocationController extends Controller
{
    public function __construct()
    {
//        $this->middleware('role:admin')->only(['destroyTrashed']);
//
//        $this->middleware('permission:download-files')->only(['download']);
//        $this->middleware('permission:upload-files')->only(['upload']);
//        $this->middleware('permission:view-files')->only(['index', 'show']);
//        $this->middleware('permission:update-files')->only(['update']);
//        $this->middleware('permission:delete-files')->only(['destroy', 'destroys']);
    }

    /**
     * Display a listing of the resource.
     *
     * @return LocationCollection
     */
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
