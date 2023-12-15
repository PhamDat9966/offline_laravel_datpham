<?php

namespace App\Http\Controllers\News;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use App\Models\SliderModel;
use App\Models\CategoryModel;
use App\Models\ArticleModel;

use Illuminate\Support\Facades\Session;
use Illuminate\Session\Store;

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
        $sliderModel    = new SliderModel();
        $categoryModel  = new CategoryModel();
        $articleModel   = new ArticleModel();

        $itemsSlider    = $sliderModel->listItems(null, ['task'=>'news-list-items']);
        $itemsCategory  = $categoryModel->listItems(null, ['task'=> 'news-list-items-is-home']);
        $itemsFeature   = $articleModel->listItems(null, ['task'=> 'news-list-items-feature']);
        // Trường hợp số bài viết nổi bật thấp hơn 3
        if(count($itemsFeature) < 3){
            $itemsFeature   = $articleModel->listItems(null, ['task'=> 'news-list-items-many-conditions']); // Lấy dữ liệu bao gồm cả nổi bật và không nổi bật
        }

        $itemsLatest    = $articleModel->listItems(null, ['task'=> 'news-list-items-latest']);
        foreach($itemsCategory as $key=>$value){
            $params = ['category_id'=>$value['id']];
            $itemsCategory[$key]['article'] = $articleModel->listItems($params, ['task'=> 'news-list-items-in-category']);
        }

        // Nhóm bài viết thường đọc, đề xuất
        $userInfo   = Session::get('userInfo');
        $usuallyCategoryAr      = explode(',',$userInfo['usually_category']);
        $usuallyCategoryCount   = array_count_values($usuallyCategoryAr);
        $maxValue          = max($usuallyCategoryCount);
        $maxKey            = array_search($maxValue, $usuallyCategoryCount);
        $params['usually_key']  = $maxKey;
        $itemsUsually           = $articleModel->listItems($params, ['task'=> 'news-list-items-usually']);

        return view($this->pathViewController . 'index',[
             'params'               => $this->params,
             'itemsSlider'          => $itemsSlider,
             'itemsCategory'        => $itemsCategory,
             'itemsFeature'         => $itemsFeature,
             'itemsLatest'          => $itemsLatest,
             'itemsUsually'         => $itemsUsually
        ]);
    }

}

// php artisan make:model SliderModel
