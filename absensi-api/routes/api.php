<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\AbsensiController;

Route::post('/login', [AuthController::class, 'login']);
Route::post('/register', [AuthController::class, 'register']);

Route::middleware('auth:sanctum')->get('/user', [AuthController::class, 'view']);
Route::middleware('auth:sanctum')->post('/absen', [AbsensiController::class, 'absen']);

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
