<?php

namespace Database\Seeders\Cecy;

use App\Models\Authentication\User;
use App\Models\Cecy\Catalogue;
use App\Models\Cecy\Participant;
use Faker\Factory;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;

class ParticipantsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->createParticipantCatalogue();
        $this->createParticipants();
    }
    public function createParticipantCatalogue()
    {
        //Campos que son de catalogo
        //type_id
        //state_id
        $catalogue = json_decode(file_get_contents(storage_path() . "/catalogue.json"), true);
        Catalogue::factory(10)->sequence(
            [
                'code' => $catalogue['participant_state']['approved'],
                'name' => 'Aprobado',
                'type' => $catalogue['participant_state']['type'],
                'description' => 'Estado del estudiante de aprobado en el curso'
            ],
            [
                'code' => $catalogue['participant_state']['not_approved'],
                'name' => 'Reprobado',
                'type' => $catalogue['participant_state']['type'],
                'description' => 'Estado del estudiante cuando esta esperando ser aprobado'
            ],
            [
                'code' => $catalogue['participant_state']['to_be_approved'],
                'name' => 'Por aprobar',
                'type' => $catalogue['participant_state']['type'],
                'description' => 'Estado del estudiante de reprobado en el curso'
            ],
            [
                'code' => $catalogue['participant']['teacher'],
                'name' => 'Docente',
                'type' => $catalogue['participant']['type'],
                'description' => 'Cuando un participante de un curso es un docente'
            ],
            [
                'code' => $catalogue['participant']['private_company'],
                'name' => 'Empresa privada',
                'type' => $catalogue['participant']['type'],
                'description' => 'Cuando un participante de un curso es parte de una empresa privada'
            ],
            [
                'code' => $catalogue['participant']['public_company'],
                'name' => 'Empresa pública',
                'type' => $catalogue['participant']['type'],
                'description' => 'Cuando un participante de un curso es parte de una empresa pública'
            ],
            [
                'code' => $catalogue['participant']['training_company'],
                'name' => 'Empresa formadora',
                'type' => $catalogue['participant']['type'],
                'description' => 'Cuando un participante del curso es parte de una empresa formadora'
            ],
            [
                'code' => $catalogue['participant']['internal_student'],
                'name' => 'Estudiante interno',
                'type' => $catalogue['participant']['type'],
                'description' => 'Cuando un participante de un curso es propio de la institución'
            ],
            [
                'code' => $catalogue['participant']['external_student'],
                'name' => 'Estudiante externo',
                'type' => $catalogue['participant']['type'],
                'description' => 'Cuando un participante de un curso es externo a la institución'
            ],
            [
                'code' => $catalogue['participant']['senecyt_staff'],
                'name' => 'Senecyt',
                'type' => $catalogue['participant']['type'],
                'description' => 'Cuando un participante de un curso es parte del personal de la senecyt'
            ],
            [
                'code' => $catalogue['participant']['gad'],
                'name' => 'GAD',
                'type' => $catalogue['participant']['type'],
                'description' => 'Cuando un participante de un curso es parte del GAD'
            ]
        )->create();
    }
    public function createParticipants()
    {
        $faker = Factory::create();

        $states = Catalogue::where('type', 'PARTICIPANT_STATE')->get();
        $types = Catalogue::where('type', 'PARTICIPANT')->get();


        for ($i = 36; $i <= 85; $i++) {
            $user =  User::find($i);
            $user_roles =  $user->roles();
            Participant::factory()->create(
                [
                    'state_id' => $this->$faker->randomElement($states->id()),
                    'type_id' => $user_roles[0],
                    'user_id' => $i
                ]
            )->create();
        }
    }
}
