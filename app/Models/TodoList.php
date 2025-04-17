<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TodoList extends Model
{
    /** @use HasFactory<\Database\Factories\TodoListFactory> */
    use HasFactory;

    protected $fillable = [
        'title',
        'user_id',
        'description',
    ];

    public function user()
    {
        return $this -> belongsTo(User::class, 'user_id');
    }
    public function todos()
    {
        return $this -> hasMany(Todo::class, 'todolist_id');
    }

}
