<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Resources\V1\Cecy\Attendances\AttendanceCollection;
use App\Http\Resources\V1\Cecy\Attendances\AttendanceResource;
use App\Models\Cecy\Attendance;
use App\Models\Cecy\Catalogue;
use App\Models\Cecy\DetailRegistration;
use Illuminate\Http\Client\Request;

class AttendanceController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:store-authorities')->only(['store']);
        $this->middleware('permission:update-authorities')->only(['update']);
        $this->middleware('permission:delete-authorities')->only(['destroy', 'destroys']);
    }

    public function index()
    {
        return (new AttendanceCollection($attendances))
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
        $attendance = new Attendance();
        $attendance->course()->associate(DetailRegistration::find($request->input('detail_registration.id')));
        $attendance->nivel()->associate(Catalogue::find($request->input('type.id')));
        $attendance->registered_at = $request->input('registered_at');
        $attendance->duration = $request->input('duration');

        return (new AttendanceResource($attendances))
            ->additional([
                'msg' => [
                    'summary' => 'asistencia creada',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    public function show(Attendance $attendance)
    {
        return (new AttendanceResource($attendance))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    public function update(Request $request, Attendance $attendance)
    {
        $attendance = new Attendance();
        $attendance->course()->associate(DetailRegistration::find($request->input('detail_registration.id')));
        $attendance->nivel()->associate(Catalogue::find($request->input('type.id')));
        $attendance->registered_at = $request->input('registered_at');
        $attendance->duration = $request->input('duration');
        $attendance->save();

        return (new AttendanceResource($attendance))
            ->additional([
                'msg' => [
                    'summary' => 'asistencia actualizada',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    public function destroy(Attendance $attendance)
    {
        $attendance->delete();
        return (new AttendanceResource($attendance))
            ->additional([
                'msg' => [
                    'summary' => 'asistencia eliminada',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
}
