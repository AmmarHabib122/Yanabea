<?php

namespace Tests\Feature\TodoApis;





class TodoCreateTest extends TodoSetUpData
{
    public function test_user_create_a_todo_passing_valid_data(): void
    {
        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> postJson('api/todos', $this -> testTodo1);
        
        $response 
            -> assertStatus(201)
            -> assertJson([
                'success' => true,
                'message' => 'Todo created successfully.', 
                'data'    =>  $this -> testTodo1
            ])
            ;

    }

    public function test_user_create_a_todo_passing_a_non_owned_todoList_id(): void
    {
        $this -> testTodo1['todolist_id'] = 5;
        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> postJson('api/todos', $this -> testTodo1);
        
        $response 
            -> assertStatus(400)
            -> assertJson([
                'success' => false,
                'message' => 'The selected todolist id is invalid.',
                'data'    =>  Null
            ])
            ;
    }
}
