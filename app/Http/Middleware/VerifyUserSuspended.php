<?php

namespace App\Http\Middleware;

use App\Models\Authentication\User;
use Closure;
use Illuminate\Http\Request;

class VerifyUserSuspended
{
    /**
     * Handle an incoming request.
     *
     * @param \Illuminate\Http\Request $request
     * @param \Closure $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        $user = User::firstWhere('username', $request->username);
        if (($request->user() && $request->user()->suspended) || ($user && $user->suspended)) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Oops! Su usuario se encuentra suspendido! (check-suspended)',
                    'detail' => 'Comuníquese con el administrador',
                    'code' => '429'
                ]
            ], 429);
        }
        return $next($request);
    }
}
