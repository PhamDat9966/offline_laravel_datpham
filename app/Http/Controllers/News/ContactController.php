<?php

namespace App\Http\Controllers\News;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\File; // Import thư viện File
use App\Http\Requests\ContactRequest as MainRequest;
use App\Models\BranchModel as BranchModel;
use App\Models\AppointmentModel as MainModel;
use App\Mail\MailService;

class ContactController extends Controller
{
    private $pathViewController  = 'news.pages.contact.';
    private $controllerName      = 'contact';
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
        view()->share('title', 'Liên hệ');
        $params = $request->all();
      //  dd($params);
        $branch     = new BranchModel();
        $branchList = $branch->getItem(null,['task'=>'get-all-item']);
        $itemGooglemap = [];

        if(isset($params['filter_googlemap']) && !empty($params['filter_googlemap'])){
            $itemGooglemap = $branch->getItem($params,['task'=>'get-item-googlemap-with-id']);
        }

        //dd($itemGooglemap);

        return view($this->pathViewController . 'index',[
            'branch' => $branchList,
            'itemGooglemap'=>$itemGooglemap
        ]);
    }

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

    public function postContact(MainRequest $request){
        //dd($request->all());
        $data = [
            'name'      => $request->name,
            'email'     => $request->email,
            'phone'     => $request->phone,
            'message'   => $request->message
        ];

        $mailService   =   new MailService();
        $mailService->sendContactConform($data);
        $mailService->sendContactInfo($data);
        return redirect()->route($this->controllerName)->with('news_notify','Cám ơn bạn đã gửi thông tin liên hệ với chúng tôi, chúng tôi sẽ phản hồi cho bạn trong thời gian sớm nhất');
        dd($mail);
    }
}
