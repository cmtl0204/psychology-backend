<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Faker\generate as $faker;

class RegistrationsFactory extends Factory
{

    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Registration::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    
    public function definition()
    {
        $detailPlanifications = DetailPlanification::get();
        $participants = Participant::get();
        return [
            'detail_planification_id' => $detailPlanifications[rand(0, sizeof($detailPlanifications) - 1)],
                'participant_id'=>$participants[rand(0, sizeof($participants) - 1)],
                'state_id'=>$this->faker->randomNumber(50),
                'type_id'=>$this->faker->randomNumber(50),
                'state_course_id'=>$this->faker->randomNumber(50),
            'final_grade'=>$this->faker->randomFloat(2,1,100),
            'garde1'=>$this->faker->randomFloat(2,1,100),
            'grade2'=>$this->faker->randomFloat(1,100),
            'number'=>$this->faker->uuid(),
            'observations'=>$this->faker->sentence(10),
            'registered_at'=>$this->faker->date(),
        ];
    }
}
