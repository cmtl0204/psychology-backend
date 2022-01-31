<?php

namespace Database\Seeders\Cecy;

use App\Models\Cecy\Catalogue;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CoursesSeeder extends Seeder
{
    public function run()
    {
        $this->createCoursesCatalogue();
        $this->createCourses();
    }

    public function createCoursesCatalogue()
    {
        //Campos que son de catalogo
        //academic_period_id (hecho)
        //area_id    (debe hacerlo henrry)
        //entity_certification_id (hecho)
        //category_id (hecho)
        //capacitation_type_id (hecho)
        //certified_type_id (hecho)
        //compliance_indicators_id (Aun sin valores)
        //control_id  (Aun sin valores)
        //course_type_id (hecho)
        //frecuency_id (Aun sin valores)
        //modality_id (hecho)
        //means_verification_id (Aun sin valores)
        //participant_type_id (hecho)
        //speciality_id (debe hacerlo henrry)
        //state_id (hecho)
        $catalogue = json_decode(file_get_contents(storage_path() . "/catalogue.json"), true);
        Catalogue::factory()->sequence(
            [
                'code' => $catalogue['academic_period']['first'],
                'name' => 'PRIMERO',
                'type' => $catalogue['academic_period']['type'],
                'description' => 'Primer semestre'
            ],
            [
                'code' => $catalogue['academic_period']['second'],
                'name' => 'SEGUNDO',
                'type' => $catalogue['academic_period']['type'],
                'description' => 'Segundo semestre'
            ],
            [
                'code' => $catalogue['academic_period']['third'],
                'name' => 'TERCERO',
                'type' => $catalogue['academic_period']['type'],
                'description' => 'Terccer semestre'
            ],
            [
                'code' => $catalogue['academic_period']['fourth'],
                'name' => 'CUARTO',
                'type' => $catalogue['academic_period']['type'],
                'description' => 'Cuarto semestre'
            ],
            [
                'code' => $catalogue['academic_period']['fifth'],
                'name' => 'QUINTO',
                'type' => $catalogue['academic_period']['type'],
                'description' => 'Quinto semestre'
            ],
            [
                'code' => $catalogue['academic_period']['sixth'],
                'name' => 'SEXTO',
                'type' => $catalogue['academic_period']['type'],
                'description' => 'Sexto semestre'
            ],
            [
                'code' => $catalogue['academic_period']['seventh'],
                'name' => 'SEPTIMO',
                'type' => $catalogue['academic_period']['type'],
                'description' => 'Septimo semestre'
            ],
            [
                'code' => $catalogue['entity_certification']['senecyt'],
                'name' => 'Senecyt',
                'type' => $catalogue['entity_certification']['type'],
                'description' => 'Cuando la institución que lo avala es la Senecyt'
            ],
            [
                'code' => $catalogue['entity_certification']['setec'],
                'name' => 'Setec',
                'type' => $catalogue['entity_certification']['type'],
                'description' => 'Cuando la institución que lo avala es la Setec'
            ],
            [
                'code' => $catalogue['entity_certification']['cecy'],
                'name' => 'Cecy',
                'type' => $catalogue['entity_certification']['type'],
                'description' => 'Cuando la institución que lo avala es la Cecy'
            ],
            [
                'code' => $catalogue['category']['technical'],
                'name' => 'Técnico',
                'type' => $catalogue['category']['type'],
                'description' => 'Cuando el curso es técnico'
            ],
            [
                'code' => $catalogue['category']['administrative'],
                'name' => 'Administrativo',
                'type' => $catalogue['category']['type'],
                'description' => 'Cuando el curso es administrativo'
            ],
            [
                'code' => $catalogue['category']['english'],
                'name' => 'Inglés',
                'type' => $catalogue['category']['type'],
                'description' => 'Cuando el curso es de Ingles'
            ],
            [
                'code' => $catalogue['category']['teaching_course'],
                'name' => 'Docencia',
                'type' => $catalogue['category']['type'],
                'description' => 'Cuando el curso es de docencia'
            ],
            [
                'code' => $catalogue['category']['patern_tailoring'],
                'name' => 'Patronaje y confección',
                'type' => $catalogue['category']['type'],
                'description' => 'Cuando el curso es de patronaje y confección'
            ],
            [
                'code' => $catalogue['category']['pedagogical'],
                'name' => 'Pedagógico',
                'type' => $catalogue['category']['type'],
                'description' => 'Cuando el curso es de pedagogía'
            ],
            [
                'code' => $catalogue['capacitation']['course'],
                'name' => 'Curso',
                'type' => $catalogue['capacitation']['type'],
                'description' => 'Cuando el curso es de tipo capacitación'
            ],
            [
                'code' => $catalogue['capacitation']['workshop'],
                'name' => 'Taller',
                'type' => $catalogue['capacitation']['type'],
                'description' => 'Cuando el curso es de tipo taller'
            ],
            [
                'code' => $catalogue['capacitation']['webinar'],
                'name' => 'Webinar',
                'type' => $catalogue['capacitation']['type'],
                'description' => 'Cuando el curso es de tipo Webinar'
            ],
            [
                'code' => $catalogue['certificate']['assistance'],
                'name' => 'Asistencia',
                'type' => $catalogue['certificate']['type'],
                'description' => 'Cuando se obtiene un certificado por asistencia'
            ],
            [
                'code' => $catalogue['certificate']['approval'],
                'name' => 'Aprobación',
                'type' => $catalogue['certificate']['type'],
                'description' => 'Cuando se obtiene un certificado por aprobación'
            ],
            [
                'code' => $catalogue['course']['technical'],
                'name' => 'Técnico',
                'type' => $catalogue['course']['type'],
                'description' => 'Cuando el curso es de tipo Técnico'
            ],
            [
                'code' => $catalogue['course']['administrative'],
                'name' => 'Administrativo',
                'type' => $catalogue['course']['type'],
                'description' => 'Cuando el curso es de tipo administrativo'
            ],
            [
                'code' => $catalogue['modality']['presencial'],
                'name' => 'Presencial',
                'type' => $catalogue['modality']['type'],
                'description' => 'Cuando el curso se dicta de manera presencial'
            ],
            [
                'code' => $catalogue['modality']['virtual'],
                'name' => 'Virtual',
                'type' => $catalogue['modality']['type'],
                'description' => 'Cuando el curso se dicta de manera virtual'
            ],
            [
                'code' => $catalogue['participant']['teacher'],
                'name' => 'Docente',
                'type' => $catalogue['participant']['type'],
                'description' => 'Cuando el curso esta dedicado docentes'
            ],
            [
                'code' => $catalogue['participant']['public_company'],
                'name' => 'Empresa pùblica',
                'type' => $catalogue['participant']['type'],
                'description' => 'Cuando el curso esta dedicado para participantes de una empresa pública'
            ],
            [
                'code' => $catalogue['participant']['private_company'],
                'name' => 'Empresa privada',
                'type' => $catalogue['participant']['type'],
                'description' => 'Cuando el curso esta dedicado para participantes de una empresa privada'
            ],
            [
                'code' => $catalogue['participant']['external'],
                'name' => 'Estudiante externo',
                'type' => $catalogue['participant']['type'],
                'description' => 'Cuando el curso esta dedicado para estudiantes externos'
            ],
            [
                'code' => $catalogue['participant']['internal'],
                'name' => 'Estudiante interno',
                'type' => $catalogue['participant']['type'],
                'description' => 'Cuando el curso esta dedicado para estudiantes internos'
            ],
            [
                'code' => $catalogue['participant']['senecyt'],
                'name' => 'Senecyt',
                'type' => $catalogue['participant']['type'],
                'description' => 'Cuando el curso esta dedicado para personal del senecyt'
            ],
            [
                'code' => $catalogue['participant']['gad'],
                'name' => 'GAD',
                'type' => $catalogue['participant']['type'],
                'description' => 'Cuando el curso esta dedicado para personal del GAD'
            ],
            [
                'code' => $catalogue['course_state']['defeated'],
                'name' => 'Vencido',
                'type' => $catalogue['course_state']['type'],
                'description' => 'Cuando el estado del curso es vencido'
            ],
            [
                'code' => $catalogue['course_state']['to_be_approved'],
                'name' => 'Por aprobar',
                'type' => $catalogue['course_state']['type'],
                'description' => 'Cuando el estado del curso es por aprobar'
            ],
            [
                'code' => $catalogue['course_state']['approved'],
                'name' => 'Aprobado',
                'type' => $catalogue['course_state']['type'],
                'description' => 'Cuando el estado del curso es aprobado'
            ],
            [
                'code' => $catalogue['course_state']['not_approved'],
                'name' => 'No aprobado',
                'type' => $catalogue['course_state']['type'],
                'description' => 'Cuando el estado del curso es no parobado'
            ]
        );
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
                'cost' => 0, 00,
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
