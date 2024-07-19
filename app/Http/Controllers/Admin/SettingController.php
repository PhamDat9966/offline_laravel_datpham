<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use App\Models\SettingModel as MainModel;
use App\Http\Requests\SettingRequest as MainRequest;
use Config;
class SettingController extends Controller
{
    private $pathViewController  = 'admin.pages.setting.';
    private $controllerName      = 'setting';
    private $params              = [];
    private $model;

    public function __construct()
    {
      $this->model  = new MainModel();
      $this->params['pagination']['totalItemsPerPage']  = 3;
      // share bien $controllerName cho all view
      View::share('controllerName',$this->controllerName);
    }

    public function index(Request $request) //index trèn thêm dữ liệu
    {
        $params = $request->all();
        $item   = null;
        if($request->id !== null){
            $params['id']   = $request->id;
            $item = $this->model->getItem($params,['task'=>'get-item']);
        }

        return view($this->pathViewController . 'index', [
            'item'      =>$item,
            'params'    =>$params
        ]);
    }

    public function save(MainRequest $request) // MainRequest là đối tượng $request có validate
    {
        $params = $request->all();

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

