<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\RoleHasPermissionModel as MainModel;
use App\Http\Requests\RoleHasPermissionRequest as MainRequest;

use App\Models\RoleModel;
use App\Models\PermissionModel;

class RoleHasPermissionController extends Controller
{
    private $pathViewController = 'admin.pages.roleHasPermission.';
    private $controllerName     = 'roleHasPermission';
    private $params             = [];
    private $model;

    public function __construct()
    {
        $this->model = new MainModel();
        $this->params["pagination"]["totalItemsPerPage"] = 20;

        $roleModel          = new RoleModel();
        $permissionModel    = new PermissionModel();

        $roleList           = $roleModel->getItem(null,['task'=>'get-item-name-and-id']);
        $permissionList     = $permissionModel->getItem(null,['task'=>'get-item-name-and-id']);

        view()->share('controllerName', $this->controllerName);
        view()->share('roleList', $roleList);
        view()->share('permissionList', $permissionList);
    }

    public function index(Request $request)
    {
        $this->params['search']['field']  = $request->input('search_field', ''); // all id description
        $this->params['search']['value']  = $request->input('search_value', '');

        $items              = $this->model->listItems($this->params, ['task'  => 'admin-list-items']);
        $itemsNameCount     = $this->model->countItems($this->params, ['task' => 'admin-count-items-group-by-name']);

        return view($this->pathViewController .  'index', [
            'params'        => $this->params,
            'items'         => $items,
            'itemsStatusCount' =>  $itemsNameCount
        ]);
    }

    public function save(MainRequest $request)
    {
        if ($request->method() == 'POST') {
            $params = $request->all();

            $task   = "add-item";
            $notify = "Thêm phần tử thành công!";

            if ($params['id'] !== null) {
                $task   = "edit-item";
                $notify = "Cập nhật phần tử thành công!";
            }
            $this->model->saveItem($params, ['task' => $task]);
            return redirect()->route($this->controllerName)->with("zvn_notify", $notify);
        }
    }

    public function delete(Request $request)
    {
        $params["id"]             = $request->id;
        $this->model->deleteItem($params, ['task' => 'delete-item']);
        return redirect()->route($this->controllerName)->with('zvn_notify', 'Xóa phần tử thành công!');
    }
}
