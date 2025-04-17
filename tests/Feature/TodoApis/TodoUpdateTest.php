<?php

namespace Tests\Feature\TodoApis;





class TodoUpdateTest extends TodoSetUpData
{
    public function test_user_update_an_owned_todo_passing_valid_data(): void
    {
        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> putJson('api/todos/14', $this -> testTodo1);
        
        $response 
            -> assertStatus(200)
            -> assertJson([
                'success' => true,
                'message' => 'Todo updated successfully.',
                'data'    => $this -> testTodo1
            ])
            ;

    }

    public function test_user_update_an_owned_todo_passing_a_non_owned_todoList_id(): void
    {
        $this -> testTodo1['todolist_id'] = 29;
        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> putJson('api/todos/14', $this -> testTodo1);
        
        $response 
            -> assertStatus(400)
            -> assertJson([
                'success' => false,
                'message' => 'The selected todolist id is invalid.',
                'data'    => Null
            ])
            ;
    }

    public function test_user_update_a_non_owned_todo_passing_valid_data(): void
    {
        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> putJson('api/todos/28', $this -> testTodo1);
        
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
