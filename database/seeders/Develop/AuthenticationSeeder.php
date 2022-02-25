<?php

namespace Database\Seeders\Develop;

use App\Models\Authentication\System;
use App\Models\Core\Catalogue;
use App\Models\Core\Email;
use App\Models\Core\Location;
use App\Models\Authentication\Menu;
use App\Models\Core\Phone;
use App\Models\Authentication\User;
use App\Models\Core\State;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class AuthenticationSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        $this->createSystem();

        $this->createLocationCatalogues();
        $this->createIdentificationTypeCatalogues();
        $this->createSexCatalogues();
        $this->createGenderCatalogues();
        $this->createBloodTypeCatalogues();
        $this->createEthnicOriginCatalogues();
        $this->createCivilStatusCatalogues();
        $this->createSectorTypeCatalogues();
        $this->createPhoneOperatorCatalogues();
        $this->createPhoneTypeCatalogues();

        $this->createLocations();

        $this->createUsers();
        $this->createRoles();
        $this->createMenus();
        $this->createPermissions();
        $this->assignRolePermissions();
        $this->assignUserRoles();

        $this->createStates();
    }

    private function createSystem()
    {
        $catalogues = json_decode(file_get_contents(storage_path() . "/catalogues.json"), true);

        System::factory()->create([
            'code' => $catalogues['system']['code'],
            'name' => 'Esquel - ChatBot',
            'acronym' => 'Esquel',
            'version' => '2.2.3',
            'redirect' => 'http://localhost:4200/#',
            'date' => '2022-02-15',
            'state' => true
        ]);
    }

    private function createMenus()
    {
        $menus = Menu::factory(2)->sequence(
            [
                'role_id' => 1,
                'icon' => 'pi pi-users',
                'label' => 'Administración Usuarios',
                'router_link' => '/user-administration'
            ],
            [
                'role_id' => 2,
                'icon' => 'pi pi-book',
                'label' => 'Tests',
                'router_link' => '/test'
            ],
            [
                'role_id' => 3,
                'icon' => 'pi pi-book',
                'label' => 'Tests',
                'router_link' => '/test'
            ]
        )->create();
//        foreach ($menus as $menu) {
//            $menuTests = Menu::factory(5)->create(['parent_id' => $menu->id]);
//        }
    }

    private function createUsers()
    {
        $identificationTypes = Catalogue::where('type', 'IDENTIFICATION_PROFESSIONAL_TYPE')->get();
        $sexes = Catalogue::where('type', 'SEX_TYPE')->get();
        $genders = Catalogue::where('type', 'GENDER_TYPE')->get();
        $ethnicOrigin = Catalogue::where('type', 'ETHNIC_ORIGIN_TYPE')->get();
        $bloodType = Catalogue::where('type', 'BLOOD_TYPE')->get();
        $civilStatus = Catalogue::where('type', 'CIVIL_STATUS')->get();
        $operators = Catalogue::where('type', 'PHONE_OPERATOR')->get();
        $locations = Location::where('type_id', 1)->get();
        $userFactory = User::factory()->create(
            [
                'username' => '1234567890',
                'identification_type_id' => $identificationTypes[rand(0, $identificationTypes->count() - 1)],
                'sex_id' => $sexes[rand(0, $sexes->count() - 1)],
                'gender_id' => $genders[rand(0, $genders->count() - 1)],
                'ethnic_origin_id' => $ethnicOrigin[rand(0, $ethnicOrigin->count() - 1)],
                'blood_type_id' => $bloodType[rand(0, $bloodType->count() - 1)],
                'civil_status_id' => $civilStatus[rand(0, $civilStatus->count() - 1)],
            ]
        );
        Phone::factory(2)->for($userFactory, 'phoneable')
            ->create(
                [
                    'operator_id' => $operators[rand(0, $operators->count() - 1)],
                    'location_id' => $locations[rand(0, $locations->count() - 1)]
                ]
            );
        Email::factory(2)->for($userFactory, 'emailable')->create();
        for ($i = 1; $i <= 84; $i++) {
            $userFactory = User::factory()
                ->create([
                    'identification_type_id' => $identificationTypes[rand(0, $identificationTypes->count() - 1)],
                    'sex_id' => $sexes[rand(0, $sexes->count() - 1)],
                    'gender_id' => $genders[rand(0, $genders->count() - 1)],
                    'ethnic_origin_id' => $ethnicOrigin[rand(0, $ethnicOrigin->count() - 1)],
                    'blood_type_id' => $bloodType[rand(0, $bloodType->count() - 1)],
                    'civil_status_id' => $civilStatus[rand(0, $civilStatus->count() - 1)],
                ]);
            Phone::factory(2)->for($userFactory, 'phoneable')
                ->create(['operator_id' => $operators[rand(0, $operators->count() - 1)]]);
            Email::factory(2)->for($userFactory, 'emailable')->create();
        }
    }

    private function createRoles()
    {
        Role::create(['name' => 'admin']);
        Role::create(['name' => 'support']);
        Role::create(['name' => 'viewer']);
//        Role::create(['name' => 'patient']);
//        Role::create(['name' => 'guest']);
    }

    private function createPermissions()
    {
        Permission::create(['name' => 'view-users']);
        Permission::create(['name' => 'store-users']);
        Permission::create(['name' => 'update-users']);
        Permission::create(['name' => 'delete-users']);

        Permission::create(['name' => 'view-tests']);
        Permission::create(['name' => 'store-tests']);
        Permission::create(['name' => 'update-tests']);
        Permission::create(['name' => 'delete-tests']);

        Permission::create(['name' => 'store-assignments']);
        Permission::create(['name' => 'update-assignments']);
    }

    private function assignRolePermissions()
    {
        $role = Role::firstWhere('name', 'admin');
        $roleSupport = Role::firstWhere('name', 'support');
        $roleViewer = Role::firstWhere('name', 'viewer');

        $role->syncPermissions(Permission::get());

        $roleSupport->syncPermissions(Permission::where('name', 'like', '%tests%')
            ->orWhere('name', 'like', '%assignments%')->get());

        $roleViewer->syncPermissions(['view-tests']);
    }

    private function assignUserRoles()
    {
        $userAdmin = User::find(1);
        $userSupport = User::find(2);
        $userViewer = User::find(3);
        $userAdmin->assignRole('admin');
        $userSupport->assignRole('support');
        $userViewer->assignRole('viewer');
    }

    private function createLocationCatalogues()
    {
        $catalogues = json_decode(file_get_contents(storage_path() . "/catalogues.json"), true);
        Catalogue::factory(4)->sequence(
            [
                'code' => $catalogues['catalogue']['location']['country'],
                'name' => 'PAIS',
                'type' => $catalogues['catalogue']['location']['type'],
            ],
            [
                'code' => $catalogues['catalogue']['location']['province'],
                'name' => 'PROVINCIA',
                'type' => $catalogues['catalogue']['location']['type'],
            ],
            [
                'code' => $catalogues['catalogue']['location']['canton'],
                'name' => 'CANTON',
                'type' => $catalogues['catalogue']['location']['type'],
            ],
            [
                'code' => $catalogues['catalogue']['location']['parish'],
                'name' => 'PARROQUIA',
                'type' => $catalogues['catalogue']['location']['type'],
            ],
        )->create();
    }

    private function createLocations()
    {
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'1','AFGANISTÁN','AF','AFG','+93');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'2','ALBANIA','AL','ALB','+355');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'3','ALEMANIA','DE','DEU','+49');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'4','ANDORRA','AD','AND','+376');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'5','ANGOLA','AO','AGO','+244');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'6','ANGUILA','AI','AIA','+1264');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'7','ANTIGUA Y BARBUDA','AG','ATG','+1268');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'8','ARABIA SAUDITA','SA','SAU','+966');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'9','ARGELIA','DZ','DZA','+213');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'10','ARGENTINA','AR','ARG','+54');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'11','ARMENIA','AM','ARM','+374');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'12','ARUBA','AW','ABW','+297');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'13','AUSTRALIA','AU','AUS','+61');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'14','AUSTRIA','AT','AUT','+43');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'15','AZERBAIYÁN','AZ','AZE','+994');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'16','BAHAMAS','BS','BHS','+1242');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'17','BAHREIN','BH','BHR','+973');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'18','BANGLADESH','BD','BGD','+880');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'19','BARBADOS','BB','BRB','+1246');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'20','BÉLGICA','BB','BRB','+1246');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'21','BELICE','BZ','BLZ','+501');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'22','BENIN','BJ','BEN','+229');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'23','BERMUDAS','BJ','BEN','+229');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'24','BIELORRUSIA','BY','BLR','+375');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'25','BOLIVIA','BO','BOL','+591');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'26','BONAIRE, SAN EUSTAQUIO Y SABA','BO','BOL','+591');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'27','BOSNIA Y HERZEGOVINA','BA','BIH','+387');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'28','BOTSWANA','BW','BWA','+267');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'29','BRASIL','BR','BRA','+55');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'30','BRUNEI DARUSSALAM','BN','BRN','+673');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'31','BULGARIA','BG','BGR','+359');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'32','BURKINA FASO','BF','BFA','+226');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'33','BURUNDI','BI','BDI','+257');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'34','BUTÁN','BI','BDI','+257');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'35','CABO VERDE','CV','CPV','+238');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'36','CAMBOYA','KH','KHM','+855');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'37','CAMERÚN','CM','CMR','+237');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'38','CANADA','CA','CAN','+1');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'39','CHAD','TD','TCD','+235');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'40','CHILE','CL','CHL','+56');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'41','CHINA','CN','CHN','+86');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'42','CHIPRE','CY','CYP','+357');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'43','COLOMBIA','CO','COL','+57');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'44','COMORAS','KM','COM','+269');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'45','CONGO','KM','COM','+269');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'46','COREA DEL NORTE','KP','PRK','+850');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'47','COREA DEL SUR','KR','KOR','+82');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'48','COSTA DE MARﬁL','CI','CIV','+225');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'49','COSTA RICA','CR','CRI','+506');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'50','CROACIA','HR','HRV','+385');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'51','CUBA','CU','CUB','+53');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'52','CURAÇAO','CU','CUB','+53');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'53','DINAMARCA','DK','DNK','+45');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'54','DJIBOUTI','DK','DNK','+45');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'55','DOMINICA','DM','DMA','+1767');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'56','ECUADOR','EC','ECU','+593');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'57','EGIPTO','EG','EGY','+20');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'58','EL SALVADOR','SV','SLV','+503');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'59','EL VATICANO','SV','SLV','+503');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'60','EMIRATOS ÁRABES UNIDOS','AE','ARE','+971');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'61','ERITREA','ER','ERI','+291');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'62','ESLOVAQUIA','SK','SVK','+421');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'63','ESLOVENIA','SI','SVN','+386');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'64','ESPAÑA','ES','ESP','+34');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'65','ESTADO DE PALESTINA','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'66','ESTADOS UNIDOS DE AMÉRICA','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'67','ESTONIA','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'68','ETIOPÍA','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'69','FIYI','FJ','FJI','+679');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'70','FILIPINAS','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'71','FINLANDIA','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'72','FRANCIA','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'73','GABÓN','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'74','GAMBIA','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'75','GEORGIA','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'76','GHANA','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'77','GIBRALTAR','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'78','GRANADA','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'79','GRECIA','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'80','GROENLANDIA','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'81','GUADALUPE','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'82','GUAM','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'83','GUATEMALA','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'84','GUAYANA FRANCESA','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'85','GUERNSEY','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'86','GUINEA','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'87','GUINEA ECUATORIAL','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'88','GUINEA-BISSAU','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'89','GUYANA','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'90','HAITÍ','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'91','HONDURAS','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'92','HONG KONG','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'93','HUNGRÍA','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'94','INDIA','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'95','INDONESIA','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'96','IRAK','IQ','IRQ','+964');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'97','IRÁN','IM','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'98','IRLANDA','NF','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'99','ISLA DE MAN','IS','IMN','+44');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'100' ||
                                                                                            '','ISLA NORFOLK','IS','NFK','+672');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'101','ISLANDIA','KY','ISL','+354');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'102','ISLAS ÅLAND','CK','ISL','+354');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'103','ISLAS CAIMÁN','FO','CYM','+1345');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'104','ISLAS COOK','FK','COK','+682');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'105','ISLAS FEROE','MP','FRO','+298');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'106','ISLAS MALVINAS (FALKLAND)','MH','FLK','+500');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'107','ISLAS MARIANAS DEL NORTE','SB','MNP','+1670');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'108','ISLAS MARSHALL','TC','MHL','+692');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'109','ISLAS SALOMÓN','UM','SLB','+677');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'110','ISLAS TURCAS Y CAICOS','VG','TCA','+1649');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'111','ISLAS VÍRGENES AMERICANAS','VI','UMI','+246');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'112','ISLAS VÍRGENES BRITÁNICAS','PS','VGB','+1284');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'113','ISLAS WALLIS Y FUTUNA','IT','VIR','+1340');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'114','ISRAEL','JM','PSE','+970');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'115','ITALIA','JP','ITA','+39');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'116','JAMAICA','JE','JAM','+1876');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'117','JAPÓN','JO','JPN','+81');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'118','JERSEY','KZ','JEY','+44');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'119','JORDANIA','KE','JOR','+962');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'120','KAZAJSTÁN','KG','KAZ','+7');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'121','KENYA','KI','KEN','+254');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'122','KIRGUISTÁN','KW','KGZ','+996');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'123','KIRIBATI','KW','KIR','+686');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'124','KUWAIT','KW','KWT','+965');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'125','LA EX REPÚBLICA YUGOSLAVA DE MACEDONIA','LV','KWT','+965');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'126','LESOTO','LV','KWT','+965');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'127','LETONIA','LR','LVA','+371');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'128','LÍBANO','LY','LVA','+371');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'129','LIBERIA','LI','LBR','+231');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'130','LIBIA','LT','LBY','+218');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'131','LIECHTENSTEIN','LU','LIE','+423');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'132','LITUANIA','LU','LTU','+370');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'133','LUXEMBURGO','LU','LUX','+352');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'134','MACAO','LU','LUX','+352');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'135','MADAGASCAR','MY','LUX','+352');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'136','MALASIA','MW','LUX','+352');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'137','MALAUI','ML','MYS','+60');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'138','MALDIVAS','MT','MWI','+265');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'139','MALÍ','MA','MLI','+223');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'140','MALTA','MQ','MLT','+356');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'141','MARRUECOS','MU','MAR','+212');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'142','MARTINICA','MR','MTQ','+596');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'143','MAURICIO','PS','MUS','+230');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'144','MAURITANIA','YT','MRT','+222');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'145','MAYOTTE','FM','PSE','+970');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'146','MÉXICO','MD','MYT','+262');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'147','MICRONESIA','MN','FSM','+691');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'148','MÓNACO','ME','MDA','+373');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'149','MONGOLIA','MS','MNG','+976');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'150','MONTENEGRO','MZ','MNE','+382');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'151','MONTSERRAT','MZ','MSR','+1664');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'152','MOZAMBIQUE','NA','MOZ','+258');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'153','MYANMAR','NR','MOZ','+258');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'154','NAMIBIA','NP','NAM','+264');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'155','NAURU','NI','NRU','+674');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'156','NEPAL','NE','NPL','+977');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'157','NICARAGUA','NG','NIC','+505');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'158','NÍGER','NU','NER','+227');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'159','NIGERIA','PS','NGA','+234');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'160','NIUE','NC','NIU','+683');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'161','NORUEGA','NZ','PSE','+970');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'162','NUEVA CALEDONIA','OM','NCL','+687');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'163','NUEVA ZELANDA','PS','NZL','+64');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'164','OMÁN','PK','OMN','+968');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'165','PAÍSES BAJOS','PS','PSE','+970');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'166','PAKISTÁN','PA','PAK','+92');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'167','PALAU','PG','PSE','+970');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'168','PANAMÁ','PY','PAN','+507');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'169','PAPÚA NUEVA GUINEA','PE','PNG','+675');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'170','PARAGUAY','PE','PRY','+595');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'171','PERÚ','PE','PER','+51');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'172','PITCAIRN','PL','PER','+51');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'173','POLINESIA FRANCÉS','PT','PER','+51');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'174','POLONIA','PR','POL','+48');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'175','PORTUGAL','QA','PRT','+351');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'176','PUERTO RICO','GB','PRI','+1');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'177','QATAR','GB','QAT','+974');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'178','REINO UNIDO DE GRAN BRETAÑA E IRLANDA DEL NORTE','CF','GBR','+44');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'179','REPÚBLICA ÁRABE SIRIA','CZ','GBR','+44');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'180','REPÚBLICA CENTROAFRICANA','CZ','CAF','+236');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'181','REPÚBLICA CHECA','SS','CZE','+420');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'182','REPÚBLICA DE MOLDAVIA','CZ','CZE','+420');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'183','REPÚBLICA DEMOCRÁTICA DEL CONGO','SS','SSD','+211');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'184','REPÚBLICA DEMOCRÁTICA POPULAR LAO','SS','CZE','+420');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'185','REPÚBLICA DOMINICANA','RE','SSD','+211');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'186','REPÚBLICA UNIDA DE TANZANIA','RO','SSD','+211');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'187','RÉUNION','RU','REU','+262');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'188','RUMANIA','RU','ROU','+40');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'189','RUSIA','EH','RUS','+7');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'190','RWANDA','EH','RUS','+7');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'191','SÁHARA OCCIDENTAL','EH','ESH','+212');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'192','SAINT-BARTHÉLEMY','WS','ESH','+212');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'193','SAINT-MARTIN','AS','ESH','+212');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'194','SAMOA','KN','WSM','+685');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'195','SAMOA AMERICANA','SM','ASM','+1684');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'196','SAN CRISTÓBAL Y NIEVES','PM','KNA','+1869');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'197','SAN MARINO','VC','SMR','+378');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'198','SAN PEDRO Y MIQUELÓN','SH','SPM','+508');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'199','SAN VICENTE Y LAS GRANADINAS','LC','VCT','+1784');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'200','SANTA ELENA','ST','SHN','+290');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'201','SANTA LUCÍA','SN','LCA','+1758');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'202','SANTO TOMÉ Y PRÍNCIPE','RS','STP','+239');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'203','SENEGAL','SC','SEN','+221');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'204','SERBIA','SL','SRB','+381');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'205','SEYCHELLES','SG','SYC','+248');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'206','SIERRA LEONA','SX','SLE','+232');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'207','SINGAPUR','SO','SGP','+65');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'208','SINT MAARTEN','LK','SMX','+1721');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'209','SOMALIA','ZA','SOM','+252');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'210','SRI LANKA','SD','LKA','+94');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'211','SUDÁFRICA','SD','ZAF','+27');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'212','SUDÁN','SE','SDN','+249');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'213','SUDÁN DEL SUR','CH','SDN','+249');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'214','SUECIA','SR','SWE','+46');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'215','SUIZA','SJ','CHE','+41');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'216','SURINAME','SZ','SUR','+597');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'217','SVALBARD Y JAN MAYEN','TH','SJM','+47');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'218','SWAZILANDIA','TJ','SWZ','+268');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'219','TAILANDIA','TL','THA','+66');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'220','TAYIKISTÁN','TG','TJK','+992');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'221','TIMOR-LESTE','TK','TLS','+670');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'222','TOGO','TO','TGO','+228');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'223','TOKELAU','TT','TKL','+690');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'224','TONGA','TN','TON','+676');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'225','TRINIDAD Y TOBAGO','TM','TTO','+1868');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'226','TÚNEZ','TR','TUN','+216');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'227','TURKMENISTÁN','TV','TKM','+993');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'228','TURQUÍA','UA','TUR','+90');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'229','TUVALU','UG','TUV','+688');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'230','UCRANIA','UY','UKR','+380');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'231','UGANDA','UZ','UGA','+256');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'232','URUGUAY','VU','URY','+598');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'233','UZBEKISTÁN','VE','UZB','+998');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'234','VANUATU','VE','VUT','+678');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'235','VENEZUELA','YE','VEN','+58');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'236','VIET NAM','ZM','VEN','+58');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'237','YEMEN','ZW','YEM','+967');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'238','ZAMBIA','ZM','ZMB','+260');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'239','ZIMBABWE','ZW','ZWE','+263');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'240','ANTÁRTIDA','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'241','ISLA BOUVET','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'242','TERRITORIO BRITÁNICO DE LA OCÉANO ÍNDICO','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'243','TAIWÁN','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'244','ISLA DE NAVIDAD','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'245','ISLAS COCOS','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'246','GEORGIA DEL SUR Y LAS ISLAS SANDWICH DEL SUR','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'247','TERRITORIOS AUSTRALES FRANCESES','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,code,name,alpha2_code,alpha3_code,calling_code) values(1,'999','NO REGISTRA','SN','SN','SN');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(2,56,'01','AZUAY');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(2,56,'02','BOLIVAR');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(2,56,'03','CAÑAR');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(2,56,'04','CARCHI');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(2,56,'05','COTOPAXI');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(2,56,'06','CHIMBORAZO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(2,56,'07','EL ORO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(2,56,'08','ESMERALDAS');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(2,56,'09','GUAYAS');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(2,56,'10','IMBABURA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(2,56,'11','LOJA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(2,56,'12','LOS RIOS');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(2,56,'13','MANABI');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(2,56,'14','MORONA SANTIAGO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(2,56,'15','NAPO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(2,56,'16','PASTAZA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(2,56,'17','PICHINCHA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(2,56,'18','TUNGURAHUA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(2,56,'19','ZAMORA CHINCHIPE');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(2,56,'20','GALAPAGOS');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(2,56,'21','SUCUMBIOS');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(2,56,'22','ORELLANA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(2,56,'23','SANTO DOMINGO DE LOS TSACHILAS');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(2,56,'24','SANTA ELENA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(2,56,'90','ZONAS NO DELIMITADAS');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,249,'0101','CUENCA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,249,'0102','GIRÓN');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,249,'0103','GUALACEO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,249,'0104','NABÓN');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,249,'0105','PAUTE');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,249,'0106','PUCARA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,249,'0107','SAN FERNANDO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,249,'0108','SANTA ISABEL');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,249,'0109','SIGSIG');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,249,'0110','OÑA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,249,'0111','CHORDELEG');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,249,'0112','EL PAN');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,249,'0113','SEVILLA DE ORO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,249,'0114','GUACHAPALA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,249,'0115','CAMILO PONCE ENRÍQUEZ');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,250,'0201','GUARANDA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,250,'0202','CHILLANES');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,250,'0203','CHIMBO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,250,'0204','ECHEANDÍA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,250,'0205','SAN MIGUEL');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,250,'0206','CALUMA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,250,'0207','LAS NAVES');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,251,'0301','AZOGUES');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,251,'0302','BIBLIÁN');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,251,'0303','CAÑAR');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,251,'0304','LA TRONCAL');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,251,'0305','EL TAMBO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,251,'0306','DÉLEG');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,251,'0307','SUSCAL');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,252,'0401','TULCÁN');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,252,'0402','BOLÍVAR');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,252,'0403','ESPEJO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,252,'0404','MIRA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,252,'0405','MONTÚFAR');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,252,'0406','SAN PEDRO DE HUACA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,253,'0501','LATACUNGA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,253,'0502','LA MANÁ');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,253,'0503','PANGUA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,253,'0504','PUJILI');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,253,'0505','SALCEDO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,253,'0506','SAQUISILÍ');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,253,'0507','SIGCHOS');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,254,'0601','RIOBAMBA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,254,'0602','ALAUSI');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,254,'0603','COLTA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,254,'0604','CHAMBO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,254,'0605','CHUNCHI');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,254,'0606','GUAMOTE');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,254,'0607','GUANO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,254,'0608','PALLATANGA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,254,'0609','PENIPE');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,254,'0610','CUMANDÁ');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,255,'0701','MACHALA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,255,'0702','ARENILLAS');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,255,'0703','ATAHUALPA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,255,'0704','BALSAS');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,255,'0705','CHILLA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,255,'0706','EL GUABO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,255,'0707','HUAQUILLAS');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,255,'0708','MARCABELÍ');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,255,'0709','PASAJE');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,255,'0710','PIÑAS');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,255,'0711','PORTOVELO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,255,'0712','SANTA ROSA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,255,'0713','ZARUMA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,255,'0714','LAS LAJAS');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,256,'0801','ESMERALDAS');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,256,'0802','ELOY ALFARO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,256,'0803','MUISNE');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,256,'0804','QUININDÉ');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,256,'0805','SAN LORENZO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,256,'0806','ATACAMES');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,256,'0807','RIOVERDE');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,256,'0808','LA CONCORDIA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,257,'0901','GUAYAQUIL');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,257,'0902','EDO BAQUERIZO MORENO (JU');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,257,'0903','BALAO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,257,'0904','BALZAR');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,257,'0905','COLIMES');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,257,'0906','DAULE');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,257,'0907','DURÁN');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,257,'0908','EL EMPALME');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,257,'0909','EL TRIUNFO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,257,'0910','MILAGRO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,257,'0911','NARANJAL');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,257,'0912','NARANJITO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,257,'0913','PALESTINA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,257,'0914','PEDRO CARBO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,257,'0915','SAMBORONDÓN');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,257,'0916','SANTA LUCÍA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,257,'0917','SALITRE (URBINA JADO)');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,257,'0918','SAN JACINTO DE YAGUACHI');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,257,'0919','PLAYAS');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,257,'0920','SIMÓN BOLÍVAR');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,257,'0921','RONEL MARCELINO MARIDUE');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,257,'0922','LOMAS DE SARGENTILLO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,257,'0923','NOBOL');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,257,'0924','GENERAL ANTONIO ELIZALDE');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,257,'0925','ISIDRO AYORA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,258,'1001','IBARRA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,258,'1002','ANTONIO ANTE');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,258,'1003','COTACACHI');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,258,'1004','OTAVALO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,258,'1005','PIMAMPIRO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,258,'1006','SAN MIGUEL DE URCUQUÍ');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,259,'1107','LOJA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,259,'1108','CALVAS');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,259,'1109','CATAMAYO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,259,'1110','CELICA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,259,'1111','CHAGUARPAMBA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,259,'1112','ESPÍNDOLA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,259,'1113','GONZANAMÁ');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,259,'1114','MACARÁ');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,259,'1115','PALTAS');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,259,'1116','PUYANGO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,259,'1117','SARAGURO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,259,'1118','SOZORANGA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,259,'1119','ZAPOTILLO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,259,'1120','PINDAL');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,259,'1121','QUILANGA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,259,'1122','OLMEDO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,260,'1201','BABAHOYO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,260,'1202','BABA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,260,'1203','MONTALVO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,260,'1204','PUEBLOVIEJO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,260,'1205','QUEVEDO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,260,'1206','URDANETA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,260,'1207','VENTANAS');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,260,'1208','VÍNCES');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,260,'1209','PALENQUE');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,260,'1210','BUENA FÉ');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,260,'1211','VALENCIA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,260,'1212','MOCACHE');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,260,'1213','QUINSALOMA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,261,'1301','PORTOVIEJO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,261,'1302','BOLÍVAR');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,261,'1303','CHONE');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,261,'1304','EL CARMEN');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,261,'1305','FLAVIO ALFARO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,261,'1306','JIPIJAPA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,261,'1307','JUNÍN');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,261,'1308','MANTA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,261,'1309','MONTECRISTI');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,261,'1310','PAJÁN');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,261,'1311','PICHINCHA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,261,'1312','ROCAFUERTE');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,261,'1313','SANTA ANA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,261,'1314','SUCRE');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,261,'1315','TOSAGUA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,261,'1316','24 DE MAYO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,261,'1317','PEDERNALES');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,261,'1318','OLMEDO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,261,'1319','PUERTO LÓPEZ');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,261,'1320','JAMA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,261,'1321','JARAMIJÓ');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,261,'1322','SAN VICENTE');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,262,'1401','MORONA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,262,'1402','GUALAQUIZA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,262,'1403','LIMÓN INDANZA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,262,'1404','PALORA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,262,'1405','SANTIAGO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,262,'1406','SUCÚA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,262,'1407','HUAMBOYA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,262,'1408','SAN JUAN BOSCO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,262,'1409','TAISHA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,262,'1410','LOGROÑO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,262,'1411','PABLO SEXTO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,262,'1412','TIWINTZA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,263,'1501','TENA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,263,'1502','ARCHIDONA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,263,'1503','EL CHACO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,263,'1504','QUIJOS');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,263,'1505','ARLOS JULIO AROSEMENA TOL');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,264,'1601','PASTAZA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,264,'1602','MERA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,264,'1603','SANTA CLARA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,264,'1604','ARAJUNO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,265,'1701','QUITO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,265,'1702','CAYAMBE');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,265,'1703','MEJIA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,265,'1704','PEDRO MONCAYO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,265,'1705','RUMIÑAHUI');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,265,'1706','SAN MIGUEL DE LOS BANCOS');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,265,'1707','PEDRO VICENTE MALDONADO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,265,'1708','PUERTO QUITO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,266,'1801','AMBATO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,266,'1802','BAÑOS DE AGUA SANTA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,266,'1803','CEVALLOS');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,266,'1804','MOCHA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,266,'1805','PATATE');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,266,'1806','QUERO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,266,'1807','SAN PEDRO DE PELILEO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,266,'1808','SANTIAGO DE PÍLLARO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,266,'1809','TISALEO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,267,'1901','ZAMORA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,267,'1902','CHINCHIPE');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,267,'1903','NANGARITZA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,267,'1904','YACUAMBI');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,267,'1905','YANTZAZA (YANZATZA)');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,267,'1906','EL PANGUI');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,267,'1907','CENTINELA DEL CÓNDOR');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,267,'1908','PALANDA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,267,'1909','PAQUISHA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,268,'2001','SAN CRISTÓBAL');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,268,'2002','ISABELA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,268,'2003','SANTA CRUZ');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,269,'2101','LAGO AGRIO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,269,'2102','GONZALO PIZARRO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,269,'2103','PUTUMAYO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,269,'2104','SHUSHUFINDI');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,269,'2105','SUCUMBÍOS');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,269,'2106','CASCALES');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,269,'2107','CUYABENO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,270,'2201','ORELLANA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,270,'2202','AGUARICO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,270,'2203','LA JOYA DE LOS SACHAS');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,270,'2204','LORETO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,271,'2301','SANTO DOMINGO');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,272,'2401','SANTA ELENA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,272,'2402','LA LIBERTAD');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,272,'2403','SALINAS');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,273,'9001','LAS GOLONDRINAS');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,273,'9002','MANGA DEL CURA');");
        DB::select("insert into core.locations(type_id,parent_id,code,name) values(3,273,'9003','EL PIEDRERO');");
    }

    private function createIdentificationTypeCatalogues()
    {
        $catalogues = json_decode(file_get_contents(storage_path() . "/catalogues.json"), true);
        Catalogue::factory(2)->sequence(
            [
                'code' => $catalogues['catalogue']['identification_professional_type']['cc'],
                'name' => 'CEDULA',
                'type' => $catalogues['catalogue']['identification_professional_type']['type'],
            ],
            [
                'code' => $catalogues['catalogue']['identification_professional_type']['passport'],
                'name' => 'PASAPORTE', 'type' => $catalogues['catalogue']['identification_professional_type']['type']
            ],
        )->create();
    }

    private function createSexCatalogues()
    {
        $catalogues = json_decode(file_get_contents(storage_path() . "/catalogues.json"), true);
        Catalogue::factory(2)->sequence(
            [
                'code' => $catalogues['catalogue']['sex']['male'],
                'name' => 'HOMBRE',
                'type' => $catalogues['catalogue']['sex']['type']
            ],
            [
                'code' => $catalogues['catalogue']['sex']['female'],
                'name' => 'MUJER',
                'type' => $catalogues['catalogue']['sex']['type'],
            ]
        )->create();
    }

    private function createGenderCatalogues()
    {
        $catalogues = json_decode(file_get_contents(storage_path() . "/catalogues.json"), true);
        Catalogue::factory(4)->sequence(
            [
                'code' => $catalogues['catalogue']['gender']['male'],
                'name' => 'MASCULINO',
                'type' => $catalogues['catalogue']['gender']['type']
            ],
            [
                'code' => $catalogues['catalogue']['gender']['female'],
                'name' => 'FEMENINO',
                'type' => $catalogues['catalogue']['gender']['type'],
            ],
            [
                'code' => $catalogues['catalogue']['gender']['other'],
                'name' => 'OTRO',
                'type' => $catalogues['catalogue']['gender']['type'],
            ],
            [
                'code' => $catalogues['catalogue']['gender']['not_say'],
                'name' => 'PREFIERO NO DECIRLO',
                'type' => $catalogues['catalogue']['gender']['type'],
            ],
        )->create();
    }

    private function createSectorTypeCatalogues()
    {
        $catalogues = json_decode(file_get_contents(storage_path() . "/catalogues.json"), true);
        Catalogue::factory(3)->sequence(
            [
                'name' => 'NORTE',
                'type' => $catalogues['catalogue']['sector']['type'],
            ],
            [
                'name' => 'CENTRO',
                'type' => $catalogues['catalogue']['sector']['type'],
            ],
            [
                'name' => 'SUR',
                'type' => $catalogues['catalogue']['sector']['type'],
            ],
        )->create();
    }

    private function createEthnicOriginCatalogues()
    {
        $catalogues = json_decode(file_get_contents(storage_path() . "/catalogues.json"), true);
        Catalogue::factory(9)->sequence(
            [
                'code' => $catalogues['catalogue']['ethnic_origin']['indigena'],
                'name' => 'INDIGENA',
                'type' => $catalogues['catalogue']['ethnic_origin']['type'],
            ],
            [
                'code' => $catalogues['catalogue']['ethnic_origin']['afroecuatoriano'],
                'name' => 'AFROECUATORIANO',
                'type' => $catalogues['catalogue']['ethnic_origin']['type'],
            ],
            [
                'code' => $catalogues['catalogue']['ethnic_origin']['negro'],
                'name' => 'NEGRO',
                'type' => $catalogues['catalogue']['ethnic_origin']['type'],
            ],
            [
                'code' => $catalogues['catalogue']['ethnic_origin']['mulato'],
                'name' => 'MULATO',
                'type' => $catalogues['catalogue']['ethnic_origin']['type'],
            ],
            [
                'code' => $catalogues['catalogue']['ethnic_origin']['montuvio'],
                'name' => 'MONTUVIO',
                'type' => $catalogues['catalogue']['ethnic_origin']['type'],
            ],
            [
                'code' => $catalogues['catalogue']['ethnic_origin']['mestizo'],
                'name' => 'MESTIZO',
                'type' => $catalogues['catalogue']['ethnic_origin']['type'],
            ],
            [
                'code' => $catalogues['catalogue']['ethnic_origin']['blanco'],
                'name' => 'BLANCO',
                'type' => $catalogues['catalogue']['ethnic_origin']['type'],
            ],
            [
                'code' => $catalogues['catalogue']['ethnic_origin']['other'],
                'name' => 'OTRO',
                'type' => $catalogues['catalogue']['ethnic_origin']['type'],
            ],
            [
                'code' => $catalogues['catalogue']['ethnic_origin']['unregistered'],
                'name' => 'NO REGISTRA',
                'type' => $catalogues['catalogue']['ethnic_origin']['type'],
            ]
        )->create();
    }

    private function createBloodTypeCatalogues()
    {
        $catalogues = json_decode(file_get_contents(storage_path() . "/catalogues.json"), true);
        Catalogue::factory(8)->sequence(
            [
                'code' => $catalogues['catalogue']['blood_type']['a-'],
                'name' => 'A-',
                'type' => $catalogues['catalogue']['blood_type']['type'],
            ],
            [
                'code' => $catalogues['catalogue']['blood_type']['a+'],
                'name' => 'A+',
                'type' => $catalogues['catalogue']['blood_type']['type'],
            ],
            [
                'code' => $catalogues['catalogue']['blood_type']['b-'],
                'name' => 'B-',
                'type' => $catalogues['catalogue']['blood_type']['type'],
            ],
            [
                'code' => $catalogues['catalogue']['blood_type']['b+'],
                'name' => 'B+',
                'type' => $catalogues['catalogue']['blood_type']['type'],
            ],
            [
                'code' => $catalogues['catalogue']['blood_type']['ab-'],
                'name' => 'AB-',
                'type' => $catalogues['catalogue']['blood_type']['type'],
            ],
            [
                'code' => $catalogues['catalogue']['blood_type']['ab+'],
                'name' => 'AB+',
                'type' => $catalogues['catalogue']['blood_type']['type'],
            ],
            [
                'code' => $catalogues['catalogue']['blood_type']['o-'],
                'name' => 'O-',
                'type' => $catalogues['catalogue']['blood_type']['type'],
            ],
            [
                'code' => $catalogues['catalogue']['blood_type']['o+'],
                'name' => 'O+',
                'type' => $catalogues['catalogue']['blood_type']['type'],
            ],
        )->create();
    }

    private function createCivilStatusCatalogues()
    {
        $catalogues = json_decode(file_get_contents(storage_path() . "/catalogues.json"), true);
        Catalogue::factory(5)->sequence(
            [
                'code' => $catalogues['catalogue']['civil_status']['married'],
                'name' => 'CASADO/A',
                'type' => $catalogues['catalogue']['civil_status']['type'],
            ],
            [
                'code' => $catalogues['catalogue']['civil_status']['single'],
                'name' => 'SOLTERO/A',
                'type' => $catalogues['catalogue']['civil_status']['type'],
            ],
            [
                'code' => $catalogues['catalogue']['civil_status']['divorced'],
                'name' => 'DIVORCIADO/A',
                'type' => $catalogues['catalogue']['civil_status']['type'],
            ],
            [
                'code' => $catalogues['catalogue']['civil_status']['widower'],
                'name' => 'VIUDO/A',
                'type' => $catalogues['catalogue']['civil_status']['type'],
            ],
            [
                'code' => $catalogues['catalogue']['civil_status']['union'],
                'name' => 'UNION DE HECHO',
                'type' => $catalogues['catalogue']['civil_status']['type'],
            ],
        )->create();
    }

    private function createPhoneOperatorCatalogues()
    {
        $catalogues = json_decode(file_get_contents(storage_path() . "/catalogues.json"), true);
        Catalogue::factory(3)->sequence(
            [
                'name' => 'CLARO',
                'type' => $catalogues['catalogue']['phone_operator']['type'],
            ],
            [
                'name' => 'CNT',
                'type' => $catalogues['catalogue']['phone_operator']['type'],
            ],
            [
                'name' => 'MOVISTAR',
                'type' => $catalogues['catalogue']['phone_operator']['type'],
            ],
        )->create();
    }

    private function createPhoneTypeCatalogues()
    {
        $catalogues = json_decode(file_get_contents(storage_path() . "/catalogues.json"), true);
        Catalogue::factory(3)->sequence(
            [
                'name' => 'CELULAR',
                'type' => $catalogues['catalogue']['phone_type']['type'],
            ],
            [
                'name' => 'CONVENCIONAL',
                'type' => $catalogues['catalogue']['phone_type']['type'],
            ],
            [
                'name' => 'FAX',
                'type' => $catalogues['catalogue']['phone_type']['type'],
            ],
        )->create();
    }

    private function createStates()
    {
        $catalogues = json_decode(file_get_contents(storage_path() . "/catalogues.json"), true);
        State::factory()->count(7)->create();
    }
}
