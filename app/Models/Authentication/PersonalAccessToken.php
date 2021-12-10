<?php

namespace App\Models\Authentication;

use Laravel\Sanctum\PersonalAccessToken as SanctumPersonalAccessToken;
use OwenIt\Auditing\Auditable as Auditing;
use OwenIt\Auditing\Contracts\Auditable;

class PersonalAccessToken extends SanctumPersonalAccessToken implements Auditable
{
    use Auditing;
}
