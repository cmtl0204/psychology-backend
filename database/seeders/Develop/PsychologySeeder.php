<?php

namespace Database\Seeders\Develop;

use App\Models\Authentication\User;
use App\Models\Psychology\Answer;
use App\Models\Psychology\Assignment;
use App\Models\Psychology\Institution;
use App\Models\Psychology\Priority;
use App\Models\Psychology\Question;
use App\Models\Psychology\Result;
use App\Models\Psychology\State;
use App\Models\Psychology\Test;
use Illuminate\Database\Seeder;


class PsychologySeeder extends Seeder
{
    public function run()
    {
        $this->createStates();
        $this->createPriorities();
        $this->createQuestions();
        $this->createAnswers();
        $this->createInstitutions();
        $this->createTests();
        $this->createResultsPHQ9A();
        $this->createResultsPSC17();
        $this->createAssignments();
    }

    private function createStates()
    {
        State::factory(3)->sequence(
            [
                'code' => 'GENERATED',
                'name' => 'GENERADO',
                'order' => 1,
                'type' => 'App/Models/Psychology/Test'
            ],
            [
                'code' => 'ASSIGNED',
                'name' => 'ASIGNADO',
                'order' => 2,
                'type' => 'App/Models/Psychology/Test'
            ],
            [
                'code' => 'FINISHED',
                'name' => 'FINALIZADO',
                'order' => 3,
                'type' => 'App/Models/Psychology/Test'
            ]
        )->create();
    }

    private function createPriorities()
    {
        Priority::factory(3)->sequence(
            [
                'name' => 'ALTA',
                'level' => 1
            ],
            [
                'name' => 'MEDIA',
                'level' => 2
            ],
            [
                'name' => 'BAJA',
                'level' => 3
            ]
        )->create();
    }

    private function createQuestions()
    {
        Question::factory(2)->create([
            'type' => 'phq2'
        ]);

        Question::factory(9)->create([
            'type' => 'phq9a'
        ]);

        Question::factory(17)->create([
            'type' => 'psc17'
        ]);

        Question::factory(1)->create([
            'type' => 'duel'
        ]);
    }

    private function createAnswers()
    {
        Answer::factory(2)->sequence(
            [
                'question_id' => 1,
                'score' => 1,
                'value' => 'SI',
            ],
            [
                'question_id' => 1,
                'score' => 0,
                'value' => 'NO',
            ]
        )->create();

        Answer::factory(2)->sequence(
            [
                'question_id' => 2,
                'score' => 1,
                'value' => 'SI',
            ],
            [
                'question_id' => 2,
                'score' => 0,
                'value' => 'NO',
            ]
        )->create();

        foreach (Question::where('type', 'phq9a')->get() as $question) {
            Answer::factory(4)->sequence(
                [
                    'question_id' => $question->id,
                    'score' => 0,
                ],
                [
                    'question_id' => $question->id,
                    'score' => 1,
                ],
                [
                    'question_id' => $question->id,
                    'score' => 2,
                ],
                [
                    'question_id' => $question->id,
                    'score' => 3,
                ]
            )->create();
        }

        foreach (Question::where('type', 'psc17')->get() as $question) {
            Answer::factory(3)->sequence(
                [
                    'question_id' => $question->id,
                    'score' => 0,
                ],
                [
                    'question_id' => $question->id,
                    'score' => 1,
                ],
                [
                    'question_id' => $question->id,
                    'score' => 2,
                ]
            )->create();
        }

        foreach (Question::where('type', 'duel')->get() as $question) {
            Answer::factory(2)->sequence(
                [
                    'question_id' => $question->id,
                    'score' => $question->id,
                    'value' => 'SI',
                ],
                [
                    'question_id' => 1,
                    'score' => 0,
                    'value' => 'NO',
                ]
            )->create();
        }
    }

    private function createInstitutions()
    {
        Institution::factory(4)->sequence(
            [
                'code' => 'ABC1',
                'name' => 'INSTITUTO SUPERIOR TECNOLOGICO DE TURISMO Y PATRIMONIO YAVIRAC',
                'short_name' => 'YAVIRAC',
                'acronym' => 'ISTY'
            ],
            [
                'code' => 'ABC2',
                'name' => 'INSTITUTO SUPERIOR TECNOLOGICO BENITO JUAREZ',
                'short_name' => 'BENITO JUAREZ',
                'acronym' => 'ISTBJ'
            ],
            [
                'code' => 'ABC3',
                'name' => 'INSTITUTO SUPERIOR TECNOLOGICO GRAN COLOMBIA',
                'short_name' => 'GRAN COLOMBIA',
                'acronym' => 'ISTGC'
            ],
            [
                'code' => 'ABC4',
                'name' => 'INSTITUTO SUPERIOR TECNOLOGICO 24 DE MAYO',
                'short_name' => '24 DE MAYO',
                'acronym' => 'IST24M'
            ],
        )->create();
    }

    private function createTests()
    {
        foreach (User::get() as $user) {
            Test::factory()->create(['user_id' => $user->id]);
        }
    }

    private function createResultsPHQ9A()
    {
        $questions = Question::where('type', '<>', 'psc17')
            ->where('type', '<>', 'phq2')
            ->get();

        $tests = Test::where('id', '<=', 40)->get();

        foreach ($tests as $test) {
            Result::factory(2)
                ->sequence(
                    [
                        'question_id' => 1,
                        'test_id' => $test->id,
                        'answer_id' => 1,
                    ],
                    [
                        'question_id' => 2,
                        'test_id' => $test->id,
                        'answer_id' => 3,
                    ]
                )
                ->create();
            foreach ($questions as $question) {
                $answers = $question->answers()->get();

                Result::factory()->create(
                    [
                        'question_id' => $question->id,
                        'test_id' => $test->id,
                        'answer_id' => $answers[rand(0, (sizeof($answers) - 1))]->id,
                    ]
                );
            }

        }
    }

    private function createResultsPSC17()
    {
        $questions = Question::where('type', '<>', 'phq9a')
            ->where('type', '<>', 'phq2')
            ->get();

        $tests = Test::where('id', '>', 40)->get();

        foreach ($tests as $test) {
            Result::factory(2)
                ->sequence(
                    [
                        'question_id' => 1,
                        'test_id' => $test->id,
                        'answer_id' => 2,
                    ],
                    [
                        'question_id' => 2,
                        'test_id' => $test->id,
                        'answer_id' => 4,
                    ]
                )
                ->create();
            foreach ($questions as $question) {
                $answers = $question->answers()->get();

                Result::factory()->create(
                    [
                        'question_id' => $question->id,
                        'test_id' => $test->id,
                        'answer_id' => $answers[rand(0, (sizeof($answers) - 1))]->id,
                    ]
                );
            }

        }
    }

    private function createAssignments()
    {
        $institutions = Institution::get();
        foreach (Test::get() as $test) {
            Assignment::factory()->create(
                [
                    'institution_id'=>$institutions[rand(0,sizeof($institutions)-1)]->id,
                    'test_id'=>$test->id
                ]
            );
        }

    }
}
