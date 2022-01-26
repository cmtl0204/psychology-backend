<?php

namespace Database\Factories;

use App\Models\Cecy\Catalogue;
use App\Models\Cecy\Registration;
use Illuminate\Database\Eloquent\Factories\Factory;

class CertificatesFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {

        $certificable = Registration::get();
        $catalogue = json_decode(file_get_contents(storage_path() . "/catalogue.json"), true);

        $with_code = Catalogue::where('code', $catalogue['certified_state']['with_code']);
        $generated = Catalogue::where('code', $catalogue['certified_state']['generated']);
        $in_process = Catalogue::where('code', $catalogue['certified_state']['in_process']);
        $signed = Catalogue::where('code', $catalogue['certified_state']['signed']);

        return [
            'certificable_id' => $this->faker->randomElement($certificable),
            'state_id' => $this->faker->randomElement([$with_code, $generated, $in_process, $signed]),
            'code' => $this->faker->regexify('[A-Z]{5}[0-4]{1}'),
            'issued_at' => $this->faker->date(),

        ];
    }
}
