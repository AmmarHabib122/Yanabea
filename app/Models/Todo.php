<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Todo extends Model
{
        /** @use HasFactory<\Database\Factories\TodoFactory> */
    use HasFactory;

    protected $fillable = [
        'todolist_id',
        'title',
        'description',
        'status',
        'due_date',
    ];

    public function todoList()
    {
        return $this -> belongsTo(TodoList::class, 'todolist_id');
    }
}
