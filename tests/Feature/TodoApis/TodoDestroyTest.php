<?php

namespace Tests\Feature\TodoApis;





class TodoDestroyTest extends TodoSetUpData
{
    public function test_user_delete_an_owned_todo(): void
    {
        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> deleteJson('api/todos/6');
        
        $response 
            -> assertStatus(200)
            -> assertJson([
                'success' => true,
                'message' => 'Todo deleted successfully.', 
                'data'    =>  Null
            ])
            ;

    }

    public function test_user_delete_a_non_owned_todo(): void
    {
        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> deleteJson('api/todos/16');
        
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
