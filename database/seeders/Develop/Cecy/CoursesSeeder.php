<?php

namespace Database\Seeders\Cecy;

use Illuminate\Database\Seeder;

class CoursesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->createCoursesCatalogue();
        $this->createCourses();
    }

    public function createCoursesCatalogue()
    {
        //Campos que son de catalogo
        //academic_period_id
        //area_id
        //entity_certification_id
        //category_id
        //capacitation_type_id
        //certified_type_id
        //compliance_indicators_id
        //control_id
        //course_type_id
        //frecuency_id
        //modality_id
        //means_verification_id
        //participant_type_id
        //speciality_id
        //state_id
    }
    public function createCourses()
    {
        DB::table('prerequisites')->insert(
            [
                'academic_period_id' => 0,
                'area_id' => 0,
                'entity_certification_id' => 0,
                'career_id' => 0,
                'category_id' => 0,
                'capacitation_type' => 0,
                'certified_type_id' => 0,
                'compliance_indicators_id' => 0,
                'control_id' => 0,
                'course_type_id' => 0,
                'frecuency_id' => 0,
                'modality_id' => 0,
                'means_verification_id' => 0,
                'abbreviation' => 'LARAVEL',
                'alignment' => 'Alineación del curso',
                'approved_at' => '2022-02-20',
                'bibliographies' => 'contenido',
                'code' => 'LAR123',
                'cost' => 0,00,
                'duration' => 160,
                'evaluation_mechanisms' => 'contenido',
                'expired_at' => '2022-04-20',
                // 'facilities' => 'contenido'
                'free' => true,
                'name' => 'Curso laravel',
                'needs' => 'necesidades del curso',
                'needed_at' => 'contenido',
                'record_number' => 'LAR0001',
                'learning_environments' => 'contenido',
                'local_proposal' => 'contenido',
                'objective' => 'Aprender a desarrollar con laravel',
                'observation' => 'Primer curso del cecy',
                // 'practical_phase' => 'contenido',
                'practice_hours' => 130,
                'proposed_at' => 'contenido',
                'project' => 'Sin proyecto',
                // 'required_installing_sources' => 'contenido',
                'setec_name' => 'CURSO AVANZADO DE LARAVEL',
                'summary' => 'Sin resumen',
                'target_group' => 'contenido',
                'teaching_strategies' => 'contenido',
                'techniques_requisites' => 'contenido',
                // 'theoretical_phase' => ,
                'theory_hours' => 30,
            ]
        );
    }
}
