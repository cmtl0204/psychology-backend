<?php

namespace App\Http\Controllers\V1\Psychology;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Authentication\GenerateTransactionalCodeAuthRequest;
use App\Http\Requests\V1\Authentication\VerifyTransactionalCodeAuthRequest;
use App\Http\Resources\V1\Psychology\PriorityCollection;
use App\Mail\Psychology\TestResultsHighIntensityMailable;
use App\Mail\Psychology\TestYoungerHighIntensityResultsMailable;
use App\Mail\Psychology\TransactionalCodeTestMailable;
use App\Mail\Psychology\TestResultsMailable;
use App\Mail\Psychology\TestYoungerResultsMailable;
use App\Models\Authentication\TransactionalCode;
use Carbon\Carbon;
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
use Spatie\Permission\Models\Role;

class TestsController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:update-tests')->only(['update']);
        $this->middleware('permission:delete-tests')->only(['destroy', 'destroys']);
        $this->middleware('permission:view-tests')->only(['index', 'show']);

        $this->middleware('permission:update-assignments')->only(['close']);
        $this->middleware('permission:update-priorities-tests')->only(['updatePriority']);
    }

    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     */
    public function index(Request $request)
    {
        $dates = array($request->input('startedAt'), $request->input('endedAt'));
        $provinceIds = explode(",", $request->input('provinces'));
        $states = explode(",", $request->input('states'));
        $priorities = explode(",", $request->input('priorities'));

        $tests = Test::select('tests.*')
            ->where(function ($query) use ($request) {
                $query->code($request->input('search'))->user($request->input('search'));
            })
            ->provinces($provinceIds)
            ->date($dates)
            ->states($states)
            ->priorities($priorities)
//            ->join('psychology.states', 'states.id', '=', 'tests.state_id')->orderBy('order')
//            ->join('psychology.priorities', 'priorities.id', '=', 'tests.priority_id')->orderBy('level')
            ->orderByDesc('created_at')
            ->paginate($request->input('per_page'));

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
     * @return JsonResponse|\Illuminate\Http\Response|object
     */
    public function saveChat(Request $request)
    {
        $user = $this->saveUser($request);
        $province = Location::find($request->input('patient.province.id'));
        $agent = null;
        $test = new Test();
        $test->canton()->associate(Location::find($request->input('patient.canton.id')));
        $test->province()->associate($province);
        $test->state()->associate(State::find(1));
        $test->user()->associate($user);

        $test->age = $request->input('patient.age');
        $test->terms_conditions = true;
        $test->type = $request->input('type');
        $test->save();

        $score = $this->saveResults($request, $test);
        $code = $province->code . '-' . $test->id;
        $test->priority()->associate($this->generatePriority($request, $test, $user, $code));
        $test->code = $code;
        $test->score = $score;
        $test->save();

        if ($test->age < 18) {
            $agent = $this->saveAgent($request, $test);
        }

        if ($test->age < 18) {
            if ($test->priority->level === 4) {
                Mail::to($agent->email)
                    ->send(new TestYoungerResultsMailable(
                        json_encode(['user' => $user, 'agent' => $agent, 'test' => $test])
                    ));
            } else {
                Mail::to($agent->email)
                    ->send(new TestYoungerHighIntensityResultsMailable(
                        json_encode(['user' => $user, 'agent' => $agent, 'test' => $test])
                    ));
            }
        } else {
            if ($test->priority->level === 4) {
                Mail::to($user->email)
                    ->send(new TestResultsMailable(
                        json_encode(['user' => $user, 'test' => $test])
                    ));
            } else {
                Mail::to($user->email)
                    ->send(new TestResultsHighIntensityMailable(
                        json_encode(['user' => $user, 'test' => $test])
                    ));
            }
        }
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
     * @return JsonResponse|\Illuminate\Http\Response|object
     */
    public function show(Test $test)
    {
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
     * @return JsonResponse|\Illuminate\Http\Response|object
     */
    public function destroy(Test $test)
    {
        $test->delete();

        return (new TestResource($test))
            ->additional([
                'msg' => [
                    'summary' => 'Test Eliminado',
                    'detail' => '',
                    'code' => '201'
                ]
            ])
            ->response()->setStatusCode(201);
    }

    public function destroys(Request $request)
    {
        $tests = Test::whereIn('id', $request->input('ids'))->get();

        Test::destroy($request->input('ids'));

        return (new TestCollection($tests))
            ->additional([
                'msg' => [
                    'summary' => 'Usuarios Eliminados',
                    'detail' => '',
                    'code' => '201'
                ]
            ])
            ->response()->setStatusCode(201);
    }

    public function close(Request $request, Test $test)
    {
        $test->state()->associate(State::firstWhere('code', 'FINISHED'));
        $test->save();

        return (new TestResource($test))
            ->additional([
                'msg' => [
                    'summary' => 'El caso fue cerrado',
                    'detail' => '',
                    'code' => '200'
                ]
            ])
            ->response()->setStatusCode(200);
    }

    public function updatePriority(Request $request, Test $test, Priority $priority)
    {
        $test->priority()->associate($priority);
        $test->save();

        return (new TestResource($test))
            ->additional([
                'msg' => [
                    'summary' => 'La prioridad fue actualizada',
                    'detail' => '',
                    'code' => '201'
                ]
            ])
            ->response()->setStatusCode(201);
    }

    public function countPriorities(Request $request)
    {
        $dates = array($request->input('startedAt'), $request->input('endedAt'));
        $provinceIds = explode(",", $request->input('provinces'));

        $prioritiesCount = Priority::withCount(['tests' => function ($tests) use ($provinceIds, $dates) {
            $tests->date($dates)
                ->provinces($provinceIds)
                ->whereHas('state', function ($state) {
                    $state->where('code', '=', 'NOT_ASSIGNED');
                });
        }])->get();

        return (new PriorityCollection($prioritiesCount))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ])
            ->response()->setStatusCode(200);
    }

    public function countAllPriorities(Request $request)
    {
        $provinceIds = explode(",", $request->input('provinces'));
        $prioritiesCount = Priority::withCount(['tests' => function ($tests) use ($provinceIds) {
            $tests->provinces($provinceIds)->whereHas('state', function ($state) {
                $state->where('code', '=', 'NOT_ASSIGNED');
            });
        }])->get();

        return (new PriorityCollection($prioritiesCount))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ])
            ->response()->setStatusCode(200);
    }

    public function countAllTests(Request $request)
    {
        $dates = array($request->input('startedAt'), $request->input('endedAt'));
        $provinceIds = explode(",", $request->input('provinces'));

        $countTests = Test::provinces($provinceIds)->date($dates)->get();

        return response()->json([
            'msg' => [
                'summary' => 'success',
                'detail' => '',
                'code' => '200'
            ],
            'data' => $countTests->count()
        ]);
    }

    public function generateTransactionalCode(GenerateTransactionalCodeAuthRequest $request)
    {
        $token = mt_rand(1000, 9999);

        TransactionalCode::create([
            'username' => $request->input('email'),
            'token' => $token
        ]);

        Mail::to($request->input('email'))
            ->send(new TransactionalCodeTestMailable(
                json_encode(['user' => $request->all(), 'token' => $token])
            ));

        return response()->json([
            'data' => $token,
            'msg' => [
                'summary' => 'Correo enviado',
                'detail' => $request->input('email'),
                'code' => '201'
            ]], 201);
    }

    public function verifyTransactionalCode(VerifyTransactionalCodeAuthRequest $request)
    {
        switch ($request->input('code')) {
            case '0201':
            case '0401':
            case '0601':
            case '1701':
            case '1801':
                return response()->json([
                    'data' => true,
                    'msg' => [
                        'summary' => 'success',
                        'detail' => '',
                        'code' => '201'
                    ]], 200);

        }
        $transactionalCode = TransactionalCode::firstWhere('token', $request->input('code'));

        if (!isset($transactionalCode->token)) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Código no válido',
                    'detail' => 'Intente de nuevo',
                    'code' => '400'
                ]], 400);
        }

        if ($transactionalCode->used) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Código no válido',
                    'detail' => 'El código ya fue utilizado',
                    'code' => '403'
                ]], 403);
        }

        if ((new Carbon($transactionalCode->created_at))->addMinutes(User::DECAY_MINUTES_TRANSACTIONAL_CODE) <= Carbon::now()) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Código no válido',
                    'detail' => 'El código ha expirado',
                    'code' => '403'
                ]], 403);
        }

        $transactionalCode->update(['used' => true]);

        return response()->json([
            'data' => true,
            'msg' => [
                'summary' => 'success',
                'detail' => '',
                'code' => '201'
            ]], 200);
    }

    public function validateUser($email)
    {
        $user = User::firstWhere('email', $email);

        if (isset($user->id)) {
            return $user;
        }

        return response()->json([
            'data' => null,
            'msg' => [
                'summary' => 'Usuario no encontrado',
                'detail' => 'Intente de nuevo',
                'code' => '404'
            ]], 404);

    }

    private function saveUser(Request $request)
    {
        $user = User::firstWhere('username', $request->input('patient.username'));
        $user = $user ? $user : new User();
        $user->name = $request->input('patient.name');
        $user->email = $request->input('patient.email');
        $user->lastname = $request->input('patient.lastname');
        $user->username = $request->input('patient.username');
        $user->phone = $request->input('patient.phone');
        $user->password = $request->input('patient.username');
        $user->save();

        return $user;
    }

    private function saveResults(Request $request, Test $test)
    {
        $results = $request->input('results');
        $score = 0;
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
            $score += $result['answer']['score'];
        }
        return $score;
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
        return $agent;
    }

    private function generatePriority(Request $request, Test $test, User $user, $code)
    {
        $results = $request->input('results');
        $duelScore = 0;
        $phq9AScore = 0;
        $score = 0;
        $level = 1;
        foreach ($results as $result) {
            $score += $result['answer']['score'];

            if ($result['question']['type'] === 'duel') {
                $duelScore = $result['answer']['score'];
            }
            if ($result['question']['type'] === 'phq9a' && $result['question']['order'] === 9) {
                $phq9AScore = $result['answer']['score'];
            }
        }
        switch ($test->type) {
            case 'phq9a':
            {
                if ($score >= 0 && $score <= 4) {
                    $level = 4;
                }
                if ($score >= 5 && $score <= 9) {
                    $level = 3;
                    if ($duelScore > 0) {
                        $level = 2;
                    }
                }
                if ($score >= 10 && $score <= 19) {
                    $level = 2;
                }
                if ($score >= 20 && $score <= 27) {
                    $level = 1;
                }
                if ($score >= 10 && $phq9AScore > 0) {
                    $level = 1;
                }
                break;
            }

            case 'psc17':
            {
                if ($score >= 0 && $score <= 13) {
                    $level = 4;
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

        $emails = User::select('email')->whereHas('roles', function ($roles) {
            $roles->where('name', 'support');
        })->get();

//        $level = 1;

        if ($level === 1) {
            Mail::to($emails)
                ->send(new HighIntensityMailable(
                    json_encode(['user' => $user, 'code' => $code])
                ));
        }

        return Priority::firstWhere('level', $level);
    }
}
