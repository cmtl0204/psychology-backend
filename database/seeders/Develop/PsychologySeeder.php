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
//        $this->createTests();
//        $this->createResultsPHQ9A();
//        $this->createResultsPSC17();
//        $this->createAssignments();
    }

    private function createStates()
    {
        State::factory(3)->sequence(
            [
                'code' => 'NOT_ASSIGNED',
                'name' => 'SIN ASIGNAR',
                'order' => 1,
                'type' => 'App/Models/Psychology/Tests'
            ],
            [
                'code' => 'ASSIGNED',
                'name' => 'ASIGNADO',
                'order' => 2,
                'type' => 'App/Models/Psychology/Tests'
            ],
            [
                'code' => 'FINISHED',
                'name' => 'CERRADO',
                'order' => 3,
                'type' => 'App/Models/Psychology/Tests'
            ]
        )->create();
    }

    private function createPriorities()
    {
        Priority::factory(4)->sequence(
            [
                'name' => 'Alta Intensidad',
                'level' => 1
            ],
            [
                'name' => 'Media Intensidad',
                'level' => 2
            ],
            [
                'name' => 'Baja Intensidad',
                'level' => 3
            ],
            [
                'name' => 'Sin Problemas',
                'level' => 4
            ]
        )->create();
    }

    private function createQuestions()
    {
        //PHQ2
        Question::factory(2)->sequence(
            [
                'order' => 1,
                'type' => 'phq2',
                'value' => 'En las últimas dos semanas, ¿te has sentido triste, deprimido o sin esperanzas?',
            ],
            [
                'order' => 2,
                'type' => 'phq2',
                'value' => 'En las últimas dos semanas, ¿Has perdido el interés o placer en hacer cosas que te hacían sentir bien?',
            ]
        )->create();

        //PHQ9A
        Question::factory(9)->sequence(
            [
                'order' => 1,
                'type' => 'phq9a',
                'value' => 'Si has perdido el interés, las ganas o el placer en hacer las cosas, ayúdame a saber ¿Cuánto días te has sentido así en las últimas dos semanas?',
            ],
            [
                'order' => 2,
                'type' => 'phq9a',
                'value' => 'Si te has sentido desanimado, deprimido o triste/sin esperanza, ayúdame a saber ¿Cuánto días te has sentido así en las últimas dos semanas?',
            ],
            [
                'order' => 3,
                'type' => 'phq9a',
                'value' => '¿Has tenido problemas para dormir o mantenerte dormido/a, o duermes demasiado?',
            ],
            [
                'order' => 4,
                'type' => 'phq9a',
                'value' => '¿Has sentido poco apetito o has estado comiendo en exceso?',
            ],
            [
                'order' => 5,
                'type' => 'phq9a',
                'value' => '¿Te has sentido cansado o con poca energía?',
            ],
            [
                'order' => 6,
                'type' => 'phq9a',
                'value' => '¿Te sientes mal por tí mismo/a, o has sentido que eres un/a fracasado/a, o que le has fallado a tu familia o a tí mismo?',
            ],
            [
                'order' => 7,
                'type' => 'phq9a',
                'value' => '¿Tienes problemas para concentrarte en cosas tales como tareas escolares, leer, o ver televisión?',
            ],
            [
                'order' => 8,
                'type' => 'phq9a',
                'value' => '¿Has sentado muy tranquilo/a  que los demás se han dado cuenta, o has estado muy intraquilo/a que las demás personas han podido notarlo?',
            ],
            [
                'order' => 9,
                'type' => 'phq9a',
                'value' => '¿Has tenido pensamientos de que sería mejor estar muerto/a o has querido hacerte daño de alguna forma?',
            ]
        )->create();

        //PSC17
        Question::factory(17)->sequence(
            [
                'order' => 1,
                'type' => 'psc17',
                'value' => 'En las últimas dos semanas, ¿te has sentido inquieto o se te dificulta mantenerte sentado o calmado?',
            ],
            [
                'order' => 2,
                'type' => 'psc17',
                'value' => '¿Sueñas despierto demasiado?',
            ],
            [
                'order' => 3,
                'type' => 'psc17',
                'value' => 'En las últimas dos semanas, ¿te has sentido triste o infeliz?',
            ],
            [
                'order' => 4,
                'type' => 'psc17',
                'value' => '¿Te niegas a compartir tus útiles escolares o tus pertenencias?',
            ],
            [
                'order' => 5,
                'type' => 'psc17',
                'value' => '¿Se te dificulta comprender los sentimientos de los demás?',
            ],
            [
                'order' => 6,
                'type' => 'psc17',
                'value' => '¿Te sientes sin esperanzas?',
            ],
            [
                'order' => 7,
                'type' => 'psc17',
                'value' => 'En las últimas dos semanas, ¿has tenido problemas para concentrarte?',
            ],
            [
                'order' => 8,
                'type' => 'psc17',
                'value' => '¿Te peleas con otros jóvenes en tu colegio o tu barrio?',
            ],
            [
                'order' => 9,
                'type' => 'psc17',
                'value' => '¿Te criticas a ti mismo?',
            ],
            [
                'order' => 10,
                'type' => 'psc17',
                'value' => '¿Culpas a otros por tus problemas?',
            ],
            [
                'order' => 11,
                'type' => 'psc17',
                'value' => 'En las últimas dos semanas, ¿parece que te diviertes menos?',
            ],
            [
                'order' => 12,
                'type' => 'psc17',
                'value' => 'Sientes que se te dificulta obedecer reglas',
            ],
            [
                'order' => 13,
                'type' => 'psc17',
                'value' => 'En las últimas dos semanas, ¿te has sentido muy activo o con mucha energía?',
            ],
            [
                'order' => 14,
                'type' => 'psc17',
                'value' => '¿Molestas o te burlas de otros?',
            ],
            [
                'order' => 15,
                'type' => 'psc17',
                'value' => 'En las últimas dos semanas, ¿te has sentido muy preocupado/a?',
            ],
            [
                'order' => 16,
                'type' => 'psc17',
                'value' => '¿Tomas cosas que no te pertenecen?',
            ],
            [
                'order' => 17,
                'type' => 'psc17',
                'value' => '¿Te es díficil mantener la atención o te distraes fácilmente?',
            ]
        )->create();

        //DUEL
        Question::factory(1)->sequence(
            [
                'order' => 1,
                'type' => 'duel',
                'value' => 'Durante la pandemia, ¿alguna persona importante de tu entorno ha fallecido?',
            ]
        )->create();
    }

    private function createAnswers()
    {
        //PHQ2
        Answer::factory(4)->sequence(
            [
                'question_id' => 1,
                'class' => 'p-button-info',
                'score' => 1,
                'order' => 1,
                'value' => 'SI',
            ],
            [
                'question_id' => 1,
                'class' => 'p-button-help',
                'score' => 0,
                'order' => 2,
                'value' => 'NO',
            ],
            [
                'question_id' => 2,
                'class' => 'p-button-info',
                'score' => 1,
                'order' => 1,
                'value' => 'SI',
            ],
            [
                'question_id' => 2,
                'class' => 'p-button-help',
                'score' => 0,
                'order' => 2,
                'value' => 'NO',
            ]
        )->create();

        foreach (Question::where('type', 'phq9a')->get() as $question) {
            Answer::factory(4)->sequence(
                [
                    'question_id' => $question->id,
                    'class' => 'p-button-info',
                    'order' => 1,
                    'score' => 0,
                    'value' => 'Para nada',
                ],
                [
                    'question_id' => $question->id,
                    'class' => 'p-button-help',
                    'order' => 2,
                    'score' => 1,
                    'value' => 'Varios días (entre 1 a 6 días)',
                ],
                [
                    'question_id' => $question->id,
                    'class' => 'p-button-warning',
                    'order' => 3,
                    'score' => 2,
                    'value' => 'La mitad de los días o más (entre 7 y 11 días)',
                ],
                [
                    'question_id' => $question->id,
                    'class' => 'p-button-secondary',
                    'order' => 4,
                    'score' => 3,
                    'value' => 'Casi todos los días (12 días o más)',
                ]
            )->create();
        }

        foreach (Question::where('type', 'psc17')->get() as $question) {
            Answer::factory(3)->sequence(
                [
                    'question_id' => $question->id,
                    'class' => 'p-button-info',
                    'order' => 1,
                    'score' => 0,
                    'value' => 'Nunca',
                ],
                [
                    'question_id' => $question->id,
                    'class' => 'p-button-help',
                    'order' => 2,
                    'score' => 1,
                    'value' => 'Algunas veces',
                ],
                [
                    'question_id' => $question->id,
                    'class' => 'p-button-warning',
                    'order' => 3,
                    'score' => 2,
                    'value' => 'Frecuentemente',
                ]
            )->create();
        }

        foreach (Question::where('type', 'duel')->get() as $question) {
            Answer::factory(2)->sequence(
                [
                    'question_id' => $question->id,
                    'class' => 'p-button-info',
                    'order' => 1,
                    'score' => 1,
                    'value' => 'SI',
                ],
                [
                    'question_id' => $question->id,
                    'class' => 'p-button-help',
                    'order' => 2,
                    'score' => 0,
                    'value' => 'NO',
                ]
            )->create();
        }
    }

    private function createInstitutions()
    {
        Institution::factory(8)->sequence(
            [
                'code' => 'ABC1',
                'name' => 'ORGAEPSI',
                'short_name' => 'ORGAEPSI',
                'acronym' => 'ORGAEPSI'
            ],
            [
                'code' => 'ABC2',
                'name' => 'PUCE',
                'short_name' => 'PUCE',
                'acronym' => 'PUCE'
            ],
            [
                'code' => 'ABC3',
                'name' => 'SEK',
                'short_name' => 'SEK',
                'acronym' => 'SEK'
            ],
            [
                'code' => 'ABC4',
                'name' => 'INDOAMERICA',
                'short_name' => 'INDOAMERICA',
                'acronym' => 'INDOAMERICA'
            ],
            [
                'code' => 'ABC5',
                'name' => 'ESPOCH',
                'short_name' => 'ESPOCH',
                'acronym' => 'ESPOCH'
            ],
            [
                'code' => 'ABC6',
                'name' => 'UNACH',
                'short_name' => 'UNACH',
                'acronym' => 'UNACH'
            ],
            [
                'code' => 'ABC7',
                'name' => 'MSP',
                'short_name' => 'MSP',
                'acronym' => 'MSP'
            ],
            [
                'code' => 'ABC8',
                'name' => 'OTROS',
                'short_name' => 'OTROS',
                'acronym' => 'OTROS'
            ],
        )->create();
    }

    private function createTests()
    {
        for ($i = 1; $i <= 10; $i++) {
            foreach (User::get() as $user) {
                Test::factory()->create(['user_id' => $user->id]);
            }
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
                    'institution_id' => $institutions[rand(0, sizeof($institutions) - 1)]->id,
                    'test_id' => $test->id
                ]
            );
        }

    }
}
