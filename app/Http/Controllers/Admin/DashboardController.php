<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;

class DashboardController extends Controller
{
    private $pathViewController  = 'admin.pages.dashboard.';
    private $controllerName      = 'dashboard';

    public function __construct()
    {
      // share bien $controllerName cho all view
      View::share('controllerName',$this->controllerName);
    }

    public function index()
    {
        return view($this->pathViewController . 'index',[

        ]);
    }

}