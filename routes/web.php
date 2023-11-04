<?php

use App\Http\Controllers\AccountController;
use App\Http\Controllers\MainController;
use App\Http\Middleware\Authenticate;
use App\Http\Middleware\RedirectIfAuthenticated;
use App\Models\Gen;
use App\Models\Utils;
use Dflydev\DotAccessData\Util;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Route;

Route::get('/sync', function () {
    Utils::sync_products();
    Utils::sync_orders();
})->name("gen");

Route::get('/gen', function () {
    die(Gen::find($_GET['id'])->do_get());
})->name("gen");
Route::get('/gen-form', function () {
    die(Gen::find($_GET['id'])->make_forms());
})->name("gen-form");
Route::get('generate-class', [MainController::class, 'generate_class']);
