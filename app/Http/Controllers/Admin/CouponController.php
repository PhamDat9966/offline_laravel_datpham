<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use App\Models\CouponModel as MainModel;
use App\Http\Requests\CouponRequest as MainRequest;
use App\Http\Controllers\Admin\AdminController;

class CouponController extends AdminController
{
    public function __construct()
    {
        $this->pathViewController   = 'admin.pages.coupon.';
        $this->controllerName       = 'coupon';
        $this->model  = new MainModel();
        View::share('controllerName',$this->controllerName);
        parent::__construct();
    }

    public function index(Request $request) //index trèn thêm dữ liệu
    {
        // Gọi method index của AdminController
        $response = parent::index($request);

        // Lấy dữ liệu từ response của AdminController
        $data = $response->getData(); //$data ở đây bao gồm cả 'params','items', 'itemsStatusCount'

        // Trả về response mới
        return view($this->pathViewController . 'index', (array)$data);
    }

    public function save(MainRequest $request) // MainRequest là đối tượng $request có validate
    {
        // dd($request->all());
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

    public function form(Request $request)
    {

        $item   = null;
        if ($request->id !== null) {
            $params["id"] = $request->id;
            $item = $this->model->getItem($params, ['task' => 'get-item']);
        }

        return view($this->pathViewController . 'form', [
            'item'          =>$item
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

