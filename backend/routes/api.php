<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/
use App\Http\Controllers\UsuarioController;



//Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//    return $request->user();
//});


Route::get('index', [UsuarioController::class, 'index']);
Route::post('store', [UsuarioController::class, 'store']);
Route::get('show/{id}', [UsuarioController::class, 'show']);
Route::put('update/{id}', [UsuarioController::class, 'update']);
Route::delete('destroy/{id}', [UsuarioController::class, 'destroy']);
