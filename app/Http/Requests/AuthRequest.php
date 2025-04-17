<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rules\Password;

class AuthRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        // Check if the request is for registration
        if ($this -> is('api/register')) {
            return [
                'username' => ['required', 'string', 'max:255', 'unique:users'],
                'email'    => ['required', 'string', 'max:255', 'unique:users'],
                'password' => ['required', 'string', Password::min(8) -> mixedCase() -> letters() -> numbers() -> uncompromised()],
            ];
        }

        // Default rules for login
        return [
            'email'    => ['required', 'email'],
            'password' => ['required', 'string'],
        ];
    }

    public function messages()
    {
        return [
            'email.unique'    => 'This email is already registered',
            'username.unique' => 'This username is already taken',
        ];
    }
}