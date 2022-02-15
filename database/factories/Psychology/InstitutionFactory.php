<?php

namespace Database\Factories\Psychology;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Psychology\Institution;

class InstitutionFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    protected $model = Institution::class;

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
