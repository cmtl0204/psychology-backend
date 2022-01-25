<?php

namespace Database\Seeders;

use Database\Seeders\Cecy\AdditionalInformationSeeder;
use Database\Seeders\Cecy\AuthoritiesSeeder;
use Database\Seeders\Cecy\CecyCatalogueSeeder;
use Database\Seeders\Cecy\ClassroomsSeeder;
use Database\Seeders\Cecy\CoursesSeeder;
use Database\Seeders\Cecy\InstructorsSeeder;
use Database\Seeders\Cecy\RequirementesSeeder;
use Database\Seeders\Cecy\SchoolPeriodsSeeder;
use Illuminate\Database\Seeder;


class DatabaseSeeder extends Seeder
{
    public function run()
    {
        $this->call([
            AdditionalInformationSeeder::class,
            CecyCatalogueSeeder::class,
            ClassroomsSeeder::class,
            InstructorsSeeder::class,
            CoursesSeeder::class,
            InstitutionsSeeder::class,
            RequirementesSeeder::class,
            SchoolPeriodsSeeder::class,
            AuthoritiesSeeder::class,
            DetailSchoolPeriodsSeeder::class,
            ParticipantsSeeder::class,
            DetailPlanificationsSeeder::class,
            RegistrationsSeeder::class,
            AdditionalInformationsSeeder::class,
            RegistrationRequerimentsSeeder::class,
            PrerequisitesSeeder::class,
            ProfileInstructorCoursesSeeder::class,
            TopicsSeeder::class,
            AttendancesSeeder::class,
            DetailPlanificationsInstructorSeeder::class,
            CertificatesSeeder::class,
            NotificationsSeeder::class,
            PhotograficRecordsSeeder::class,
            AuthorizedInstructorsSeeder::class,
            DetailAttendancesSeeder::class,
        ]);
    }
}
