<?php

use App\Http\Controllers\AccountController;
use App\Http\Controllers\MainController;
use App\Http\Middleware\Authenticate;
use App\Http\Middleware\RedirectIfAuthenticated;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Route;

Route::get('generate-class', [MainController::class, 'generate_class']);
 