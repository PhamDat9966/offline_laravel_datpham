<?php

namespace App\Http\Controllers\News;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;

use App\Models\CategoryModel;
use App\Models\ArticleModel;
use App\Models\DataViewsArticleModel;

class ArticleController extends Controller
{
    private $pathViewController  = 'news.pages.article.';
    private $controllerName      = 'article';
    private $params              = [];
    private $model;

    public function __construct()
    {
      // share bien $controllerName cho all view
      View::share('controllerName',$this->controllerName);
    }

    public function index(Request $request)// Ở Laravel, request sẽ lấy parameter từ url, ở đây tiêu biểu là lấy $_GET và $_POST
    {

        $this->params['article_id'] = $request->article_id;
        $this->params['article_name'] = $request->article_name;

        $articleModel       = new ArticleModel();
        $categoryModel      = new CategoryModel();
        $viewsArticleModel   = new DataViewsArticleModel();

        $itemArticle    = $articleModel->getItem($this->params,['task'=>'news-get-item']);
        $this->params['category_id']  = $itemArticle['category_id'];

        //$itemCategory   = $categoryModel->getItem($this->params,['task'=>'news-get-item']);

        if(empty($itemArticle)) return redirect()->route('home'); // Nếu trường hợp view nhập category_id ko tồn tại thì trả về trang home ngay!

        $checkIDArticleView  = $viewsArticleModel->checkArticleID($this->params,['task'=>'check-id']);
        // echo '<pre>';
        // print_r($checkIDArticleView);
        // echo '</pre>';

        if($checkIDArticleView == null){
            // Nếu chưa có dữ liệu về lượt xem cho bài viết, thêm một bản ghi mới
            $this->params['views']  = 1;
            $this->params['status'] = 'active';
            $viewsArticleModel->saveItem($this->params,['task'=>'add-item']);
        }else{
            $this->params['id']             = $checkIDArticleView[0]['id'];
            $this->params['article_id']     = $checkIDArticleView[0]['article_id'];
            $this->params['views']          = (int)$checkIDArticleView[0]['views'] + 1;
            $viewsArticleModel->saveItem($this->params,['task'=>'add-views']);
        }



        $itemsLatest    = $articleModel->listItems(null, ['task'=> 'news-list-items-latest']);
        $itemArticle['related_article']  = $articleModel->listItems($this->params, ['task'=> 'new-list-items-related-in-category']);

        return view($this->pathViewController . 'index',[
             'params'       => $this->params,
             'itemsLatest'  => $itemsLatest,
             'itemArticle'  => $itemArticle
        ]);
    }

}

// php artisan make:model SliderModel
