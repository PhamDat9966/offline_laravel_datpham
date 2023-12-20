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

        $itemsUsually = '';
        if (Session::has('userInfo')) {

            $userInfo                   = Session::get('userInfo');
            // Trường hợp user chưa xem bài nào thì tạo một chuỗi ngẫu nhiên từ danh sách categoryID để làm  nhóm bài viết đề xuất
            if($userInfo['usually_category'] == null){
                $listCategoryID = array();
                $listCategoryID = $categoryModel->getItem(null,['task'=>'category-list-id']);

                $resultRamdomString = '';

                for ($i = 0; $i < 10; $i++) {
                    $randomIndex = array_rand($listCategoryID);
                    $resultRamdomString .= $listCategoryID[$randomIndex]['id'] . ',';
                }
                $userInfo['usually_category'] = $resultRamdomString;
            }

            // Nhóm bài viết "thường đọc - đề xuất". Gồm Max là category được xem nhiều nhất và secondHighest là category được xem nhiều thứ 2
            // Max lấy 2 bài và secondHighest lấy 1 bài

            $usuallyCategoryAr          = explode(',',$userInfo['usually_category']);
            $usuallyCategoryCount       = array_count_values($usuallyCategoryAr);
            $maxValue                   = max($usuallyCategoryCount);
            $maxKey                     = array_search($maxValue, $usuallyCategoryCount);
            $params['usually_key_max']  = $maxKey;// Đây là key category được xem nhiều nhất
            //Lấy key value nhiều thứ 2
            // Sắp xếp mảng theo giá trị giảm dần
            arsort($usuallyCategoryCount);
            $secondHighest = array_keys($usuallyCategoryCount)[1];
            $params['usually_key_second_highest']  = $secondHighest;
            // Suy xuất đến model
            $itemsUsually           = $articleModel->listItems($params, ['task'=> 'news-list-items-usually-max']); // Chọn 6 phần tử mới nhất
            shuffle($itemsUsually);
            $itemsUsually           = array_slice($itemsUsually, 0, 2); //chỉ lấy 2 phần tử của mảng sau khi xáo chộn mảng
            $itemsUsually[]         = $articleModel->listItems($params, ['task'=> 'news-list-items-usually-second-highest']); // Kết hợp 1 phần tử của category được xem nhiều thứ 2
        }

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
