<?php

namespace Tests\Feature\TodoListApis;





class TodoListFieldsTest extends TodoListSetUpData
{
    public function test_title(): void
    {
        //passing duplicate title within the same user
        $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> postJson('api/todo_lists', $this -> testTodoList1);
        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> postJson('api/todo_lists', $this -> testTodoList1);
        $response 
            -> assertStatus(400)
            -> assertJson([
                'success' => false,
                'message' => 'A record with this data already exist.', 
                'data'    =>  Null
            ])
            ;

        //not passing the title enitrley
        unset($this -> testTodoList1['title']);
        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> postJson('api/todo_lists', $this -> testTodoList1);
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
        unset($this -> testTodoList1['description']);
        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> putJson('api/todo_lists/3', $this -> testTodoList1);
        $response 
            -> assertStatus(200)
            -> assertJson([
                'success' => true,
                'message' => 'TodoList updated successfully.', 
            ])
            -> assertJsonPath('data.description', null)
            ;

        //passing a description again
        $this -> testTodoList1['description'] = 'This is description';
        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> putJson('api/todo_lists/3', $this -> testTodoList1);
        $response 
            -> assertStatus(200)
            -> assertJson([
                'success' => true,
                'message' => 'TodoList updated successfully.', 
            ])
            -> assertJsonPath('data.description', "This is description")
            ;

        //not passing the description enitrley in PATCH update to not be changed
        unset($this -> testTodoList1['description']);
        $response = $this 
            -> withHeaders(['Authorization' => 'Bearer ' . $this -> user1Token,]) 
            -> patchJson('api/todo_lists/3', $this -> testTodoList1);
        $response 
            -> assertStatus(200)
            -> assertJson([
                'success' => true,
                'message' => 'TodoList updated successfully.', 
            ])
            -> assertJsonPath('data.description', "This is description")
            ;
    }




}
