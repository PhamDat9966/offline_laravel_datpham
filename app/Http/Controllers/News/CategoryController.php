<?php

namespace App\Http\Controllers\News;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;

use App\Models\CategoryModel;
use App\Models\ArticleModel;

class CategoryController extends Controller
{
    private $pathViewController  = 'news.pages.category.';
    private $controllerName      = 'category';
    private $params              = [];
    private $model;

    public function __construct()
    {
      // share bien $controllerName cho all view
      View::share('controllerName',$this->controllerName);
    }

    public function index(Request $request)// Ở Laravel, request sẽ lấy trực tiếp thông tin từ client chuyền về server, ở đây tiêu biểu là lấy $_GET và $_POST
    {
        $articleModel   = new ArticleModel();

        $itemsLatest    = $articleModel->listItems(null, ['task'=> 'news-list-items-latest']);

        return view($this->pathViewController . 'index',[
             'params'               => $this->params,
             'itemsLatest'          => $itemsLatest
        ]);
    }

}

// php artisan make:model SliderModel