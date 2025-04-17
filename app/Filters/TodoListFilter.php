<?php

namespace App\Filters;

use App\Filters\ApiFilter;


class TodoListFilter extends ApiFilter{
    protected $searchParms = [
        'title',
        'description',
    ];
    protected $safeParms = [
        'title'       => ['eq'],
        'description' => ['eq'],
    ];
}