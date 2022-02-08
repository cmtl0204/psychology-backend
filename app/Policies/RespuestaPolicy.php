<?php

namespace App\Policies;

use App\Models\Authentication\User;
use App\Models\Respuesta;
use Illuminate\Auth\Access\HandlesAuthorization;

class RespuestaPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can view any models.
     *
     * @param  \App\Models\Authentication\User  $user
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function viewAny(User $user)
    {
        //
    }

    /**
     * Determine whether the user can view the model.
     *
     * @param  \App\Models\Authentication\User  $user
     * @param  \App\Models\Respuesta  $respuesta
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function view(User $user, Respuesta $respuesta)
    {
        //
    }

    /**
     * Determine whether the user can create models.
     *
     * @param  \App\Models\Authentication\User  $user
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function create(User $user)
    {
        //
    }

    /**
     * Determine whether the user can update the model.
     *
     * @param  \App\Models\Authentication\User  $user
     * @param  \App\Models\Respuesta  $respuesta
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function update(User $user, Respuesta $respuesta)
    {
        //
    }

    /**
     * Determine whether the user can delete the model.
     *
     * @param  \App\Models\Authentication\User  $user
     * @param  \App\Models\Respuesta  $respuesta
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function delete(User $user, Respuesta $respuesta)
    {
        //
    }

    /**
     * Determine whether the user can restore the model.
     *
     * @param  \App\Models\Authentication\User  $user
     * @param  \App\Models\Respuesta  $respuesta
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function restore(User $user, Respuesta $respuesta)
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the model.
     *
     * @param  \App\Models\Authentication\User  $user
     * @param  \App\Models\Respuesta  $respuesta
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function forceDelete(User $user, Respuesta $respuesta)
    {
        //
    }
}
