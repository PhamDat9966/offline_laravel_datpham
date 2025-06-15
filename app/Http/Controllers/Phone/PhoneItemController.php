<?php

namespace App\Http\Controllers\Phone;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use App\Models\SliderPhoneModel;
use App\Models\ProductModel;
use App\Models\CategoryProductModel;

class PhoneItemController extends Controller
{
    private $pathViewController  = 'phone.pages.phoneItem.';
    private $controllerName      = 'phoneItem';
    private $params              = [];
    private $model;

    public function __construct()
    {
        View::share('controllerName',$this->controllerName);
    }

    public function index(Request $request)
    {
        $this->params['id'] = $request->id;

        $productModel   = new ProductModel();
        $item           = $productModel->getItem($this->params,['task'=>'get-item-all-relationship']);
        //dd($item->toArray());

        return view($this->pathViewController . 'index',[
            'item'  => $item->toArray()
        ]);
    }

}

