<?php

namespace App\Http\Controllers;

use App\Traits\ApiCustomResponses;
use App\Http\Requests\TodoRequest;
use App\Http\Resources\TodoResource;
use App\Http\Resources\TodoCollection;
use App\Filters\TodoFilter;
use App\Models\Todo;
use Illuminate\Http\Request;

class TodoController extends Controller
{
    use ApiCustomResponses; 
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $user         = $request -> user(); 
        $filter       = new TodoFilter();
        $filterItems  = $filter -> transform($request);
        $todos        = Todo::whereHas('todoList', function($query) use ($user) {
            $query -> where('user_id', $user -> id);
        }) -> where($filterItems);

        $searchClosure = $filter  -> applySearch($request);
        if($searchClosure) $todos -> where($searchClosure);
        
        $paginatedTodos = $todos -> paginate(5) -> appends($request -> query()); //return data paginated after each 5 objects and making sure that filters applies to other pages
        $resourceTodos  = new TodoCollection($paginatedTodos);
        return $this -> success(
            $resourceTodos -> response() -> getData(true),
            'Todos retrieved successfully.',
            200,
        );
        // return new TodoCollection($resourceTodos);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(TodoRequest $request)
    {
        $todo = Todo::create($request -> all());
        return $this -> success(
            new TodoResource($todo),
            'Todo created successfully.',
            201,
        );
    }

    /**
     * Display the specified resource.
     */
    public function show(Todo $todo)
    {
        $this -> authorize('view', $todo);
        return $this -> success(
            new TodoResource($todo),
            'Todo retrieved successfully.',
            200,
        );
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(TodoRequest $request, Todo $todo)
    {
        $this -> authorize('update', $todo);
        $todo -> update($request -> validated());
        return $this -> success(
            new TodoResource($todo),
            'Todo updated successfully.',
            200,
        );
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Todo $todo)
    {
        $this -> authorize('delete', $todo);
        $todo -> delete();
        return $this -> success(
            null,
            'Todo deleted successfully.',
            200,
        );
    }
}
