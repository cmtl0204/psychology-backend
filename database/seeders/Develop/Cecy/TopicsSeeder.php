<?php

namespace Database\Seeders\Cecy;

use Illuminate\Database\Seeder;

class TopicsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->createTopicsCatalogue();
        $this->createTopics();
    }

    public function createTopicsCatalogue()
    {
        //Campos que son de catalogo
    }
    public function createTopics()
    {
    }
}
