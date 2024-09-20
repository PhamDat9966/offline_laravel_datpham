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

    public function index(Request $request)
    {
        $this->params['category_id'] = $request->category_id;
        $articleModel   = new ArticleModel();
        $categoryModel  = new CategoryModel();
        $itemCategory  = $categoryModel->getItem($this->params,['task'=>'news-get-item']);

        if(empty($itemCategory)) return redirect()->route('home'); // Nếu trường hợp view nhập category_id ko tồn tại thì trả về trang home ngay!

        $itemsLatest    = $articleModel->listItems(null, ['task'=> 'news-list-items-latest']);
        $itemCategory['article'] = $articleModel->listItems($this->params, ['task'=> 'news-list-items-in-category']);

        //Lấy danh sách con
        $categoryChildList       = $categoryModel->listItems($this->params,['task' => 'category-child']);
        //Lấy danh sách bài viết từ danh sách category con
        if($categoryChildList != null){
           $params = [];
            foreach($categoryChildList as $valueCategoryChild ){
                $params['category_id'][] = $valueCategoryChild['id'];
            }
            $articlesInChild            = $articleModel->listItems($params, ['task'=> 'news-list-items-in-category-id-array']);
            //Gán
            $itemCategory['article_child'] = $articlesInChild;
        }
        $breadcrumbs = $categoryModel->listItems($this->params,['task' => 'category-family-ancestors']);

        return view($this->pathViewController . 'index',[
             'params'           => $this->params,
             'itemsLatest'      => $itemsLatest,
             'itemCategory'     => $itemCategory,
             'breadcrumbs'      => $breadcrumbs
        ]);
    }

}

