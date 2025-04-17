<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        // 1. Rename 'name' to 'username'
        Schema::table('users', function (Blueprint $table) {
            $table->renameColumn('name', 'username');
        });

        // 2. Make 'email' nullable
        Schema::table('users', function (Blueprint $table) {
            $table->string('email')->nullable()->change();
        });

        // 3. Add unique index to 'username'
        Schema::table('users', function (Blueprint $table) {
            $table->unique('username');
        });
    }

    public function down(): void
    {
        // 1. Drop unique index on 'username'
        Schema::table('users', function (Blueprint $table) {
            $table->dropUnique(['username']);
        });

        // 2. Make 'email' not nullable again
        Schema::table('users', function (Blueprint $table) {
            $table->string('email')->nullable(false)->change();
        });

        // 3. Rename 'username' back to 'name'
        Schema::table('users', function (Blueprint $table) {
            $table->renameColumn('username', 'name');
        });
    }
};

