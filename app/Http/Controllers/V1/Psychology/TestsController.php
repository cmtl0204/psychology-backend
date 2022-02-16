<?php

namespace App\Http\Controllers\V1\Psychology;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Authentication\GenerateTransactionalCodeAuthRequest;
use App\Http\Requests\V1\Authentication\VerifyTransactionalCodeAuthRequest;
use App\Mail\Authentication\TransactionalCodeMailable;
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
     * @return JsonResponse|\Illuminate\Http\Response|object
     */
    public function store(Request $request)
    {
        $user = $this->saveUser($request);
        $agent = null;
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

        $score = $this->saveResults($request, $test);

        $test->priority()->associate($this->generatePriority($request, $test, $user));
        $test->score = $score;
        $test->save();

        if ($request->has('agent.identification')) {
            $agent = $this->saveAgent($request, $test);
        }


        if ($test->age < 18) {
            Mail::to($agent->email)
                ->send(new TestYoungerResultsMailable(
                    'ChatBot-Esquel Resultados del Test',
                    json_encode(['user' => $user, 'agent' => $agent, 'test' => $test])
                ));
        } else {
            Mail::to($user->email)
                ->send(new TestResultsMailable(
                    'ChatBot-Esquel Resultados del Test',
                    json_encode(['user' => $user, 'test' => $test])
                ));
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

    private function generatePriority(Request $request, Test $test, User $user)
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
                    if ($duelScore > 0) {
                        $level = 3;
                    }
                }
                if ($score >= 5 && $score <= 9) {
                    $level = 3;
                }
                if ($score >= 10 && $score <= 19) {
                    $level = 2;
                }
                if (($score >= 20 && $score <= 27) || $phq9AScore > 0) {
                    $level = 1;
                    Mail::to($user->email)
                        ->send(new HighIntensityMailable(
                            'ChatBot-Esquel Alta Intensidad',
                            json_encode(['user' => $user, 'test' => $test])
                        ));
                }
                break;
            }

            case 'psc17':
            {
                if ($score >= 0 && $score <= 13) {
                    $level = 4;
                    if ($duelScore > 0) {
                        $level = 3;
                    }
                }
                if ($score >= 14 && $score <= 21) {
                    $level = 2;
                }
                if ($score >= 22 && $score <= 34) {
                    $level = 1;
                    Mail::to($user->email)
                        ->send(new HighIntensityMailable(
                            'Notificación de test',
                            json_encode(['user' => $user, 'test' => $test])
                        ));
                }
                break;
            }
        }

        return Priority::firstWhere('level', $level);
    }

    public function generateTransactionalCode(GenerateTransactionalCodeAuthRequest $request)
    {
        $token = mt_rand(1000, 9999);

        TransactionalCode::create([
            'username' => $request->input('email'),
            'token' => $token
        ]);

        Mail::to($request->input('email'))
            ->send(new TransactionalCodeMailable(
                'Información Código de Seguridad',
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
}
