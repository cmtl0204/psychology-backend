<?php

namespace Database\Seeders;

use Database\Seeders\Cecy\AdditionalInformationsSeeder;
use Database\Seeders\Cecy\AttendancesSeeder;
use Database\Seeders\Cecy\AuthoritiesSeeder;
use Database\Seeders\Cecy\AuthorizedInstructorsSeeder;
use Database\Seeders\Cecy\CecyCatalogueSeeder;
use Database\Seeders\Cecy\CertificatesSeeder;
use Database\Seeders\Cecy\ClassroomsSeeder;
use Database\Seeders\Cecy\CoursesSeeder;
use Database\Seeders\Cecy\DetailAttendancesSeeder;
use Database\Seeders\Cecy\DetailPlanificationsInstructorSeeder;
use Database\Seeders\Cecy\DetailPlanificationsSeeder;
use Database\Seeders\Cecy\DetailSchoolPeriodsSeeder;
use Database\Seeders\Cecy\InstitutionsSeeder;
use Database\Seeders\Cecy\InstructorsSeeder;
use Database\Seeders\Cecy\NotificationsSeeder;
use Database\Seeders\Cecy\ParticipantsSeeder;
use Database\Seeders\Cecy\PhotograficRecordsSeeder;
use Database\Seeders\Cecy\PrerequisitesSeeder;
use Database\Seeders\Cecy\ProfileInstructorCoursesSeeder;
use Database\Seeders\Cecy\RegistrationRequerimentsSeeder;
use Database\Seeders\Cecy\RegistrationsSeeder;
use Database\Seeders\Cecy\RequirementesSeeder;
use Database\Seeders\Cecy\SchoolPeriodsSeeder;
use Database\Seeders\Cecy\TopicsSeeder;
use Illuminate\Database\Seeder;


class CecySeeder extends Seeder
{
    public function run()
    {
        $this->call([
            //CecyCatalogueSeeder::class,
            ClassroomsSeeder::class,
            InstructorsSeeder::class,
            CoursesSeeder::class,
            InstitutionsSeeder::class,
            //RequirementesSeeder::class,
            SchoolPeriodsSeeder::class,
            AuthoritiesSeeder::class,
            DetailSchoolPeriodsSeeder::class,
            ParticipantsSeeder::class,
            DetailPlanificationsSeeder::class,
            RegistrationsSeeder::class,
            //AdditionalInformationsSeeder::class,
            // RegistrationRequerimentsSeeder::class,
            //PrerequisitesSeeder::class,
            //ProfileInstructorCoursesSeeder::class,
            //TopicsSeeder::class,
            AttendancesSeeder::class,
            DetailPlanificationsInstructorSeeder::class,
            //CertificatesSeeder::class,
            //NotificationsSeeder::class,
            //PhotograficRecordsSeeder::class,
            //AuthorizedInstructorsSeeder::class,
            DetailAttendancesSeeder::class,
        ]);
    }
}
