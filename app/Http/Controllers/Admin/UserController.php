<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use App\Models\UserModel as MainModel;
use App\Http\Requests\UserRequest as MainRequest;
use Config;

class UserController extends Controller
{
    private $pathViewController  = 'admin.pages.user.';
    private $controllerName      = 'user';
    private $params              = [];
    private $model;

    public function __construct()
    {
      $this->model  = new MainModel();
      $this->params['pagination']['totalItemsPerPage']  = 10;
      // share bien $controllerName cho all view
      View::share('controllerName',$this->controllerName);
    }

    public function index(Request $request)
    {
        $allParams = $request->all();

        $this->params['filter']['status']   = $request->input('filter_status','all');
        $this->params['search']['field']    = $request->input('search_field','');
        $this->params['search']['value']    = $request->input('search_value','');

        $items              = $this->model->listItems($this->params,['task' => "admin-list-items"]);
        $itemsStatusCount   = $this->model->countItems($this->params,['task' => "admin-count-items-group-by-status"]);

        return view($this->pathViewController . 'index',[
             'params'               => $this->params,
             'items'                => $items,
             'itemsStatusCount'     => $itemsStatusCount
        ]);
    }

    public function form(Request $request)
    {
        $params = [];
        if($request->session()->has('userInfo')){
            $data = $request->session()->all();
            $params['userInfo'] = $data['userInfo'];
        }

        $item   = null;
        if($request->id !== null){
            $params['id']   = $request->id;
            $item = $this->model->getItem($params,['task'=>'get-item']);
        }

        return view($this->pathViewController . 'form', [
            'item'=>$item
        ]);
    }

    public function status(Request $request)
    {

        $params['currentStatus']    = $request->status;
        $params['id']               = $request->id;
        $status = $request->status == 'active' ? 'inactive' : 'active';

        $this->model->saveItem($params,['task' => 'change-status']);

        $link = route($this->controllerName . '/status',['status'=>$status, 'id'=>$request->id]);
        return response()->json([
            'status' => Config::get('zvn.template.status')[$status],
            'link'   => $link
        ]);

    }
    public function delete(Request $request)
    {
        $params['id']               = $request->id;
        $this->model->deleteItem($params,['task' => 'delete-item']);
        return redirect()->route($this->controllerName)->with('zvn_notily','Phần tử ID = ' .$params['id'] .' đã được xóa!');
    }

    public function level(Request $request)
    {
        $params['id']       = $request->id;
        $params['level']  = $request->level;
        $this->model->saveItem($params,['task' => 'change-level']);
        return response()->json([
            'level' => 'success'
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

    public function changePassword(MainRequest $request) // MainRequest là đối tượng $request có validate
    {

        if($request->method() == 'POST'){
            $params = $request->all();  // Lấy param từ request
            $task   = 'change-password';
            $this->model->saveItem($params,['task'=>$task]);
            $notify = 'Thay đổi mật khẩu thành công!';
            return redirect()->route($this->controllerName)->with('zvn_notily', $notify);
        }
    }

    public function levelPost(MainRequest $request) // MainRequest là đối tượng $request có validate
    {
        if($request->method() == 'POST'){
            $params = $request->all();  // Lấy param từ request
            $task   = 'change-level-post';
            $this->model->saveItem($params,['task'=>$task]);
            $notify = 'Thay đổi level thành công!';
            return redirect()->route($this->controllerName)->with('zvn_notily', $notify);
        }
    }

}

