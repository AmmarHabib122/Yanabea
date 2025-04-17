<?php

namespace App\Http\Controllers;

use App\Traits\ApiCustomResponses;
use App\Http\Requests\TodoListRequest;
use App\Http\Resources\TodoListResource;
use App\Http\Resources\TodoListCollection;
use App\Filters\TodoListFilter;
use App\Models\TodoList;
use Illuminate\Http\Request;

class TodoListController extends Controller
{
    use ApiCustomResponses; 
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $user         = $request -> user();
        $filter       = new TodoListFilter();
        $filterItems  = $filter -> transform($request);
        $todoLists    = TodoList::where('user_id', $user -> id) -> where($filterItems); 

        $searchClosure = $filter  -> applySearch($request);
        if($searchClosure) $todoLists -> where($searchClosure);

        $includeTodos = strtolower($request -> query('includeTodos'));
        if($includeTodos === 'true') $todoLists = $todoLists -> with('todos');
        
        $paginatedTodoLists = $todoLists -> paginate(5) -> appends($request -> query()); //return data paginated after each 5 objects and making sure that filters applies to other pages
        $resourceTodoLists  = new TodoListCollection($paginatedTodoLists);
        return $this -> success(
            $resourceTodoLists -> response() -> getData(true),
            'TodoLists retrieved successfully.',
            200,
        );
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(TodoListRequest $request)
    {
        $todoList = TodoList::create($request -> validated());
        return $this -> success(
            new TodoListResource($todoList),
            'TodoList created successfully.',
            201,
        );
    }

    /**
     * Display the specified resource.
     */
    public function show(TodoList $todoList)
    {
        $this -> authorize('view', $todoList);
        $todoList = TodoList::with('todos') -> findOrFail($todoList->id);
        return $this -> success(
            new TodoListResource($todoList),
            'TodoList retrieved successfully.',
            200,
        );
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(TodoListRequest $request, TodoList $todoList)
    {
        $this -> authorize('view', $todoList);
        $todoList -> update($request -> validated());
        return $this -> success(
            new TodoListResource($todoList),
            'TodoList updated successfully.',
            200,
        );
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(TodoList $todoList)
    {
        $this -> authorize('view', $todoList);
        $todoList -> delete();
        return $this -> success(
            null,
            'TodoList deleted successfully.',
            200,
        );
    }
}
