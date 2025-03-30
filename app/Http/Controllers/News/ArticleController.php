<?php

namespace App\Http\Controllers\News;

use Illuminate\Support\Facades\App;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;

use App\Models\CategoryArticleModel;
use App\Models\ArticleModel;
use App\Models\UserModel;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Session\Store;

class ArticleController extends Controller
{
    private $pathViewController  = 'news.vi.pages.article.';
    private $controllerName      = 'article';
    private $params              = [];
    private $model;
    protected $locale;

    public function __construct()
    {
        View::share('controllerName',$this->controllerName);
    }

    public function index(Request $request)
    {
        $this->params['article_id']     = $request->article_id;
        $this->params['article_name']   = $request->article_name;
        $this->params['locale']         = ($request->locale) ? ($request->locale) : 'vi'; //Ngôn ngữ mặc định là 'vi'

        $articleModel       = new ArticleModel();
        $categoryModel      = new CategoryArticleModel();

        $itemArticle    = $articleModel->getItem($this->params,['task'=>'news-get-item']);

        $this->params['category_id']  = $itemArticle['category_id'];

        if($request->session()->has('userInfo')){
            $userInfo       = Session::get('userInfo');
            $userModel      = new UserModel();
            $strlenCategoryUsually = strlen($userInfo['usually_category']);
            // Nếu chuỗi dài quá 80 ký tự, loại bớt 40 ký tự đầu của chuỗi usually_category để ghi lại thói quen mới
            if($strlenCategoryUsually >= 80){
                $userInfo['usually_category'] = substr($userInfo['usually_category'], 40);
            }

            $this->params['usually_category'] = $this->params['category_id'];
            $this->params['user_id']          = $userInfo['id'];
            $this->params['usually_category'] = $userInfo['usually_category'] .','. $this->params['category_id'];
            // Cập nhật lại sesion
            $userInfo['usually_category'] = $this->params['usually_category'];

            $request->session()->put('userInfo', $userInfo);
            $userModel->saveItem($this->params,['task'=>'update-usually-category']);

        }

        if(empty($itemArticle)) return redirect()->route('home'); // Nếu trường hợp view nhập category_id ko tồn tại thì trả về trang home ngay!

        $nowAritcleID   = $this->params['article_id'];
        //Set id vào bản user_agents
        DB::table('user_agents')->where('id', '>', 0)->limit(1)->orderBy('id', 'desc')->update(['article_id' => $nowAritcleID]);

        $itemsLatest    = $articleModel->listItems(null, ['task'=> 'news-list-items-latest']);
        $itemArticle['related_article']  = $articleModel->listItems($this->params, ['task'=> 'new-list-items-related-in-category']);

        $breadcrumbs = $categoryModel->listItems($this->params,['task' => 'category-family-ancestors']);

        /* Cấu hình cho menu category tại article Views */
        $params['category_id']  = $itemArticle['category_id'];
        $ancestorCategoryIds     = $categoryModel->listItems($params,['task' => 'category-ancestor']);

        return view($this->pathViewController . 'index',[
             'params'               => $this->params,
             'itemsLatest'          => $itemsLatest,
             'itemArticle'          => $itemArticle,
             'breadcrumbs'          => $breadcrumbs,
             'categoryId'           => $params['category_id'],  // mục tiêu đến category menu
             'ancestorCategoryIds'  => $ancestorCategoryIds     // mục tiêu đến category menu
        ]);
    }

    public function saveUsuallyCategory(){

    }

}
