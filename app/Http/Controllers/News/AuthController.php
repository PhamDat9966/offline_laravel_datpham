<?php

namespace App\Http\Controllers\News;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use App\Models\UserModel;
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
            $userModel  = new UserModel();
            $userInfo   = $userModel->getItem($params,['task'=>'auth-login']);

            echo '<pre>';
            print_r($userInfo);
            echo '</pre>';

            if(!$userInfo) return redirect()->route($this->controllerName . '/login')->with('news_notily','Tài khoảng hoặc mật khẩu không chính xác!');
        }
    }

}

// php artisan make:model SliderModel
