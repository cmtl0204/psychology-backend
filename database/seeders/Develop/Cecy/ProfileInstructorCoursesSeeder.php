<?php

namespace Database\Seeders\Cecy;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProfileInstructorCoursesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->createProfileInstructorCoursesCatalogue();
        $this->createProfileInstructorCourses();
    }

    public function createProfileInstructorCoursesCatalogue()
    {
        //Campos que son de catalogo
    }
    public function createProfileInstructorCourses()
    {
        DB::select("insert into cecy.profile_instructor_courses(course_id, required_knowledge, required_experience, required_skills)VALUES('1','Conocimineto en Angular','2 años de experiencia en angular','habilidades en Base de datos y angular')");
        DB::select("insert into cecy.profile_instructor_courses(course_id, required_knowledge, required_experience, required_skills)VALUES('2','Conocimineto en Angular','2 años de experiencia en angular','habilidades en Base de datos y angular')");
        DB::select("insert into cecy.profile_instructor_courses(course_id, required_knowledge, required_experience, required_skills)VALUES('3','Conocimineto en Angular','2 años de experiencia en angular','habilidades en Base de datos y angular')");
        DB::select("insert into cecy.profile_instructor_courses(course_id, required_knowledge, required_experience, required_skills)VALUES('4','Conocimineto en Angular','2 años de experiencia en angular','habilidades en Base de datos y angular')");
        DB::select("insert into cecy.profile_instructor_courses(course_id, required_knowledge, required_experience, required_skills)VALUES('5','Conocimineto en Angular','2 años de experiencia en angular','habilidades en Base de datos y angular')");
    }
}
