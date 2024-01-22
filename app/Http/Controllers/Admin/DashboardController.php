<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use App\Models\DashboardModel as MainModel;
use App\Http\Controllers\Admin\AdminController;

class DashboardController extends Controller
{
    private $pathViewController  = 'admin.pages.dashboard.';
    private $controllerName      = 'dashboard';
    protected $model;

    public function __construct()
    {
      $this->model  = new MainModel();
      View::share('controllerName',$this->controllerName);
    }

    public function index()
    {
        $items = $this->model->listItems(null,['task' => "admin-list-items"]);
        return view($this->pathViewController . 'index',[
            'items' => $items
        ]);
    }

}
