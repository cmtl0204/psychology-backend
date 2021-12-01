<?php

namespace Database\Factories\Core;

use App\Models\Core\Institution;
use Illuminate\Database\Eloquent\Factories\Factory;

class InstitutionFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Institution::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
           'code'=>$this->faker->ean8(),
           'denomination'=>$this->faker->ean8(),
           'email'=>$this->faker->companyEmail(),
           'phone'=>$this->faker->phoneNumber(),
           'web'=>$this->faker->url(),
        ];
    }
}
