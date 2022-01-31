<?php

namespace App\Models\Core;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Auditable as Auditing;
use Illuminate\Database\Eloquent\SoftDeletes;

class State extends Model implements Auditable
{
    use HasFactory;
    use Auditing;
    use SoftDeletes;

    const APPROVED = 'APPROVED';
    const TO_BE_APPROVED = 'TO_BE_APPROVED';
    const NOT_APPROVED = 'NOT_APPROVED';
    const CULMINATED = 'CULMINATED';
    const COMPLETED = 'COMPLETED';
    const IN_PROCESS = 'IN_PROCESS';

    protected $table = 'core.states';

    protected $fillable = ['code', 'name'];
}
