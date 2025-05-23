<?php

namespace App\Http\Controllers\Phone;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;

class PhoneController extends Controller
{
    private $pathViewController  = 'phone.pages.home.';
    private $controllerName      = 'phone';
    private $params              = [];
    private $model;

    public function __construct()
    {
        View::share('controllerName',$this->controllerName);
    }

    public function index(Request $request)
    {
        $title  = 'Phone';
        $params = [];
        return view($this->pathViewController . 'index',[
            'title'     => $title,
            'params'    => $params
        ]);
    }

}

