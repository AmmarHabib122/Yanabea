<?php

namespace App\Filters;

use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Builder;

class ApiFilter{
    protected $searchParms = [];

    protected $safeParms    = [];

    protected $operatorMap  = [
        'eq' => '=',
        'lt' => '<',
        'lte' => '<=',
        'gt' => '>', 
        'gte' => '>=',
        'ne' => '!=',
    ];

    public function transform(Request $request){
        $eloQuery = [];
        foreach($this -> safeParms as $parm => $operators){
            $query = $request -> query($parm);

            if(!isset($query)) continue;

            foreach($operators as $operator){
                if(isset($query[$operator])){
                    $eloQuery[] = [$parm, $this -> operatorMap[$operator], $query[$operator]];
                }
            }
        }
        return $eloQuery;
    }
    
    public function applySearch(Request $request) {
        $searchTerm = $request -> query('search');
        
        if (!$searchTerm || empty($this -> searchParms)) {
            return null;
        }

        return function(Builder $query) use ($searchTerm) {
            $query -> where(function(Builder $innerQuery) use ($searchTerm) {
                foreach ($this -> searchParms as $column) {
                    $innerQuery -> orWhere($column, 'LIKE', "%{$searchTerm}%");
                }
            });
        };
    }
}