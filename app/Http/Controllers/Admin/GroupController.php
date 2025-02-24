<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\GroupModel as MainModel;
use App\Models\CategoryModel;
use App\Http\Requests\GroupRequest as MainRequest;

class GroupController extends Controller
{
    private $pathViewController = 'admin.pages.group.';  // slider
    private $controllerName     = 'group';
    private $params             = [];
    private $model;

    public function __construct()
    {
        $this->model = new MainModel();
        $this->params["pagination"]["totalItemsPerPage"] = 5;
        view()->share('controllerName', $this->controllerName);
    }

    public function index(Request $request)
    {
        $items              = $this->model->listItems($this->params, ['task'  => 'admin-list-items']);
        return view($this->pathViewController .  'index', [
            'items'         => $items,
        ]);
    }
}


