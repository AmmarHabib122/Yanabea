<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Exceptions\CustomHandler;
use Illuminate\Contracts\Debug\ExceptionHandler;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        $this -> app -> singleton(ExceptionHandler::class, CustomHandler::class);
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        //
    }
}
