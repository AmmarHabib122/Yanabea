<?php

namespace App\Exceptions;

use Illuminate\Database\QueryException;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Illuminate\Http\JsonResponse;
use Illuminate\Validation\ValidationException;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Throwable;

class CustomHandler extends ExceptionHandler
{

    public function register()
    {
       
        
        // Handle Database Errors
        $this -> renderable(function (QueryException $e) {
            $errorCode = $e -> errorInfo[1] ?? 0;
            $sqlState  = $e -> errorInfo[0] ?? null;

            // Duplicate entry error (MySQL error 1062) || SQLite or PostgreSQL duplicate entry (SQLSTATE 23000)
            if ($errorCode === 1062 || $sqlState === '23000') {
                return new JsonResponse([
                    'success' => false,
                    'message' => 'A record with this data already exist.',
                    'data'    => null,
                ], 400); 
            }

            // Foreign key failure (MySQL error 1452)
            if ($errorCode === 1452) {
                return new JsonResponse([
                    'success' => false,
                    'message' => 'Invalid reference - the related resource does not exist.',
                    'data'    => null,
                ], 400); 
            }

            // Generic database error
            return new JsonResponse([
                'success' => false,
                'message' => 'Database operation failed.',
                'data'    => $e,
            ], 500);
        });

        // Handle Validation Errors
        $this -> renderable(function (ValidationException $e) {
            return new JsonResponse([
                'success' => false,
                'message' => $e -> getMessage(),
                'data'    => null,
            ], 400);
        });

        // Handle All Other Errors
        $this -> renderable(function (Throwable $e) {
            // Get status code from HttpException, default to 500
            $status = $e instanceof HttpException ? $e -> getStatusCode() : 500;

            return new JsonResponse([
                'success' => false,
                'message' => config('app.debug') ? $e -> getMessage() : 'Something went wrong',
                'data'    => null,
            ], $status);
        });
    }
}


