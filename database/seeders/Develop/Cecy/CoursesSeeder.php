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
        $catalogue = json_decode(file_get_contents(storage_path() . "/catalogue.json"), true);
    }
    public function createCourses()
    {
    }
}
