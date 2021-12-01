<?php

namespace Database\Factories\Core;

use App\Models\Core\Catalogue;
use App\Models\Core\PrimeIcons;
use Illuminate\Database\Eloquent\Factories\Factory;

class CatalogueFactory extends Factory
{

    protected $model = Catalogue::class;

    public function definition()
    {
        return [
            'code' => $this->faker->ean8(),
            'name' => $this->faker->sentence(),
            'type' => $this->faker->word(),
            'icon' => PrimeIcons::$icons[rand(0, sizeof(PrimeIcons::$icons)-1)],
            'color' => $this->faker->hexColor(),
        ];
    }
}
