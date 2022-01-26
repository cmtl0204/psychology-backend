<?php

namespace Database\Seeders\Cecy;

use App\Models\Cecy\Catalogue;
use App\Models\Cecy\Participant;
use Illuminate\Database\Seeder;

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
        $catalogue = json_decode(file_get_contents(storage_path() . "/catalogue.json"), true);
        Catalogue::factory()->sequence(
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
                'code' => $catalogue['participant']['egresade'],
                'name' => 'Egresado',
                'type' => $catalogue['participant']['type'],
                'description' => 'Cuando un participante de un curso es egresado de alguna carrera'
            ],
            [
                'code' => $catalogue['participant']['graduate'],
                'name' => 'Graduado',
                'type' => $catalogue['participant']['type'],
                'description' => 'Cuando un participante de un curso es graduado de alguna carrera'
            ],
            [
                'code' => $catalogue['participant']['internal'],
                'name' => 'Interno',
                'type' => $catalogue['participant']['type'],
                'description' => 'Cuando un participante de un curso es propio de la institución'
            ],
            [
                'code' => $catalogue['participant']['external'],
                'name' => 'Externo',
                'type' => $catalogue['participant']['type'],
                'description' => 'Cuando un participante de un curso es externo a la institución'
            ]
        )->create();
    }
    public function createParticipants()
    {
        Participant::factory(100)->create();
    }
}
