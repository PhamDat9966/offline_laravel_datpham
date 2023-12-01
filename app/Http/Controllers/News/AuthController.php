<?php

namespace App\Http\Controllers\News;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use App\Models\UserModel as MainModel;
use App\Http\Requests\AuthRequest as MainRequest;

class AuthController extends Controller
{
    private $pathViewController  = 'news.pages.auth.';
    private $controllerName      = 'auth';
    private $params              = [];
    private $model;

    public function __construct()
    {
      View::share('controllerName',$this->controllerName);
    }

    public function login(Request $request)
    {
        return view($this->pathViewController . 'login');
    }

    public function postLogin(MainRequest $request)
    {
        if($request->method() == 'POST'){
            $params = $request->all();
            echo '<pre>';
            print_r($params);
            echo '</pre>';
        }
    }

}

// php artisan make:model SliderModel
