<?php

namespace Database\Factories;

use App\Models\Authentication\User;
use App\Models\Cecy\Catalogue;
use Illuminate\Database\Eloquent\Factories\Factory;

class ParticipantsFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $catalogue = json_decode(file_get_contents(storage_path() . "/catalogue.json"), true);
        $users  = User::get();


        $approved =  Catalogue::where('code', $catalogue['participant_state']['approved']);
        $not_approved =  Catalogue::where('code', $catalogue['participant_state']['not_approved']);
        $to_be_approved =  Catalogue::where('code', $catalogue['participant_state']['to_be_approved']);

        $egresade = Catalogue::where('code', $catalogue['participant']['egresade']);
        $graduate = Catalogue::where('code', $catalogue['participant']['graduate']);
        $external = Catalogue::where('code', $catalogue['participant']['external']);
        $internal = Catalogue::where('code', $catalogue['participant']['internal']);

        return [
            'type_id' => $this->faker->randomElement([$egresade, $graduate, $external, $internal]),
            'user_id' => $this->faker->randomElement(2, 51),
            'state_id' => $this->faker->randomElement([$approved, $not_approved, $to_be_approved]),
        ];
    }
}
