<?php

namespace Database\Factories\Cecy;

use App\Models\Cecy\Catalogue;
use App\Models\Core\Career;
use App\Models\Core\Instructor;

use Illuminate\Database\Eloquent\Factories\Factory;

class CoursesFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Course::class;
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    { 
        $catalogue = json_decode(file_get_contents(storage_path() . "/catalogue.json"), true);
        $academic_period = Catalogue::where('code', $catalogue['academic_period']['first']);
        $academic_period2 = Catalogue::where('code', $catalogue['academic_period']['second']);
        $area = Catalogue::where('code', $catalogue['area']['A']);
        // $area2 = Catalogue::where('code', $catalogue['area']['B']);
        $senecyt = Catalogue::where('code', $catalogue['entity_certification']['senecyt']);
        $setec = Catalogue::where('code', $catalogue['entity_certification']['setec']);
        $cecy = Catalogue::where('code', $catalogue['entity_certification']['cecy']);
        $career = Career::get();
        $responsible = Instructor::get();
        $technical = Catalogue::where('code', $catalogue['category']['technical']);
        $administrative = Catalogue::where('code', $catalogue['category']['administrative']);
        $taller = Catalogue::where('code', $catalogue['formation']['workshop']);
        $curso = Catalogue::where('code', $catalogue['formation']['course']);
        $assistance = Catalogue::where('code', $catalogue['certificate_type']['assistance']);
        $approval = Catalogue::where('code', $catalogue['certificate_type']['approval']);
        $compliance= Catalogue::where('code', $catalogue['compliance']['type']);
        $control= Catalogue::where('code', $catalogue['control']['type']);
        $courseType = Catalogue::where('code', $catalogue['course']['technical']);
        $courseType2 = Catalogue::where('code', $catalogue['course']['administrative']);
        $frencuency= Catalogue::where('code', $catalogue['frecuency']['type']);
        $presencial = Catalogue::where('code', $catalogue['modality']['presencial']);
        $virtual = Catalogue::where('code', $catalogue['modality']['virtual']); 
        $means= Catalogue::where('code', $catalogue['means_verification']['type']);
        $speciality= Catalogue::where('code', $catalogue['speciality_area']['a.1']);
        $speciality2= Catalogue::where('code', $catalogue['speciality_area']['a.2']);
        $state= Catalogue::where('code', $catalogue['course_state']['approved']);
        $state2= Catalogue::where('code', $catalogue['course_state']['not_approved']);

        return [
            'academic_period_id' => $this->faker->randomElement([$academic_period, $academic_period2]),
            'area_id' => $this->faker->randomElement($area),
            'entity_certification_id' => $this->faker->randomElement([$senecyt, $setec, $cecy]),
            'career_id' => $this->faker->randomElement($career),
            'category_id' => $this->faker->randomElement([$technical, $administrative]),
            'formation_type' => $this->faker->randomElement([$taller, $curso]),
            'certified_type_id' => $this->faker->randomElement([$assistance, $approval]),
            'compliance_indicators_id' => $this->faker->randomElement($compliance),
            'control_id' => $this->faker->randomElement($control),
            'course_type_id' => $this->faker->randomElement([$courseType, $courseType2]),
            'frecuency_id' => $this->faker->randomElement($frencuency),
            'modality_id' => $this->faker->randomElement([$presencial, $virtual]),
            'means_verification_id' => $this->faker->randomElement($means),
            'speciality_id' => $this->faker->randomElement([$speciality, $speciality2]),
            'responsible_id' => $this->faker->randomElement($responsible),
            'state_id' => $this->faker->randomElement($state, $state2),
            'abbreviation' => $this->faker->word(),
            'alignment' => $this->faker->words(3),
            'approved_at' => $this->faker->date('Y_m_d'),
            'bibliographies' => [
                'bibliographies' => $this->faker->uuid()
            ],
            'code' => $this->faker->numerify('COD-####'),
            'cost' => $this->faker->numberBetween(0, 100),
            'duration' => $this->faker->numberBetween(40, 200),
            'evaluation_mechanisms' => [
                'mechanisms' => [
                    'diagnostica' =>  $this->faker->words(2),
                    'formativa' => $this->faker->words(2)
                ]
            ],
            'expired_at' => $this->faker->date('Y_m_d'),
            'free' => $this->faker->randomElement(true, false),
            'name' => $this->faker->words(3),
            'needs' => [
                'necesidades' => $this->faker->words(6)
            ],
            'needed_at' => $this->faker->date('Y_m_d'),
            'record_number' => $this->$faker->regexify('[A-Z]{5}[0-4]{3}'),
            'learning_environments' => [
                'enviroments' => $this->faker->words(3)
            ],
            'local_proposal' => $this->faker->sentence(8),
            'objective' => $this->faker->sentence(10),
            'observation' => $this->faker->sentence(8),
            'practice_hours' => $this->faker->numberBetween(40, 200),
            'proposed_at' => $this->faker->date('Y_m_d'),
            'project' => $this->faker->sentence(8),
            'public' => $this->faker->randomElement(true, false),
            // 'required_installing_sources' => 'contenido',
            'setec_name' => $this->faker->words(3),
            'summary' => $this->faker->sentence(10),
            'target_groups' => [
                'target' => $this->faker->words(3)
            ],
            'teaching_strategies' => [
                'strategies' => $this->faker->words(3)
            ],
            'techniques_requisites' => [
                'requisites' => $this->faker->words(3)
            ],
            'theory_hours' => $this->faker->numberBetween(40, 200),
        ];
    }
}
