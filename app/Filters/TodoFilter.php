<?php

namespace App\Filters;

use App\Filters\ApiFilter;


class TodoFilter extends ApiFilter{
    protected $searchParms = [
        'title',
        'description',
    ];
    protected $safeParms    = [
        'todolist_id' => ['eq'],
        'title'       => ['eq'],
        'description' => ['eq'],
        'status'      => ['eq'],
        'due_date'    => ['eq', 'lt', 'lte', 'gt', 'gte', 'ne']
    ];
}