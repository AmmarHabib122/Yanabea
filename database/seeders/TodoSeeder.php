<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Todo;
use App\Models\TodoList;

class TodoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Create 10 todos for each todo list
        TodoList::all() -> each(function (TodoList $todoList) {
            Todo::factory() -> count(5) -> for($todoList) -> create();
        });
    }
}
