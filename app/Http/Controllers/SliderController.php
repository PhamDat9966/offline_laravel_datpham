<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use App\Models\SliderModel as MainModel;
use App\Http\Requests\SliderRequest as MainRequest;

class SliderController extends Controller
{
    private $pathViewController  = 'admin.pages.slider.';
    private $controllerName      = 'slider';
    private $params              = [];
    private $model;

    public function __construct()
    {
      $this->model  = new MainModel();
      $this->params['pagination']['totalItemsPerPage']  = 3;
      // share bien $controllerName cho all view
      View::share('controllerName',$this->controllerName);
    }

    public function index(Request $request)// Ở Laravel, request sẽ lấy trực tiếp thông tin từ client chuyền về server, ở đây tiêu biểu là lấy $_GET và $_POST
    {

        $this->params['filter']['status']   = $request->input('filter_status','all'); // $request->input() là do laravel định nghĩa, tương đương với $_GET
        $this->params['search']['field']    = $request->input('search_field','');
        $this->params['search']['value']    = $request->input('search_value','');

        $items              = $this->model->listItems($this->params,['task' => "admin-list-items"]);
        $itemsStatusCount   = $this->model->countItems($this->params,['task' => "admin-count-items-group-by-status"]);

        // foreach($items as $key=>$item){ // Nếu dùng foreach trong Laravel thì nên echo $key và $value trong vòng lặp để nó xuất hiện dữ liệu

        //     echo "<h3 style='color:blue'>".$key."</h3>";
        //     echo "<h3 style='color:red'>".$item."</h3>";
        // }

        return view($this->pathViewController . 'index',[
             'params'               => $this->params,
             'items'                => $items,
             'itemsStatusCount'     => $itemsStatusCount
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
            'item'=>$item
        ]);
    }

    public function status(Request $request)
    {
        // request->route->parameters
        // $router = $request->route();
        // echo "<pre>Parameters";
        // print_r($router->parameters);
        // echo "</pre>";

        $params['currentStatus']    = $request->status;
        $params['id']               = $request->id;

        // Update
        //$status  = ($params['currentStatus'] == 'active') ? 'inactive' : 'active';
        // MainModel::where('id', $params['id'])
        //           ->update(['status' => $status]);

        $this->model->saveItem($params,['task' => 'change-status']);
        // End Update

        $statusAction       = "đã được kích hoạt";
        $statusNextAction   = "chưa kích hoạt";
        if($params['currentStatus'] == 'inactive'){
            $statusAction = 'chưa kích hoạt';
            $statusNextAction   = "đã được kích hoạt";
        }
        return redirect()->route('slider')->with('zvn_notily','Trạng thái ID = '.$params['id'].' với trạng thái "'.$statusAction.'" đã được thay đổi thành trạng thái "'.$statusNextAction.'" !');
    }
    public function delete(Request $request)
    {
        $params['id']               = $request->id;
        //$this->model->deleteItem($params,['task' => 'delete-item']);
        return redirect()->route('slider')->with('zvn_notily','Phần tử ID = ' .$params['id'] .' đã được xóa!');
    }

    public function save(MainRequest $request)
    {
       echo '<pre>';
       print_r($_POST);
       echo '</pre>';
       //$params['id']               = $request->id;
    //    $validatedData = $request->validate([
    //         'name'          => 'required|min:3',           //'title' => 'required|unique:posts|max:255',
    //         'description'   => 'required',
    //         'link'          => 'bail|required|min:5|url',
    //     ]);
        echo "<h3 style='color:red'>".'THIS WAS VALIDATED'."</h3>";
        //return redirect()->route('slider')->with('zvn_notily','Phần tử ID = ' .$params['id'] .' đã được xóa!');
    }

}

// php artisan make:model SliderModel
