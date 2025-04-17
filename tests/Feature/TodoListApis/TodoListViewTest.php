<?php

namespace Tests\Feature\TodoListApis;





class TodoListViewTest extends TodoListSetUpData
{
    public function test_user_view_an_owned_todoList(): void
    {
        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> getJson('api/todo_lists/3');
        
        $response 
            -> assertStatus(200)
            -> assertJson([
                'success' => true,
                'message' => 'TodoList retrieved successfully.', 
            ])
            -> assertJsonCount(5, 'data.todos') 
            ;
    }

    public function test_user_view_a_non_owned_todoList(): void
    {
        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> getJson('api/todo_lists/5');
        
        $response 
            -> assertStatus(403)
            -> assertJson([
                'success' => false,
                'message' => 'This action is unauthorized.',
                'data'    =>  Null
            ])
            ;
    }

    public function test_user_view_all_owned_todo_lists(): void
    {
        //viewing only the todoLists
        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> getJson('api/todo_lists');
        
        $response 
            -> assertStatus(200)
            -> assertJson([
                'success' => true,
                'message' => 'TodoLists retrieved successfully.',
            ])
            -> assertJsonPath('data.meta.total', 3);  //each user has only 3 todo_lists
            ;

        //viewing the todoLists with ralated todos by using includeTodos param
        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> getJson('api/todo_lists?includeTodos=true');
        
        $response 
            -> assertStatus(200)
            -> assertJson([
                'success' => true,
                'message' => 'TodoLists retrieved successfully.',
            ])
            -> assertJsonCount(5, 'data.data.2.todos')
            -> assertJsonPath('data.meta.total', 3);  
            ;

   
            
    }
}
