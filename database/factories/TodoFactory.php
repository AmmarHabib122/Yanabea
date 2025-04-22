<?php

namespace Database\Factories;

use App\Models\TodoList;
use Illuminate\Database\Eloquent\Factories\Factory;
use Faker\Factory as FakerFactory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Todo>
 */
class TodoFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'todolist_id' => TodoList::factory(),
            'title'       => $this -> faker -> sentence(3),
            'description' => $this -> faker -> optional() -> paragraph(),
            'status'      => $this -> faker -> randomElement(['pending', 'completed', 'in_progress']),
            'due_date'    => optional($this -> faker -> dateTimeBetween('now', '+1 year')) -> format('Y-m-d'),
        ];
    }
}
