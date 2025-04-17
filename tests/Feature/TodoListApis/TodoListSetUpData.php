<?php

namespace Tests\Feature\TodoListApis;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Models\Todo;
use App\Models\TodoList;
use App\Models\User;



class TodoListSetUpData extends TestCase
{
    use RefreshDatabase;

    protected $user1;
    protected $user1Token;
    protected $user1TodoLists;

    protected $user2;
    protected $user2Token;
    protected $user2TodoLists;

    protected $testTodoList1;
    protected $testTodoList2;
    protected $testTodoList3;

    
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

        $this -> testTodoList1 = [
            'title'       => 'testTodoList1',
            'description' => 'this is the description for testTodoList1',
        ];
        $this -> testTodoList2 = [
            'title'       => 'testTodoList2',
            'description' => 'this is the description for testTodoList2',
        ];
        $this -> testTodoList3 = [
            'title'       => 'testTodoList3',
            'description' => 'this is the description for testTodoList3',
        ];
    }
}
