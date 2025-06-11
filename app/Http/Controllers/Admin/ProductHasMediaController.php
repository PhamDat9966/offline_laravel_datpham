<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use App\Models\ProductHasMediaModel as MainModel;
use App\Models\ProductModel;

use App\Http\Controllers\Admin\AdminController;
use Illuminate\Support\Facades\File;

class ProductHasMediaController extends AdminController
{
    public function __construct()
    {
        $this->pathViewController   = 'admin.pages.productHasMedia.';
        $this->controllerName       = 'productHasMedia';
        //$this->srcMedia             = asset("images/$this->controllerName");
        $this->model  = new MainModel();
        View::share('controllerName',$this->controllerName);
        parent::__construct();
    }

    public function index(Request $request) //index trèn thêm dữ liệu
    {
        // Gọi method index của AdminController
        $response = parent::index($request);

        // $this->params['filter']['category']   = $request->input('filter_category','all');
        // $this->params['filter']['type']       = $request->input('filter_type','all');

        // Lấy dữ liệu từ response của AdminController
        $data = $response->getData(); //$data ở đây bao gồm cả 'params','items', 'itemsStatusCount'
        $items = (array)$data['items']->toArray();
        $items = $items['data'];
        $productModel = new ProductModel();

        foreach($items as $key=>$item){
            $params['product_id'] = $item['product_id'];
            $productHasAttributes     = $productModel->getItem($params,['task'=>'get-attribute-items-list']);
            //Ghép các thuộc tính liên quan đến sản phẩm vào media item
            $items[$key]['productHasAttributes'] = $productHasAttributes[0]['attributes'];
        }
        $data['itemsHasAttributes'] = $items;
        return view($this->pathViewController . 'index', [
            'params'                => $data['params'],
            'items'                 => $data['items'],
            'itemsStatusCount'      => $data['itemsStatusCount'],
            'itemsHasAttributes'    => $data['itemsHasAttributes'] //Sử dụng nó như một biến độc lập để truy vấn danh sách.
        ]);

        //return view($this->pathViewController . 'index', (array)$data);
    }

}

