<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('todos', function (Blueprint $table) {
            $table -> id();
            $table -> foreignId('todolist_id') -> constrained('todo_lists') -> cascadeOnDelete();
            $table -> string('title');
            $table -> text('description') -> nullable();
            $table -> enum('status', ['pending', 'completed', 'in_progress']) -> default('pending'); // enforcing the status to have only the allowed values
            $table -> date('due_date') -> nullable();
            $table -> timestamps();

            $table -> unique(['title', 'todolist_id']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('todos');
    }
};
