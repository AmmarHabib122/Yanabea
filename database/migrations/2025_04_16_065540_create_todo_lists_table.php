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
        Schema::create('todo_lists', function (Blueprint $table) {
            $table -> id();
            $table -> foreignId('user_id') -> constrained() -> cascadeOnDelete();    
            $table -> string('title');        
            $table -> text('description') -> nullable();
            $table -> timestamps();

            //enforcing user to not have duplicate titiles for different lists
            $table -> unique(['title', 'user_id']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('todo_lists');
    }
};
