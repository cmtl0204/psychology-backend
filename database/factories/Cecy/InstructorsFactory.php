<?php

namespace Database\Factories;

use App\Models\Authentication\User;
use App\Models\Cecy\Catalogue;
use Illuminate\Database\Eloquent\Factories\Factory;

class InstructorsFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        // $catalogue = json_decode(file_get_contents(storage_path() . "/catalogue.json"), true);
        // $users  = User::get();

        // $active =  Catalogue::where('code', $catalogue['instructor_state']['active']);
        // $inactive =  Catalogue::where('code', $catalogue['instructor_state']['inactive']);

        // $senescyt = Catalogue::where('code', $catalogue['instructor_type']['senescyt']);
        // $setec = Catalogue::where('code', $catalogue['instructor_type']['setec']);
        // $external = Catalogue::where('code', $catalogue['instructor_type']['external']);

        // return [
        //     'user_id' => $this->faker->randomElement(52, 81),
        //     'state_id' => $this->faker->randomElement([$active, $inactive]),
        //     'type_id' => $this->faker->randomElement([$senescyt, $setec, $external])
        // ];
    }
}
