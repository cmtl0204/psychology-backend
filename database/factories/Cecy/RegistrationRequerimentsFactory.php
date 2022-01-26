<?php

namespace Database\Factories;

use App\Models\Cecy\Registration;
use App\Models\Cecy\RegistrationRequirement;
use App\Models\Cecy\Requirement;
use Illuminate\Database\Eloquent\Factories\Factory;

class RegistrationRequerimentsFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = RegistrationRequirement::class;
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            $registrations = Registration::get();
            $requirements = Requirement::get();
            return [
                'registration_id' => $registrations[rand(0, sizeof($registrations) - 1)],
                    'requeriment_id'=>$requirements[rand(0, sizeof($requirements) - 1)],
                    'url'=>$this->faker->url(),
                    
            ];
        ];
    }
}
