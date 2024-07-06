<?php

namespace App\Http\Controllers\News;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;

use App\Models\PhonecontactModel;
use App\Models\ArticleModel;
use App\Models\UserModel;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Session\Store;

class PhonecontactController extends Controller
{
    private $pathViewController  = 'news.pages.phonecontact.';
    private $controllerName      = 'phonecontact';
    private $params              = [];
    private $model;

    public function __construct()
    {
        $this->model = new PhonecontactModel();
      // share bien $controllerName cho all view
      View::share('controllerName',$this->controllerName);
    }

    public function contact(Request $request)// Ở Laravel, request sẽ lấy parameter từ url, ở đây tiêu biểu là lấy $_GET và $_POST
    {
        $input                  = $request->input('input');
        $param                  = [];
        $param['phonecontact']  = $input;
        $this->model->saveItem($param,['task' => 'add-item']);

        echo 'Đã thêm dữ liệu thành công';
    }

    public function saveUsuallyCategory(){

    }

}
