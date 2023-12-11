<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use App\Models\DataViewsArticleModel as MainModel;

use App\Models\UserAgentModel as UserAgentModel;

class DataViewsArticleController extends Controller
{
    private $pathViewController  = 'admin.pages.dataViewsArticle.';
    private $controllerName      = 'dataViewsArticle';
    private $params              = [];
    private $model;

    public function __construct()
    {
      $this->model  = new MainModel();
      $this->params['pagination']['totalItemsPerPage']  = 10;
      // share bien $controllerName cho all view
      View::share('controllerName',$this->controllerName);
    }

    public function index(Request $request)// Ở Laravel, request sẽ lấy trực tiếp thông tin từ client chuyền về server, ở đây tiêu biểu là lấy $_GET và $_POST
    {

        $this->params['filter']['status']   = $request->input('filter_status','all'); // $request->input() là do laravel định nghĩa, tương đương với $_GET
        $this->params['search']['field']    = $request->input('search_field','');
        $this->params['search']['value']    = $request->input('search_value','');

        $this->params['filter']['category']   = $request->input('filter_category','all');
        $this->params['filter']['type']       = $request->input('filter_type','all');

        //Cập nhật Lượt Views theo 'user_agents' table
        $userAgentModel = new UserAgentModel();
        $dataUserAgent  = $userAgentModel->listItems($params = null,['task'=>'user_agents-list-items']);
        // Mảng mới sau khi xóa các phần tử trùng 'agent' và 'article_id'
        $newDataView = [];

        // Loại bỏ những các views trùng nhau của user theo UserAgent
        foreach ($dataUserAgent as $item) {
            $isDuplicate = false;

            // Kiểm tra xem có phần tử nào trong mảng mới có 'agent' và 'article_id' giống không
            foreach ($newDataView as $newItem) {

                if ($item['agent'] === $newItem['agent']  && $item['article_id'] === $newItem['article_id']) {
                    $isDuplicate = true;
                    break;
                }
            }

            // Nếu không trùng, thêm vào mảng mới
            if (!$isDuplicate) {
                $newDataView[] = $item;
            }
        }

        echo '<pre>';
        print_r($newDataView);
        echo '</pre>';
                // Giải thuật tính views tạm thời
        // $checkIDArticleView  = $this->model->checkArticleID($this->params,['task'=>'check-id']);
        // echo '<pre>';
        // print_r($checkIDArticleView);
        // echo '</pre>';
        // if($checkIDArticleView == null){
        //     // Nếu chưa có dữ liệu về lượt xem cho bài viết, thêm một bản ghi mới
        //     $this->params['views']  = 1;
        //     $this->params['status'] = 'active';
        //     $viewsArticleModel->saveItem($this->params,['task'=>'add-item']);

        // }else{
        //     $checkIDArticleView = $checkIDArticleView[0];
        //     $this->params['id']             = $checkIDArticleView['id'];
        //     $this->params['article_id']     = $checkIDArticleView['article_id'];
        //     $this->params['views']          = (int)$checkIDArticleView['views'] + 1;
        //     $viewsArticleModel->saveItem($this->params,['task'=>'add-views']);
        // }

        $items              = $this->model->listItems($this->params,['task' => "data-view-list-items"]);
        $itemsStatusCount   = $this->model->countItems($this->params,['task' => "admin-count-items-group-by-status"]);

        // $itemsStatusCount   = $this->model->countItems($this->params,['task' => "admin-count-items-group-by-status"]);

        // $categoryModel  = new categoryModel();
        // $categoryList   = $categoryModel->listItems(null,['task'=>'category-list']);

        // $firstItem      = ['id'=> 'all','name'=> 'Tất Cả'];
        // $categoryList   = array('all' => $firstItem) + $categoryList;


        return view($this->pathViewController . 'index',[
             'params'               => $this->params,
             'items'                => $items,
             'itemsStatusCount'     => $itemsStatusCount,
        ]);
    }

}

// php artisan make:model ArticalModel
