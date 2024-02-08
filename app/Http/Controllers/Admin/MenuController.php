<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use App\Models\MenuModel as MainModel;
use App\Http\Requests\ArticleRequest as MainRequest;
use App\Http\Controllers\Admin\AdminController;

use App\Models\CategoryModel;

class MenuController extends AdminController
{
    public function __construct()
    {
        $this->pathViewController   = 'admin.pages.menu.';
        $this->controllerName       = 'menu';

        $this->model  = new MainModel();
        View::share('controllerName',$this->controllerName);
        parent::__construct();
        $this->params['pagination']['totalItemsPerPage']  = 20;
    }

    public function index(Request $request) //index trèn thêm dữ liệu
    {
        // Gọi method index của AdminController
        $response = parent::index($request);

        // Lấy dữ liệu từ response của AdminController
        $data = $response->getData(); //$data ở đây bao gồm cả 'params','items', 'itemsStatusCount'

        $params = $data['params'];

        // Thêm nội dung mới menu là category

        $categoryModel  = new categoryModel();
        $categoryList   = $categoryModel->listItems($params, ['task' => 'admin-list-items']);

        // Thêm dữ liệu mới vào dữ liệu từ AdminController
        $data['categoryList'] = $categoryList;

        // Trả về response mới
        return view($this->pathViewController . 'index', (array)$data);
    }

    public function save(MainRequest $request) // MainRequest là đối tượng $request có validate
    {

        if($request->method() == 'POST'){

            $params = $request->all();  // Lấy param từ request chi dung voi POST
            $task   = 'add-item';
            $notify = 'Thêm phần tử thành công!';

            if($params['id'] !== null){
                $task = 'edit-item';
                $notify   = 'Cập nhật thành công!';
            }
            $this->model->saveItem($params,['task'=>$task]);
            return redirect()->route($this->controllerName)->with('zvn_notily', $notify);
        }
    }
}

