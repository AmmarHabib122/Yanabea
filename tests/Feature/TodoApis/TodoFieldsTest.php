<?php

namespace Tests\Feature\TodoApis;





class TodoFieldsTest extends TodoSetUpData
{
    public function test_todolist_id(): void
    {
        //passing non existing todolist_id
        $this -> testTodo1['todolist_id'] = 500;
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
        
        //not passing the todolist_id enitrley
        unset($this -> testTodo1['todolist_id']);
        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> postJson('api/todos', $this -> testTodo1);
        $response 
            -> assertStatus(400)
            -> assertJson([
                'success' => false,
                'message' => 'The todolist id field is required.', 
                'data'    =>  Null
            ])
            ;
    }



    public function test_title(): void
    {
        //passing duplicate title within the same todoList
        $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> postJson('api/todos', $this -> testTodo1);
        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> postJson('api/todos', $this -> testTodo1);
        $response 
            -> assertStatus(400)
            -> assertJson([
                'success' => false,
                'message' => 'A record with this data already exist.', 
                'data'    =>  Null
            ])
            ;

        //not passing the title enitrley
        unset($this -> testTodo1['title']);
        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> postJson('api/todos', $this -> testTodo1);
        $response 
            -> assertStatus(400)
            -> assertJson([
                'success' => false,
                'message' => 'The title field is required.', 
                'data'    =>  Null
            ])
            ;
    }



    public function test_description(): void
    {
        //not passing the description enitrley in PUT update to be set to null
        unset($this -> testTodo1['description']);
        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> putJson('api/todos/5', $this -> testTodo1);
        $response 
            -> assertStatus(200)
            -> assertJson([
                'success' => true,
                'message' => 'Todo updated successfully.', 
            ])
            -> assertJsonPath('data.description', null)
            ;

        //passing a description again
        $this -> testTodo1['description'] = 'This is description';
        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> putJson('api/todos/5', $this -> testTodo1);
        $response 
            -> assertStatus(200)
            -> assertJson([
                'success' => true,
                'message' => 'Todo updated successfully.', 
            ])
            -> assertJsonPath('data.description', "This is description")
            ;

        //not passing the description enitrley in PATCH update to not be changed
        unset($this -> testTodo1['description']);
        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> patchJson('api/todos/5', $this -> testTodo1);
        $response 
            -> assertStatus(200)
            -> assertJson([
                'success' => true,
                'message' => 'Todo updated successfully.', 
            ])
            -> assertJsonPath('data.description', "This is description")
            ;
    }



    public function test_status(): void
    {
        //passing non existing status
        $this -> testTodo1['status'] = 'processing';
        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> postJson('api/todos', $this -> testTodo1);
        $response 
            -> assertStatus(400)
            -> assertJson([
                'success' => false,
                'message' => 'The selected status is invalid.', 
                'data'    =>  Null
            ])
            ;
        
        //not passing the status enitrley
        unset($this -> testTodo2['status']);
        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> postJson('api/todos', $this -> testTodo2);
        $response 
            -> assertStatus(201)
            -> assertJson([
                'success' => true,
                'message' => 'Todo created successfully.', 
            ])
            -> assertJsonPath('data.status', "pending")
            ;
    }

}
