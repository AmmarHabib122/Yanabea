<?php

namespace Tests\Feature\TodoListApis;





class TodoListUpdateTest extends TodoListSetUpData
{
    public function test_user_update_an_owned_todoList_passing_valid_data(): void
    {
        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> putJson('api/todo_lists/3', $this -> testTodoList1);
        
        $response 
            -> assertStatus(200)
            -> assertJson([
                'success' => true,
                'message' => 'TodoList updated successfully.',
                'data'    => $this -> testTodoList1
            ])
            ;

    }


    public function test_user_update_a_non_owned_todoList_passing_valid_data(): void
    {
        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> putJson('api/todo_lists/5', $this -> testTodoList1);
        
        $response 
            -> assertStatus(403)
            -> assertJson([
                'success' => false,
                'message' => 'This action is unauthorized.',
                'data'    => Null
            ])
            ;
    }
}
