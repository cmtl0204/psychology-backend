<?php

namespace Database\Seeders\Cecy;

use App\Models\Cecy\SchoolPeriod;
use Illuminate\Database\Seeder;
use Faker\Factory;
use App\Models\Cecy\DetailSchoolPeriod;

class DetailSchoolPeriodsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->createDetailSchoolPeriodsCatalogue();
        $this->createDetailSchoolPeriods();
    }

    public function createDetailSchoolPeriodsCatalogue()
    {
        //Campos que son de catalogo
    }
    public function createDetailSchoolPeriods()
    {
        $faker = Factory::create();
        $schoolPeriods = SchoolPeriod::all();
        
        foreach($schoolPeriods as $schoolPeriod){
            
                DetailSchoolPeriod::create(
                    [
                        'anulation_ended_at'=>$faker->date(),
                        'school_period_id'=>$schoolPeriod->id,
                        'anulation_started_at'=>$faker->date(),
                        'especial_ended_at'=>$faker->date(),
                        'especial_started_at'=>$faker->date(),
                        'extraordinary_ended_at'=>$faker->date(),
                        'extraordinary_started_at'=>$faker->date(),
                        'ordinary_ended_at'=>$faker->date(),
                        'ordinary_started_at'=>$faker->date(),


                    ]
                    );
             
        }



    }
}
