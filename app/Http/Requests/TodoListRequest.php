<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class TodoListRequest extends FormRequest
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
                'user_id'     => ['sometimes', 'required'],
                'title'       => ['sometimes', 'required'],
                'description' => ['sometimes', 'nullable'],
            ];
        }
        else{
            return [
                'user_id'     => ['required'],
                'title'       => ['required'],
                'description' => ['nullable'],
            ];
        }
    }

    protected function prepareForValidation()
    {
        $method = $this -> method();
        //if description not included in put request it is set to null
        if($method != 'PATCH'){
            if(!($this -> has('description'))){
                $this -> merge([
                    'description' => null,
                ]);
            }
            $this -> merge([
                'user_id' => $this -> user() -> id,
            ]);
        }
    }
}
