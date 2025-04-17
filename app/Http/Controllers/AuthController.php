<?php

namespace App\Http\Controllers;

use App\Http\Requests\AuthRequest;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Traits\ApiCustomResponses;

class AuthController extends Controller
{
    use ApiCustomResponses;

    public function register(AuthRequest $request)
    {
        try {
            $validated = $request -> validated();
            
            $user = User::create([
                'username' => $validated['username'],
                'email'    => $validated['email'],
                'password' => Hash::make($validated['password']),
            ]);

            // Create token using Sanctum
            $token = $user -> createToken('auth-token') -> plainTextToken;

            return $this -> success([
                'user'  => $user -> only('id', 'username', 'email'),
                'token' => $token
            ], 'User registered successfully.', 201);

        } 
        catch (\Exception $e) {
            return $this -> failure('Registration failed: ' . $e -> getMessage(), 500);
        }
    }

    public function login(AuthRequest $request)
    {
        try {
            if (!Auth::attempt($request -> only('email', 'password'))) {
                return $this->failure('Invalid credentials.', 401);
            }

            $user = User::where('email', $request -> email) -> first();
            
            // Revoke existing tokens
            $user -> tokens() -> delete();
            
            // Create new token
            $token = $user -> createToken('auth-token') -> plainTextToken;

            return $this -> success([
                'user'  => $user -> only('id', 'username', 'email'),
                'token' => $token
            ], 'Login successful.');

        } 
        catch (\Exception $e) {
            return $this -> failure('Login failed: ' . $e -> getMessage(), 500);
        }
    }
}