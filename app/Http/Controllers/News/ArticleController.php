<?php

namespace App\Http\Controllers\News;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;

use App\Models\CategoryModel;
use App\Models\ArticleModel;

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

        $articleModel   = new ArticleModel();
        $categoryModel  = new CategoryModel();

        $itemArticle  = $articleModel->getItem($this->params,['task'=>'news-get-item']);
        $this->params['category_id']  = $itemArticle['category_id'];

        if(empty($itemArticle)) return redirect()->route('home'); // Nếu trường hợp view nhập category_id ko tồn tại thì trả về trang home ngay!

        $itemsLatest    = $articleModel->listItems(null, ['task'=> 'news-list-items-latest']);
        $itemArticle['listItemlate']  = $articleModel->listItems($this->params, ['task'=> 'list-items-late']);

        return view($this->pathViewController . 'index',[
             'params'       => $this->params,
             'itemsLatest'  => $itemsLatest,
             'itemArticle'  => $itemArticle
        ]);
    }

}

// php artisan make:model SliderModel
