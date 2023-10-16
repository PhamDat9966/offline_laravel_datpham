<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use App\Models\SliderModel as MainModel;

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

        $this->params['filter']['status'] = $request->input('filter_status','all'); // $request->input() là do laravel định nghĩa
        $items              = $this->model->listItems($this->params,['task' => "admin-list-items"]);
        $itemsStatusCount   = $this->model->countItems($this->params,['task' => "admin-count-items-group-by-status"]);

        // echo "<pre>Controllers";
        // print_r($_GET);
        // echo "</pre>";
        // echo "<pre>";
        // print_r($itemsStatusCount);
        // echo "</pre>";

        // foreach($items as $key=>$item){ // Nếu dùng foreach trong Laravel thì nên echo $key và $value trong vòng lặp để nó xuất hiện dữ liệu

        //     echo "<h3 style='color:blue'>".$key."</h3>";
        //     echo "<h3 style='color:red'>".$item."</h3>";
        // }


        return view($this->pathViewController . 'index',[
             'items'                => $items,
             'itemsStatusCount'     => $itemsStatusCount
        ]);
    }

    public function form($id = null)
    {
        $t = 'CategoryController - Form';
        // $param = [
        //             'id'=>$id,
        //             'title'=>$t,
        //             'controllerName'=>$this->controllerName
        // ];

        return view($this->pathViewController . 'form', [
            'id'=>$id,
            'title'=>$t,
        ]);
    }

    public function status(Request $request)
    {
        $id     = $request->route('id');
        $status = $request->route('status');
        echo '<h3 style="color: rgb(28, 9, 196)">URL: '.$request->fullUrl().'</h3>';
        echo '<h3 style="color: rgb(28, 9, 196)">ID: '.$id.'</h3>';
        echo '<h3 style="color: rgb(28, 9, 196)">STATUS: '.$status.'</h3>';

        $router = $request->route();
        echo "<pre>Parameters";
        print_r($router->parameters);
        echo "</pre>";

        // return redirect()->route('slider');
        return redirect()->route('slider/form', ['status' => 'active','id'=>222]);
    }

    public function delete()
    {
        return "SliderController - delete";
    }

}

// php artisan make:model SliderModel
