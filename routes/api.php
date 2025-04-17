<?php

use App\Http\Controllers\TodoListController;
use App\Http\Controllers\TodoController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

Route::middleware('auth:sanctum') -> group(function () {
    Route::apiResource('todo_lists', TodoListController::class);
    Route::apiResource('todos', TodoController::class);
});