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

        //Navbar:Lấy các node lá (những node ở xa nhất)
        $categoryProductModel   = new CategoryProductModel();
        $categoryPhones         = $categoryProductModel->getItem(null,['task' => 'get-default-order-with-active']);

        //Lấy url và giá trị cuôi
        $segments = explode('/', request()->path());
        $lastSegment = end($segments);

        //dd($categoryPhones->toArray());
        //dd($items);
        //dd(request()->id);
        //dd(session()->all());

        return view($this->pathViewController . 'index',[
            'items'             => $items,
            'categoryPhones'    => $categoryPhones,
            'nameBreadcrumb'    => $nameBreadcrumb,
            'lastSegment'       => $lastSegment
        ]);
    }

}

