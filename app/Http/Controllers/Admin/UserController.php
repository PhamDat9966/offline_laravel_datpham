<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use App\Models\UserModel as MainModel;
use App\Http\Requests\UserRequest as MainRequest;

class UserController extends AdminController
{

    public function __construct()
    {
        $this->pathViewController   = 'admin.pages.user.';
        $this->controllerName       = 'user';
        $this->model  = new MainModel();
        View::share('controllerName',$this->controllerName);
        parent::__construct();
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

