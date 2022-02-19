<?php

namespace App\Http\Controllers\V1\Psychology;

use App\Http\Controllers\Controller;
use App\Http\Resources\V1\Psychology\AssignmentResource;
use App\Http\Resources\V1\Psychology\InstitutionCollection;
use App\Models\Core\State;
use App\Models\Psychology\Assignment;
use App\Models\Psychology\Institution;
use App\Models\Psychology\Test;
use Illuminate\Http\Request;

class InstitutionsController extends Controller
{
    public function all()
    {
        $institutions = Institution::get();

        return (new InstitutionCollection($institutions))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ])
            ->response()->setStatusCode(200);
    }

    public function assignmentTests(Request $request, Institution $institution)
    {
        $tests = $request->input('tests');

        foreach ($tests as $test) {
            $assignment = Assignment::where('test_id', $test['id'])
                ->where('ended_at', null)->first();
            if (isset($assignment)) {
                $assignment->delete();
            }

            $assignment = new Assignment();
            $test = Test::find($test['id']);
            $test->state()->associate(State::find(2));
            $test->save();

            $assignment->institution()->associate($institution);
            $assignment->test()->associate($test);
            $assignment->user()->associate($request->user());
            $assignment->started_at = now();
            $assignment->save();
        }

        return (new AssignmentResource($assignment))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ])
            ->response()->setStatusCode(200);
    }
}
