<?php

namespace Tests\Feature\TodoApis;





class TodoViewTest extends TodoSetUpData
{
    public function test_user_view_an_owned_todo(): void
    {
        //creating the todo to be retrieved
        $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> postJson('api/todos', $this -> testTodo1);

        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> getJson('api/todos/31');
        
        $response 
            -> assertStatus(200)
            -> assertJson([
                'success' => true,
                'message' => 'Todo retrieved successfully.', 
                'data'    =>  $this -> testTodo1
            ])
            ;

    }

    public function test_user_view_a_non_owned_todo(): void
    {
        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> getJson('api/todos/26');
        
        $response 
            -> assertStatus(403)
            -> assertJson([
                'success' => false,
                'message' => 'This action is unauthorized.',
                'data'    =>  Null
            ])
            ;
    }

    public function test_user_view_all_owned_todos(): void
    {
        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> getJson('api/todos');
        
        $response 
            -> assertStatus(200)
            -> assertJson([
                'success' => true,
                'message' => 'Todos retrieved successfully.',
            ])
            -> assertJsonPath('data.meta.total', 15);  //each user has only 15 todos
            ;

   
            
    }
}
