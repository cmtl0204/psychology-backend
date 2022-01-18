<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400"></a></p>

<p align="center">
<a href="https://travis-ci.org/laravel/framework"><img src="https://travis-ci.org/laravel/framework.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

## About Laravel

Laravel is a web application framework with expressive, elegant syntax. We believe development must be an enjoyable and creative experience to be truly fulfilling. Laravel takes the pain out of development by easing common tasks used in many web projects, such as:

- [Simple, fast routing engine](https://laravel.com/docs/routing).
- [Powerful dependency injection container](https://laravel.com/docs/container).
- Multiple back-ends for [session](https://laravel.com/docs/session) and [cache](https://laravel.com/docs/cache) storage.
- Expressive, intuitive [database ORM](https://laravel.com/docs/eloquent).
- Database agnostic [schema migrations](https://laravel.com/docs/migrations).
- [Robust background job processing](https://laravel.com/docs/queues).
- [Real-time event broadcasting](https://laravel.com/docs/broadcasting).

Laravel is accessible, powerful, and provides tools required for large, robust applications.

## Learning Laravel

Laravel has the most extensive and thorough [documentation](https://laravel.com/docs) and video tutorial library of all modern web application frameworks, making it a breeze to get started with the framework.

If you don't feel like reading, [Laracasts](https://laracasts.com) can help. Laracasts contains over 1500 video tutorials on a range of topics including Laravel, modern PHP, unit testing, and JavaScript. Boost your skills by digging into our comprehensive video library.

## Laravel Sponsors

We would like to extend our thanks to the following sponsors for funding Laravel development. If you are interested in becoming a sponsor, please visit the Laravel [Patreon page](https://patreon.com/taylorotwell).

### Premium Partners

- **[Vehikl](https://vehikl.com/)**
- **[Tighten Co.](https://tighten.co)**
- **[Kirschbaum Development Group](https://kirschbaumdevelopment.com)**
- **[64 Robots](https://64robots.com)**
- **[Cubet Techno Labs](https://cubettech.com)**
- **[Cyber-Duck](https://cyber-duck.co.uk)**
- **[Many](https://www.many.co.uk)**
- **[Webdock, Fast VPS Hosting](https://www.webdock.io/en)**
- **[DevSquad](https://devsquad.com)**
- **[Curotec](https://www.curotec.com/services/technologies/laravel/)**
- **[OP.GG](https://op.gg)**
- **[CMS Max](https://www.cmsmax.com/)**
- **[WebReinvent](https://webreinvent.com/?utm_source=laravel&utm_medium=github&utm_campaign=patreon-sponsors)**
- **[Lendio](https://lendio.com)**
- **[Romega Software](https://romegasoftware.com)**

## Contributing

Thank you for considering contributing to the Laravel framework! The contribution guide can be found in the [Laravel documentation](https://laravel.com/docs/contributions).

## Code of Conduct

In order to ensure that the Laravel community is welcoming to all, please review and abide by the [Code of Conduct](https://laravel.com/docs/contributions#code-of-conduct).

## Security Vulnerabilities

If you discover a security vulnerability within Laravel, please send an e-mail to Taylor Otwell via [taylor@laravel.com](mailto:taylor@laravel.com). All security vulnerabilities will be promptly addressed.

## License

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).

# Libraries
 
- **["ext-json": "*",](https://php.watch/versions/8.0/ext-json)**
- **["ext-zip": "*",](https://php.watch/versions/8.0/ext-json)**

add  in composer.json/require => "ext-json": "*",
## DomPDF
- **[barryvdh/laravel-dompdf](https://github.com/dompdf/dompdf)**
- composer require barryvdh/laravel-dompdf
- config/app.php => providers => Barryvdh\DomPDF\ServiceProvider::class,
- config/app.php => aliases => 'PDF' => Barryvdh\DomPDF\Facade::class,

## Cascade Soft Deletes
- **[dyrynda/laravel-cascade-soft-deletes](https://github.com/michaeldyrynda/laravel-cascade-soft-deletes)**
- composer require dyrynda/laravel-cascade-soft-deletes

## Mail CSS Inliner
- **[fedeisas/laravel-mail-css-inliner](https://github.com/fedeisas/laravel-mail-css-inliner)** 
- composer require fedeisas/laravel-mail-css-inliner

## Intervention Image
- **[intervention/image](http://image.intervention.io/)** 
- composer require intervention/image
- config/app.php => providers => Intervention\Image\ImageServiceProvider::class,
- config/app.php => aliases => 'Image' => Intervention\Image\Facades\Image::class,

## Laravel Socialitie
- **[laravel/socialite](https://laravel.com/docs/8.x/socialite#installation)**
- composer require laravel/socialite
- config/services.php =>

'google' => [

  'client_id' => env('GOOGLE_CLIENT_ID'),

  'client_secret' => env('GOOGLE_CLIENT_SECRET'),

  'redirect' => env('GOOGLE_REDIRECT_URL'),

  ],

## Laravel Spanish
- **[laraveles/spanish](https://github.com/Laraveles/spanish)** 
- composer require laraveles/spanish
- config/app.php => providers => Laraveles\Spanish\SpanishServiceProvider::class,
- php artisan vendor:publish --tag=lang

## Laravel Auditing
- **[owen-it/laravel-auditing](http://www.laravel-auditing.com/docs/9.0/installation)**
- composer require owen-it/laravel-auditing
- config/app.php => providers => OwenIt\Auditing\AuditingServiceProvider::class,
- php artisan vendor:publish --provider "OwenIt\Auditing\AuditingServiceProvider" --tag="migrations"
- php artisan vendor:publish --provider "OwenIt\Auditing\AuditingServiceProvider" --tag="config"

## SimpleSoftware QR
- **[simplesoftwareio/simple-qrcode](https://www.simplesoftware.io/#/docs/simple-qrcode)**
- composer require simplesoftwareio/simple-qrcode "~4"
- config/app.php => providers => SimpleSoftwareIO\QrCode\QrCodeServiceProvider::class,
- config/app.php => aliases => 'QrCode' => SimpleSoftwareIO\QrCode\Facades\QrCode::class,

## Laravel Permission
- **[spatie/laravel-permission](https://spatie.be/docs/laravel-permission/v5/installation-laravel)**
- composer show spatie/laravel-permission
- config/app.php => providers => Spatie\Permission\PermissionServiceProvider::class,
- php artisan vendor:publish --provider="Spatie\Permission\PermissionServiceProvider"
- php artisan optimize:clear
- php artisan config:clear
- php artisan migrate

## Laravel Sanctum (for 7 or less)
- **[laravel/sanctum](https://laravel.com/docs/8.x/sanctum#installation)**
- composer require laravel/sanctum
- php artisan vendor:publish --provider="Laravel\Sanctum\SanctumServiceProvider"
- php artisan migrate
- app/Http/Kernel.php => api =>  \Laravel\Sanctum\Http\Middleware\EnsureFrontendRequestsAreStateful::class,
- (Optional) for User model in other directory

config/auth.php => providers => 'model' => App\Models\Authentication\User::class,

# Other Configurations

## File Systems
- Create a private directory

'private' => [
'driver' => 'local',
'root' => storage_path('app/private'),
],

- Add in .env FILESYSTEM_DRIVER='private'
