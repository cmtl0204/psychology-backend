<?php

namespace App\Providers;

use Illuminate\Cache\RateLimiting\Limit;
use Illuminate\Foundation\Support\Providers\RouteServiceProvider as ServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\RateLimiter;
use Illuminate\Support\Facades\Route;

class RouteServiceProvider extends ServiceProvider
{
    /**
     * The path to the "home" route for your application.
     *
     * This is used by Laravel authentication to redirect users after login.
     *
     * @var string
     */
    public const HOME = '/home';

    /**
     * The controller namespace for the application.
     *
     * When present, controller route declarations will automatically be prefixed with this namespace.
     *
     * @var string|null
     */
    // protected $namespace = 'App\\Http\\Controllers';

    /**
     * Define your route model bindings, pattern filters, etc.
     *
     * @return void
     */
    public function boot()
    {
        $this->configureRateLimiting();

        $this->routes(function () {
            $this->mapApiRoutesPrivates();
            $this->mapApiRoutesPublic();

            Route::middleware('web')
                ->namespace($this->namespace)
                ->group(base_path('routes/web.php'));
        });
    }

    protected function mapApiRoutesPrivates()
    {
        $prefix = "api/v1";
        $path = "routes/$prefix/private";

        Route::prefix($prefix)
            ->middleware(['api', 'auth:sanctum', 'verify_user_suspended'])
            ->group(base_path("${path}/authentication.php"));

        Route::prefix($prefix)
            ->middleware(['api', 'auth:sanctum', 'verify_user_suspended'])
            ->group(base_path("${path}/core.php"));

        Route::prefix($prefix)
            ->middleware(['api', 'auth:sanctum', 'verify_user_suspended'])
            ->group(base_path("${path}/psychology.php"));
    }

    protected function mapApiRoutesPublic()
    {
        $prefix = "api/v1";
        $path = "routes/$prefix/public";

        Route::prefix($prefix)
            ->middleware('api')
            ->group(base_path("${path}/init.php"));

        Route::prefix($prefix)
            ->middleware('api')
            ->group(base_path("${path}/authentication.php"));

        Route::prefix($prefix)
            ->middleware('api')
            ->group(base_path("${path}/core.php"));

        Route::prefix($prefix)
            ->middleware('api')
            ->group(base_path("${path}/psychology.php"));
    }

    /**
     * Configure the rate limiters for the application.
     *
     * @return void
     */
    protected function configureRateLimiting()
    {
        RateLimiter::for('api', function (Request $request) {
            return Limit::perMinute(1200)->by(optional($request->user())->id ?: $request->ip());
        });
    }
}
