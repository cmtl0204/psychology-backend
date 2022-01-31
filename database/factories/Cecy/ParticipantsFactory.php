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
        // $catalogue = json_decode(file_get_contents(storage_path() . "/catalogue.json"), true);
        // $users  = User::get();


        // $approved =  Catalogue::where('code', $catalogue['participant_state']['approved']);
        // $not_approved =  Catalogue::where('code', $catalogue['participant_state']['not_approved']);
        // $to_be_approved =  Catalogue::where('code', $catalogue['participant_state']['to_be_approved']);

        // $teacher = Catalogue::where('code', $catalogue['participant']['teacher']);
        // $public_company = Catalogue::where('code', $catalogue['participant']['public_company']);
        // $private_company = Catalogue::where('code', $catalogue['participant']['teacher']);
        // $external = Catalogue::where('code', $catalogue['participant']['external']);
        // $internal = Catalogue::where('code', $catalogue['participant']['internal']);
        // $senecyt = Catalogue::where('code', $catalogue['participant']['external']);
        // $gad = Catalogue::where('code', $catalogue['participant']['internal']);

        // return [
        //     'state_id' => $this->faker->randomElement([$approved, $not_approved, $to_be_approved]),
        //     'type_id' => $this->faker->randomElement([$teacher, $public_company, $private_company, $external, $internal, $senecyt, $gad]),
        //     'user_id' => $this->faker->randomElement(2, 51),
        // ];
    }
}
