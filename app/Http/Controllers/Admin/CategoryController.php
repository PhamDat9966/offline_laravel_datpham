<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use App\Models\CategoryModel as MainModel;
use App\Http\Requests\CategoryRequest as MainRequest;

class CategoryController extends AdminController
{
    public function __construct()
    {
        $this->pathViewController   = 'admin.pages.category.';
        $this->controllerName       = 'category';
        $this->model  = new MainModel();
        View::share('controllerName',$this->controllerName);
        parent::__construct();
    }

    public function save(MainRequest $request) // MainRequest là đối tượng $request có validate
    {

        if($request->method() == 'POST'){

            $params = $request->all();  // Lấy param từ request
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

    public function isHome(Request $request)
    {

        $params['currentIsHome']    = $request->isHome;
        $params['id']               = $request->id;

        $this->model->saveItem($params,['task' => 'change-is-home']);

        $response           = [];
        $response['isHome']['name']     = "Hiển thị";
        $response['isHome']['class']    = "btn btn-round btn-primary is-home-ajax";
        $response['link']              = route($this->controllerName.'/isHome',['isHome'=>1, 'id'=>$params['id']]);

        if($params['currentIsHome'] == true){
            $response['isHome']['name']     = "Không hiển thị";
            $response['isHome']['class']    = "btn btn-round btn-warning is-home-ajax";
            $response['link']               = route($this->controllerName.'/isHome',['isHome'=>0, 'id'=>$params['id']]);
        }
        echo json_encode($response);
        // $isHomeAction       = "Hiển thị";
        // $isHomeNextAction   = "Không hiển thị";
        // if($params['currentIsHome'] == false){
        //     $isHomeAction = 'Không hiển thị';
        //     $isHomeNextAction   = "Hiển thị";
        // }

        //return redirect()->route('article')->with('zvn_notily','Trạng thái ID = '.$params['id'].' với trạng thái "'.$isHomeAction.'" đã được thay đổi thành trạng thái "'.$isHomeNextAction.'" !');
    }

    public function ordering(Request $request){
        $params['id']       = $request->id;
        $params['ordering']    = $request->ordering;

        $return = $this->model->saveItem($params,['task' => 'change-ordering']);
        echo json_encode($return);
    }
}

// php artisan make:model CategoryModel
