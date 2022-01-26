<?php

namespace Database\Seeders\Cecy;

use Illuminate\Database\Seeder;
use App\Models\Cecy\Topic;

class TopicsSeeder extends Seeder
{
    public function run()
    {
        DB::table('topics')->insert(
            // TEMAS CURSO 1
            [
                'course_id' => 1,
                'parent_id' => null,
                'level' => 1,
                'description' => 'Base de datos avanzada'
            ],
            [
                'course_id' => 1,
                'parent_id' => 1, // id del tema principal
                'level' => 2,
                'description' => 'Comandos básicos'
            ],
            [
                'course_id' => 1,
                'parent_id' => 1,
                'level' => 2,
                'description' => 'Comandos de consultas SQL'
            ],
            [
                'course_id' => 1,
                'parent_id' => null,
                'level' => 1,
                'description' => 'Analisis y diseño'
            ],
            [
                'course_id' => 1,
                'parent_id' => 2,
                'level' => 2,
                'description' => 'Principipios para analisis de un proyecto'
            ],
            [
                'course_id' => 1,
                'parent_id' => 2,
                'level' => 2,
                'description' => 'Herramientas para diseñar prototipos'
            ],
            // TEMAS CURSO 2
            [
                'course_id' => 2,
                'parent_id' => null,
                'level' => 1,
                'description' => 'Introducción a VUE JS'
            ],
            [
                'course_id' => 2,
                'parent_id' => 3, // id del tema principal
                'level' => 2,
                'description' => 'Como crear un proyecto con vue'
            ],
            [
                'course_id' => 2,
                'parent_id' => 3,
                'level' => 2,
                'description' => 'Estructura de un archivo .vue'
            ],
            [
                'course_id' => 2,
                'parent_id' => null,
                'level' => 1,
                'description' => 'Componenten en vue'
            ],
            [
                'course_id' => 2,
                'parent_id' => 4,
                'level' => 2,
                'description' => 'Comunicación entre componetes'
            ],
            [
                'course_id' => 2,
                'parent_id' => 4,
                'level' => 2,
                'description' => 'Métodos en vue'
            ],
        );
    }
}
