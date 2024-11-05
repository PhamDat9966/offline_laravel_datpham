<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use App\Models\ProductModel as MainModel;
use App\Models\CategoryProductModel;
use App\Http\Requests\ProductRequest as MainRequest;

use App\Http\Controllers\Admin\AdminController;
use App\Models\AttributeModel;
use App\Models\AttributevalueModel;

class ProductController extends AdminController
{
    public function __construct()
    {
        $this->pathViewController   = 'admin.pages.product.';
        $this->controllerName       = 'product';
        $this->model  = new MainModel();
        View::share('controllerName',$this->controllerName);
        parent::__construct();
    }

    public function index(Request $request) //index trèn thêm dữ liệu
    {
        // Gọi method index của AdminController
        $response = parent::index($request);

        $this->params['filter']['category']   = $request->input('filter_category','all');
        $this->params['filter']['type']       = $request->input('filter_type','all');

        // Thêm nội dung mới của ProductController
        $categoryModel  = new CategoryProductModel();
        //$categoryList   = $categoryModel->listItems(null, ['task' => 'category-list']);
        // $firstItem      = ['id' => 'all', 'name' => 'Tất Cả'];
        // $categoryList   = array('all' => $firstItem) + $categoryList;

        $categoryList   = $categoryModel->listItems(null, ['task' => 'admin-list-items-in-select-box']);
        unset($categoryList[1]); // Xóa phần tử root
        $categoryList = ['all' => 'Tất cả'] + $categoryList; // Thêm phần tử có key = 'all' và value = 'Tất cả' vào đầu mảng

        // Lấy dữ liệu từ response của AdminController
        $data = $response->getData(); //$data ở đây bao gồm cả 'params','items', 'itemsStatusCount'

        // Thêm dữ liệu mới vào dữ liệu từ AdminController
        $data['categoryList'] = $categoryList;

        // Trả về response mới
        return view($this->pathViewController . 'index', (array)$data);
    }

    public function save(MainRequest $request) // MainRequest là đối tượng $request có validate
    {

        if($request->method() == 'POST'){

            $params = $request->all();  // Lấy param từ request chi dung voi POST
            dd($params);
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

    public function form(Request $request)
    {

        $item   = null;
        $autoIncrement = $this->model->getItem(null,['task'=>'get-auto-increment']);
        $autoIncrement = $autoIncrement[0]->AUTO_INCREMENT;

        $attributeModel         = new AttributeModel();
        $attributesWithValue    = $attributeModel->getItem( null , ['task'=>'get-attributes-with-attributevalues']);

        if($request->id !== null){
            $params['id']   = $request->id;
            $autoIncrement  = $params['id'];
             // Trong trường hợp edit thì autoIncrement sẽ không tạo mới, autoIncrement = id hiện có,
             // tránh lỗi khi lấy dữ liệu $this->model->getItem($params,['task'=>'get-item']); trong trường hợp copy paste để sửa lại slug
            $item = $this->model->getItem($params,['task'=>'get-item']);
        }

        $categoryModel      = new CategoryProductModel();
        $itemsCategory      = $categoryModel->listItems(null,["task"=>'admin-list-items-in-select-box']);
        unset($itemsCategory[1]); // Xóa phần tử root
        $itemsCategory = ['all' => 'Tất cả'] + $itemsCategory;

        return view($this->pathViewController . 'form', [
            'item'                  =>$item,
            'itemsCategory'         =>$itemsCategory,
            'autoIncrement'         =>$autoIncrement,
            'attributesWithValue'   =>$attributesWithValue
        ]);
    }

    public function changeCategory(Request $request)
    {
        $params["category_id"]      = $request->category_id;
        $params["id"]               = $request->id;

        $this->model->saveItem($params, ['task' => 'change-category']);

        return response()->json([
            'status' => 'success'
        ]);
    }
}

