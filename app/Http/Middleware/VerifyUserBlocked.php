<?php

namespace App\Http\Middleware;

use App\Models\Authentication\User;
use Closure;
use Illuminate\Http\Request;

class VerifyUserBlocked
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
        if (($request->user() && $request->user()->max_attempts <= 0) || ($user && $user->max_attempts <= 0)) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Oops! Su usuario se encuentra bloqueado! (check-max-attempts)',
                    'detail' => 'Demasiados intentos de inicio de sesión',
                    'code' => '429'
                ]
            ], 429);
        }
        return $next($request);
    }
}
