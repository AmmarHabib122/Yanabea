<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\TodoList;

class TodoListSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Create 3 todo lists for each user
        User::all() -> each(function (User $user) {
            TodoList::factory() -> count(3) -> for($user) -> create();
        });
    }
}
