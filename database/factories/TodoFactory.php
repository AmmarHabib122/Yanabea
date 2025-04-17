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
        $faker = FakerFactory::create('en_US');
        return [
            'todolist_id' => TodoList::factory(),
            'title'       => $faker -> sentence(3),
            'description' => $faker -> optional() -> paragraph(),
            'status'      => $faker -> randomElement(['pending', 'completed', 'in_progress']),
            'due_date'    => optional($faker -> dateTimeBetween('now', '+1 year')) -> format('Y-m-d'),
        ];
    }
}
