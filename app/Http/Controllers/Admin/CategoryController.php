<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use App\Models\CategoryModel as MainModel;
use App\Http\Requests\CategoryRequest as MainRequest;
use Config;
use Illuminate\Support\Facades\DB;

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

        $params['currentIsHome']    = ($params['currentIsHome'] == true) ? false : true;
        $returnModified = $this->model->saveItem($params,['task' => 'change-is-home']);



        $userIcon   = config('zvn.template.font_awesome.user');
        $clockIcon  = config('zvn.template.font_awesome.clock');

        $returnModified['modified_by']  = $userIcon.' '.$returnModified['modified_by'];
        $returnModified['modified']     = $clockIcon.' '.$returnModified['modified'];

        //Class của bootstrap và class khi isHome thay đổi trạng thái sẽ quyết định tại đây
        $isHome = ($params['currentIsHome'] == true) ? 1 : 0;
        $infomationIsHome           =   Config::get('zvn.template.is_home')[$isHome];
        $infomationIsHome['class']  =   'btn btn-round is-home-ajax '. $infomationIsHome['class'];

        $link = route($this->controllerName . '/isHome',['isHome'=>$isHome, 'id'=>$request->id]);

        return response()->json([
            'isHome'        =>  $infomationIsHome,
            'link'          =>  $link,
            'modified'      =>  $returnModified['modified'],
            'modified_by'   =>  $returnModified['modified_by'],
        ]);

    }

    public function form(Request $request)
    {
        $item   = null;

        $autoIncrement = $this->model->getItem(null,['task'=>'get-auto-increment']);
        $autoIncrement = $autoIncrement[0]->AUTO_INCREMENT;

        if($request->id !== null){
            $this->params['id']   = $request->id;
            $item = $this->model->getItem($this->params,['task'=>'get-item']);
        }

        $nodes = $this->model->listItems($this->params, ['task'=>'admin-list-items-in-select-box']);

        $tree  = $this->model->listItems($this->params, ['task'=>'admin-tree']);//test

        return view($this->pathViewController . 'form', [
            'item'          =>$item,
            'autoIncrement' =>$autoIncrement,
            'nodes'         =>$nodes
        ]);
    }
}

// php artisan make:model CategoryModel
