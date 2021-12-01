<?php

namespace Database\Factories\Authentication;

use App\Models\Core\PrimeIcons;
use App\Models\Authentication\Menu;
use Illuminate\Database\Eloquent\Factories\Factory;

class MenuFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Menu::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'label' => $this->faker->word(),
            'icon' => PrimeIcons::$icons[rand(0, sizeof(PrimeIcons::$icons)-1)],
            'router_link' => $this->faker->url(),
        ];
    }
}
