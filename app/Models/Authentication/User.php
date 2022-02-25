<?php

namespace App\Models\Authentication;

use App\Models\Core\Catalogue;
use App\Models\Core\Email;
use App\Models\Core\File;
use App\Models\Core\Image;
use App\Models\Core\Phone;
use App\Traits\EmailTrait;
use App\Traits\FileTrait;
use App\Traits\ImageTrait;
use App\Traits\PhoneTrait;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Hash;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Auditable as Auditing;
use Spatie\Permission\Traits\HasRoles;

class User extends Authenticatable implements Auditable, MustVerifyEmail
{
    use HasFactory;
    use Auditing;
    use Notifiable;
    use HasApiTokens;
    use SoftDeletes;
    use HasRoles;
    use PhoneTrait;
    use EmailTrait;
    use FileTrait;
    use ImageTrait;

    const MAX_ATTEMPTS = 3;
    const DECAY_MINUTES_PASSWORD_FORGOT = 10;
    const DECAY_MINUTES_USER_UNLOCK = 10;
    const DECAY_MINUTES_TRANSACTIONAL_CODE = 10;
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

    protected $table = 'authentication.users';

    protected $fillable = [
        'avatar',
        'username',
        'birthdate',
        'name',
        'lastname',
        'email',
        'phone',
        'suspended',
        'email_verified_at',
        'password_changed',
        'max_attempts',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    // Relationships
    public function bloodType()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function civilStatus()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function emails()
    {
        return $this->morphMany(Email::class, 'emailable');
    }

    public function ethnicOrigin()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function files()
    {
        return $this->morphMany(File::class, 'fileable');
    }

    public function gender()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function identificationType()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function images()
    {
        return $this->morphMany(Image::class, 'imageable');
    }

    public function phones()
    {
        return $this->morphMany(Phone::class, 'phoneable');
    }

    public function sex()
    {
        return $this->belongsTo(Catalogue::class);
    }

    // Scopes
    public function scopeEmail($query, $email)
    {
        if ($email) {
            return $query->orWhere('email', 'ILIKE', "%$email%");
        }
    }

    public function scopeLastname($query, $lastname)
    {
        if ($lastname) {
            return $query->orWhere('lastname', 'ILIKE', "%$lastname%");
        }
    }

    public function scopeName($query, $name)
    {
        if ($name) {
            return $query->orWhere('name', 'ILIKE', "%$name%");
        }
    }

    public function scopeUsername($query, $username)
    {
        if ($username) {
            return $query->orWhere('username', 'ILIKE', "%$username%");
        }
    }

    public function scopeCustomOrderBy($query, $sorts)
    {
        if (!empty($sorts[0])) {
            foreach ($sorts as $sort) {
                $field = explode('-', $sort);
                if (empty($field[0]) && in_array($field[1], $this->fillable)) {
                    $query = $query->orderByDesc($field[1]);
                } else if (in_array($field[0], $this->fillable)) {
                    $query = $query->orderBy($field[0]);
                }
            }
            return $query;
        }
    }

    public function scopeCustomSelect($query, $fields)
    {
        if (!empty($fields)) {
            $fields = explode(',', $fields);
            foreach ($fields as $field) {
                $fieldExist = array_search(strtolower($field), $fields);
                if ($fieldExist == false) {
                    unset($fields[$fieldExist]);
                }
            }

            array_unshift($fields, 'id');
            return $query->select($fields);
        }
    }

    // Mutators
    public function setUsernameAttribute($value)
    {
        $this->attributes['username'] = trim($value);
    }

    public function setNameAttribute($value)
    {
        $this->attributes['name'] = trim(strtoupper($value));
    }

    public function setLastnameAttribute($value)
    {
        $this->attributes['lastname'] = trim(strtoupper($value));
    }

    public function setEmailAttribute($value)
    {
        $this->attributes['email'] = trim(strtolower($value));
    }

    public function setPhoneAttribute($value)
    {
        $this->attributes['phone'] = trim($value);
    }

    public function setPasswordAttribute($value)
    {
        $this->attributes['password'] = Hash::make(trim($value));
    }

    // Functions
    public function reducePasswordAttempts()
    {
        $this->max_attempts = $this->max_attempts - 1;
        $this->save();

        if ($this->max_attempts <= 0) {
            $this->max_attempts = 0;
            $this->save();

            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Oops! Su usuario ha sido bloqueado!',
                    'detail' => 'Demasiados intentos de inicio de sesión',
                    'code' => '429'
                ]
            ], 429);
        }

        return response()->json([
            'data' => $this->attempts,
            'msg' => [
                'summary' => 'Contrasaña incorrecta',
                'detail' => "Oops! le quedan {$this->max_attempts} intentos",
                'code' => '401',
            ]
        ], 401);
    }

    public function resetMaxAttempts()
    {
        $this->max_attempts = User::MAX_ATTEMPTS;
        $this->save();

        return response()->json([
            'data' => $this->attempts,
            'msg' => [
                'summary' => 'success',
                'detail' => '',
                'code' => '201',
            ]
        ], 201);
    }
}
