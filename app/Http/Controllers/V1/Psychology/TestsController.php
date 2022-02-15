<?php

namespace App\Http\Controllers\V1\Psychology;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Mail;
use App\Http\Resources\V1\Psychology\TestCollection;
use App\Http\Resources\V1\Psychology\TestResource;
use App\Models\Authentication\User;
use App\Models\Psychology\Answer;
use App\Models\Psychology\Question;
use App\Models\Psychology\Test;
use App\Models\Psychology\State;
use App\Models\Psychology\Priority;
use App\Models\Psychology\Result;
use App\Models\Psychology\Agent;
use App\Models\Core\Location;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Mail\Psychology\HighIntensityMailable;

class TestsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     */
    public function index(Request $request)
    {
        $sorts = explode(',', $request->input('sort'));

        $tests = Test::with('state')->paginate($request->input('per_page'));

        return (new TestCollection($tests))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ])
            ->response()->setStatusCode(200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $user = $this->saveUser($request);
        $test = new Test();
        $test->canton()->associate(Location::find($request->input('patient.canton.id')));
        $test->province()->associate(Location::find($request->input('patient.province.id')));
        $test->state()->associate(State::find(1));
        $test->user()->associate($user);

        $test->age = $request->input('patient.age');
        $test->code = $request->input('patient.username');
        $test->terms_conditions = true;
        $test->type = $request->input('type');
        $test->save();

        $test->priority()->associate($this->generatePriority($request, $test, $user));
        $test->save();

        if ($request->has('agent.identification')) {
            $this->saveAgent($request, $test);
        }
        $this->saveResults($request, $test);

        return (new TestResource($test))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ])
            ->response()->setStatusCode(200);
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    private function saveUser(Request $request)
    {
        $user = User::firstWhere('username', $request->input('patient.username'));
        $user = $user ? $user : new User();
        $user->name = $request->input('patient.name');
        $user->lastname = $request->input('patient.lastname');
        $user->username = $request->input('patient.username');
        $user->email = $request->input('patient.email');
        $user->phone = $request->input('patient.phone');
        $user->password = $request->input('patient.username');
        $user->save();

        return $user;
    }

    private function saveResults(Request $request, Test $test)
    {
        $results = $request->input('results');
        foreach ($results as $result) {
            $newResult = new Result();
            $answer = Answer::find($result['answer']['id']);
            $question = Question::find($result['question']['id']);
            $newResult->answer()->associate($answer);
            $newResult->question()->associate($question);
            $newResult->test()->associate($test);
            $newResult->created_at = $result['registeredAt'];
            $newResult->updated_at = $result['registeredAt'];
            $newResult->save();
        }
    }

    private function saveAgent(Request $request, Test $test)
    {
        $agent = new Agent();
        $agent->test()->associate($test);
        $agent->email = $request->input('agent.email');
        $agent->identification = $request->input('agent.identification');
        $agent->lastname = $request->input('agent.lastname');
        $agent->name = $request->input('agent.name');
        $agent->phone = $request->input('agent.phone');
        $agent->save();
    }

    private function generatePriority(Request $request, Test $test, User $user)
    {
        $results = $request->input('results');
        $score = 0;
        $level = 3;
        foreach ($results as $result) {
            $score += $result['answer']['score'];
        }
        switch ($test->type) {
            case 'phq9a':
            {
                if ($score >= 0 && $score <= 4) {
                    $level = 3;
                }
                if ($score >= 5 && $score <= 9) {
                    $level = 2;
                }
                if ($score >= 10 && $score <= 19) {
                    $level = 2;
                }
                if ($score >= 20 && $score <= 27) {
                    $level = 1;
                }
                break;
            }

            case 'psc17':
            {
                if ($score >= 0 && $score <= 13) {
                    $level = 3;
                }
                if ($score >= 14 && $score <= 21) {
                    $level = 2;
                }
                if ($score >= 22 && $score <= 34) {
                    $level = 1;
                }
                break;
            }
        }
        Mail::to($user->email)
            ->send(new HighIntensityMailable(
                'Notificación de test',
                json_encode(['user' => $user])
            ));
        return Priority::firstWhere('level', $level);
    }
}
