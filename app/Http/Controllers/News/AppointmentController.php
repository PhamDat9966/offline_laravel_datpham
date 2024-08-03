<?php

namespace App\Http\Controllers\News;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\File; // Import thư viện File
use App\Http\Requests\AppointmentRequest as MainRequest;
use App\Models\BranchModel as BranchModel;
use App\Models\AppointmentModel as MainModel;

class AppointmentController extends Controller
{
    private $pathViewController  = 'news.pages.appointment.';
    private $controllerName      = 'appointment';
    private $params              = [];
    private $model;

    public function __construct()
    {
        // share biến $controllerName cho tất cả view
        View::share('controllerName', $this->controllerName);
        $this->model = new MainModel();
        $this->params["pagination"]["totalItemsPerPage"] = 5;
    }

    public function index(Request $request)
    {
        view()->share('title', 'Đặt lịch hẹn');
        $branch     = new BranchModel();
        $branchList = $branch->getItem(null,['task'=>'get-all-item']);

        return view($this->pathViewController . 'index',[
            'branch' => $branchList
        ]);
    }

    //public function save(Request $request) // MainRequest là đối tượng $request có validate
    public function save(MainRequest $request) // MainRequest là đối tượng $request có validate
    {
        //dd($request->all());
        if($request->method() == 'GET'){

            $params = $request->all();  // Lấy param từ request chi dung voi POST
            $task   = 'add-item';
            $notify = 'Đặt lịch hẹn thành công! Cám ơn bạn đã ghi đầy đủ thông tin, chúng tôi sẽ liên hệ sau.';

            if($params['id'] !== null){
                $task = 'edit-item';
                $notify   = 'Cập nhật thành công!';
            }
            $this->model->saveItem($params,['task'=>$task]);
            return redirect()->route($this->controllerName)->with('zvn_notily', $notify);
        }
    }
}
