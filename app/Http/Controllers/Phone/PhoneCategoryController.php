<?php

namespace App\Http\Controllers\Phone;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;

use App\Models\ProductModel;
use App\Models\CategoryProductModel;
use App\Models\AttributevalueModel;
use App\Models\ProductAttributePriceModel;
use App\Models\MediaModel;

class PhoneCategoryController extends Controller
{
    private $pathViewController  = 'phone.pages.phoneCategory.';
    private $controllerName      = 'phoneCategory';
    private $params              = [];
    private $model;

    public function __construct()
    {
        View::share('controllerName',$this->controllerName);
    }

    public function index(Request $request)
    {

        $nameBreadcrumb = 'Tất cả các loại điện thoại';
        $this->params['category_product_id'] = $request->id;

        $productModel = new ProductModel();
        $items        = $productModel->getItem($this->params,['task'=>'get-all-items-with-category-id']);

        //dd($items);
        //dd(request()->id);
        //dd(session()->all());

        return view($this->pathViewController . 'index',[
            'items'             => $items,
            'nameBreadcrumb'    => $nameBreadcrumb
        ]);
    }

}

