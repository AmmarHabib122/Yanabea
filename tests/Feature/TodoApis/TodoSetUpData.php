<?php

namespace Tests\Feature\TodoApis;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Models\Todo;
use App\Models\TodoList;
use App\Models\User;



class TodoSetUpData extends TestCase
{
    use RefreshDatabase;

    protected $user1;
    protected $user1Token;
    protected $user1TodoLists;

    protected $user2;
    protected $user2Token;
    protected $user2TodoLists;

    protected $testTodo1;
    protected $testTodo2;
    protected $testTodo3;

    
    protected function setUp(): void
    {
        parent::setUp();
        
        //seeding users
        $this -> user1      = User::factory() -> create();
        $this -> user2      = User::factory() -> create();
        $this -> user1Token = $this -> user1 -> createToken('test-token') -> plainTextToken;
        $this -> user2Token = $this -> user2 -> createToken('test-token') -> plainTextToken;
        
        //seeding todoLists
        $this -> user1TodoLists =TodoList::factory() -> count(3) -> for($this -> user1) -> create();
        $this -> user2TodoLists =TodoList::factory() -> count(3) -> for($this -> user2) -> create();
        
        //seeding todos
        foreach ($this -> user1TodoLists as $todoList) {
            Todo::factory() -> count(5) -> for($todoList) -> create();
        }
        foreach ($this -> user2TodoLists as $todoList) {
            Todo::factory() -> count(5) -> for($todoList) -> create();
        }

        $this -> testTodo1 = [
            'todolist_id' => 1,
            'title'       => 'testTodo1',
            'description' => 'this is the description for testTodo1',
            'status'      => 'in_progress',
            'due_date'    => '2026-07-02',
        ];
        $this -> testTodo2 = [
            'todolist_id' => 1,
            'title'       => 'testTodo2',
            'description' => 'this is the description for testTodo2',
            'status'      => 'completed',
            'due_date'    => '2026-05-02',
        ];
        $this -> testTodo3 = [
            'todolist_id' => 1,
            'title'       => 'testTodo3',
            'description' => 'this is the description for testTodo3',
            'status'      => 'in_progress',
            'due_date'    => '2026-12-02',
        ];
    }
}
