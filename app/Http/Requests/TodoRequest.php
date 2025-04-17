<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;


class TodoRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return True;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        $method = $this -> method();
        if($method == 'PATCH'){
            return [
                'todolist_id' => ['sometimes', 'required', Rule::exists('todo_lists', 'id') -> where(function ($query) {
                    $query -> where('user_id', $this -> user() -> id);
                })],
                'title'       => ['sometimes', 'required'],
                'description' => ['sometimes', 'nullable'],
                'status'      => ['sometimes', 'required', Rule::in(['pending', 'completed', 'in_progress'])],
                'due_date'    => ['sometimes', 'nullable', 'date', 'after:today'],
            ];
        }
        else{
            return [
                'todolist_id' => ['required', Rule::exists('todo_lists', 'id') -> where(function ($query) {
                    $query -> where('user_id', $this -> user() -> id);
                })],
                'title'       => ['required'],
                'description' => ['nullable'],
                'status'      => ['required', Rule::in(['pending', 'completed', 'in_progress'])],
                'due_date'    => ['nullable', 'date', 'after:today'],
            ];
        }
    }
    protected function prepareForValidation()
    {
        $method = $this -> method();

        if($this -> has('status')){
            // Lowercase the status value
            $this -> merge([
                'status' => strtolower($this -> input('status'))
            ]);
        }

        if($method != 'PATCH'){
            //if due_date not included in put request it is set to null
            if(!($this -> has('due_date'))){
                $this -> merge([
                    'due_date' => null,
                ]);
            }
            //if description not included in put request it is set to null
            if(!($this -> has('description'))){
                $this -> merge([
                    'description' => null,
                ]);
            }
            //if status not included in put request it is set to pending
            if(!($this -> has('status'))){
                $this -> merge([
                    'status' => 'pending'
                ]);
            }
        }
    }
}

