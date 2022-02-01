<?php

namespace Database\Factories\Cecy;

use App\Models\Cecy\DetailPlanification;
use App\Models\Cecy\Catalogue;
use App\Models\Cecy\Classroom;
use Illuminate\Database\Eloquent\Factories\Factory;

class ClassroomsFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Classroom::class;
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $catalogue = json_decode(file_get_contents(storage_path() . "/catalogue.json"), true);
        $detail_planification  = DetailPlanification::get();

        $office =  Catalogue::where('code', $catalogue['classroom_type']['office']);
        $classrooms_class =  Catalogue::where('code', $catalogue['classroom_type']['classrooms_class']);

        $laboratory = Catalogue::where('code', $catalogue['classroom_type']['laboratory']);

        return [
            'state_id' => $this->faker->randomElement($office, $classrooms_class, $laboratory),
            'description' => $this->faker->text(),
            'capacity' => $this->faker->randomElement(['10', '40']),
            'code' => $this->faker->string(),
            'name' => $this->faker->text()
        ];
    }
}
