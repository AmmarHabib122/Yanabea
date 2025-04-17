<?php

namespace Tests\Feature\TodoListApis;


class TodoListDestroyTest extends TodoListSetUpData
{
    public function test_user_delete_an_owned_todoList(): void
    {
        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> deleteJson('api/todo_lists/3');    //each user has 3 todoLists
        
        $response 
            -> assertStatus(200)
            -> assertJson([
                'success' => true,
                'message' => 'TodoList deleted successfully.', 
                'data'    =>  Null
            ])
            ;

    }

    public function test_user_delete_a_non_owned_todoList(): void
    {
        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> deleteJson('api/todo_lists/4');
        
        $response 
            -> assertStatus(403)
            -> assertJson([
                'success' => false,
                'message' => 'This action is unauthorized.', 
                'data'    =>  Null
            ])
            ;
    }
}
