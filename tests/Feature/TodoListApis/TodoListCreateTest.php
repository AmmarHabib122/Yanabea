<?php

namespace Tests\Feature\TodoListApis;





class TodoListCreateTest extends TodoListSetUpData
{
    public function test_user_create_a_todoList_passing_valid_data(): void
    {
        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> postJson('api/todo_lists', $this -> testTodoList1);
        
        $response 
            -> assertStatus(201)
            -> assertJson([
                'success' => true,
                'message' => 'TodoList created successfully.', 
                'data'    =>  $this -> testTodoList1
            ])
            ;

    }

    public function test_user_create_a_todoList_passing_a_different_user(): void
    {
        $this -> testTodoList1['user_id'] = 2;
        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> postJson('api/todo_lists', $this -> testTodoList1);

        $this -> testTodoList1['user_id'] = 1;
        $response 
            -> assertStatus(201)
            -> assertJson([
                'success' => true,  //return succees because the request igonored the user_id oassed
                'message' => 'TodoList created successfully.', 
                'data'    =>  $this -> testTodoList1
            ])
            ;
    }
}
