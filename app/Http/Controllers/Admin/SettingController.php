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
        $items   = null;

        if($params !== null){
            $params['id']   = $request->id;
            $itemsTemp = $this->model->getItem($params,['task'=>'get-items']);

            foreach($itemsTemp as $value){
                $items[$value['setting_value']] = json_decode($value['value']);
            }
        }
        return view($this->pathViewController . 'index', [
            'items'      =>$items,
            'params'    =>$params
        ]);
    }

    public function getItem(Request $request) //index trèn thêm dữ liệu
    {
        $params = $request->all();
        $items   = null;
        $items = $this->model->getItem($params,['task'=>'get-all-items']);

        return view($this->pathViewController . 'index', [
            'items'      =>$items,
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

//{"logo":"\/images\/logo\/zenvnlogo.JPG","hotline":"123456789","timeword":"24\/24","copyright":"@2020 - B\u1ea3n quy\u1ec1n c\u00f4ng ty l\u1eadp tr\u00ecnh Zendvn","address":"S\u1ed1 01, Kh\u1ed1i A1, To\u00e0 nh\u00e0 \u0110\u1ea1t Gia, 43 \u0110\u01b0\u1eddng C\u00e2y Keo, Tam Ph\u00fa, Th\u1ee7 \u0110\u1ee9c, H\u1ed3 Ch\u00ed Minh","introduction":"C\u00f4ng Ty C\u1ed5 Ph\u1ea7n L\u1eadp Tr\u00ecnh Zend Vi\u1ec7t Nam - M\u00e3 s\u1ed1 thu\u1ebf: 0314390745.\r\nGi\u1ea5y ph\u00e9p \u0111\u0103ng k\u00fd kinh doanh s\u1ed1 0314390745 do S\u1edf K\u1ebf ho\u1ea1ch v\u00e0 \u0110\u1ea7u t\u01b0 Th\u00e0nh ph\u1ed1 H\u1ed3 Ch\u00ed Minh c\u1ea5p ng\u00e0y 09\/05\/2017\r\n","googlemap":"<iframe src=\"https:\/\/www.google.com\/maps\/embed?pb=!1m18!1m12!1m3!1d3918.3604198520575!2d106.73612927408858!3d10.86016745764545!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317527d5640014e7%3A0x3bb323b29d50dca9!2zWmVuZFZOIC0gxJDDoG8gVOG6oW8gTOG6rXAgVHLDrG5oIFZpw6pu!5e0!3m2!1svi!2s!4v1721455847550!5m2!1svi!2s\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"><\/iframe>\r\n"}
