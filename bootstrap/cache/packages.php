<?php return array (
  'barryvdh/laravel-dompdf' => 
  array (
    'providers' => 
    array (
      0 => 'Barryvdh\\DomPDF\\ServiceProvider',
    ),
    'aliases' => 
    array (
      'Pdf' => 'Barryvdh\\DomPDF\\Facade\\Pdf',
      'PDF' => 'Barryvdh\\DomPDF\\Facade\\Pdf',
    ),
  ),
  'berkayk/onesignal-laravel' => 
  array (
    'providers' => 
    array (
      0 => 'Berkayk\\OneSignal\\OneSignalServiceProvider',
    ),
    'aliases' => 
    array (
      'OneSignal' => 'Berkayk\\OneSignal\\OneSignalFacade',
    ),
  ),
  'encore/laravel-admin' => 
  array (
    'providers' => 
    array (
      0 => 'Encore\\Admin\\AdminServiceProvider',
    ),
    'aliases' => 
    array (
      'Admin' => 'Encore\\Admin\\Facades\\Admin',
    ),
  ),
  'facade/ignition' => 
  array (
    'providers' => 
    array (
      0 => 'Facade\\Ignition\\IgnitionServiceProvider',
    ),
    'aliases' => 
    array (
      'Flare' => 'Facade\\Ignition\\Facades\\Flare',
    ),
  ),
  'fruitcake/laravel-cors' => 
  array (
    'providers' => 
    array (
      0 => 'Fruitcake\\Cors\\CorsServiceProvider',
    ),
  ),
  'jxlwqq/quill' => 
  array (
    'providers' => 
    array (
      0 => 'Jxlwqq\\Quill\\QuillServiceProvider',
    ),
  ),
  'laravel-admin-ext/chartjs' => 
  array (
    'providers' => 
    array (
      0 => 'Encore\\Chartjs\\ChartjsServiceProvider',
    ),
  ),
  'laravel-admin-ext/summernote' => 
  array (
    'providers' => 
    array (
      0 => 'Encore\\Summernote\\SummernoteServiceProvider',
    ),
  ),
  'laravel/sail' => 
  array (
    'providers' => 
    array (
      0 => 'Laravel\\Sail\\SailServiceProvider',
    ),
  ),
  'laravel/sanctum' => 
  array (
    'providers' => 
    array (
      0 => 'Laravel\\Sanctum\\SanctumServiceProvider',
    ),
  ),
  'laravel/tinker' => 
  array (
    'providers' => 
    array (
      0 => 'Laravel\\Tinker\\TinkerServiceProvider',
    ),
  ),
  'nesbot/carbon' => 
  array (
    'providers' => 
    array (
      0 => 'Carbon\\Laravel\\ServiceProvider',
    ),
  ),
  'nunomaduro/collision' => 
  array (
    'providers' => 
    array (
      0 => 'NunoMaduro\\Collision\\Adapters\\Laravel\\CollisionServiceProvider',
    ),
  ),
  'tymon/jwt-auth' => 
  array (
    'aliases' => 
    array (
      'JWTAuth' => 'Tymon\\JWTAuth\\Facades\\JWTAuth',
      'JWTFactory' => 'Tymon\\JWTAuth\\Facades\\JWTFactory',
    ),
    'providers' => 
    array (
      0 => 'Tymon\\JWTAuth\\Providers\\LaravelServiceProvider',
    ),
  ),
);