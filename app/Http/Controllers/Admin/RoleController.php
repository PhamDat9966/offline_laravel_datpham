<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\RoleModel as MainModel;
use App\Http\Requests\RoleRequest as MainRequest;

class RoleController extends Controller
{
    private $pathViewController = 'admin.pages.role.';
    private $controllerName     = 'role';
    private $params             = [];
    private $model;

    public function __construct()
    {
        $this->model = new MainModel();
        $this->params["pagination"]["totalItemsPerPage"] = 5;
        view()->share('controllerName', $this->controllerName);
    }

    public function index(Request $request)
    {
        $items              = $this->model->listItems($this->params, ['task'  => 'admin-list-items']);
        return view($this->pathViewController .  'index', [
            'items'         => $items,
        ]);
    }

    public function form(Request $request)
    {
        $item   = null;
        if($request->id !== null){
            $params['id']   = $request->id;
            $item = $this->model->getItem($params,['task'=>'get-item']);
        }

        return view($this->pathViewController . 'form', [
            'item'          =>$item
        ]);
    }

    public function save(MainRequest $request) // MainRequest là đối tượng $request có validate
    {
        if($request->method() == 'POST'){
            $params = $request->all();  // Lấy param từ request
            $task   = 'add-item';
            $notify = 'Thêm phần tử thành công!';
            if(isset($params['id'])){
                if($params['id'] !== null){
                    $task = 'edit-item';
                    $notify   = 'Cập nhật thành công!';
                }
            }
            $this->model->saveItem($params,['task'=>$task]);
            return redirect()->route($this->controllerName)->with('zvn_notily', $notify);
        }
    }

    public function delete(Request $request)
    {
        $params['id']               = $request->id;
        $this->model->deleteItem($params,['task' => 'delete-item']);
        return redirect()->route($this->controllerName)->with('zvn_notily','Phần tử ID = ' .$params['id'] .' đã được xóa!');
    }
}


