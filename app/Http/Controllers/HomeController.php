<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use App\Models\SliderModel;
use App\Models\CategoryModel;
use App\Models\ArticleModel;

class HomeController extends Controller
{
    private $pathViewController  = 'news.pages.home.';
    private $controllerName      = 'home';
    private $params              = [];
    private $model;

    public function __construct()
    {
      // share bien $controllerName cho all view
      View::share('controllerName',$this->controllerName);
    }

    public function index(Request $request)// Ở Laravel, request sẽ lấy trực tiếp thông tin từ client chuyền về server, ở đây tiêu biểu là lấy $_GET và $_POST
    {
        $sliderModel = new SliderModel();
        $itemsSlider = $sliderModel->listItems(null, ['task'=>'news-list-items']);

        $categoryModel = new CategoryModel();
        $itemsCategory = $categoryModel->listItems(null, ['task'=> 'news-list-items-is-home']);

        $articleModel   = new ArticleModel();
        $itemsFeature   = $articleModel->listItems(null, ['task'=> 'news-list-items-feature']);
        if(count($itemsFeature) < 3){
            $itemsFeature   = $articleModel->listItems(null, ['task'=> 'news-list-items-many-conditions']); // Lấy dữ liệu bao gồm cả nổi bật và không nổi bật
        }

        $itemsLatest    = $articleModel->listItems(null, ['task'=> 'news-list-items-latest']);

        return view($this->pathViewController . 'index',[
             'params'               => $this->params,
             'itemsSlider'          => $itemsSlider,
             'itemsCategory'        => $itemsCategory,
             'itemsFeature'         => $itemsFeature,
             'itemsLatest'          => $itemsLatest
        ]);
    }

}

// php artisan make:model SliderModel
