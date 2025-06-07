<?php

namespace App\Http\Controllers\Phone;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use App\Models\SliderPhoneModel;
use App\Models\ProductModel;
use App\Models\CategoryProductModel;

class PhoneHomeController extends Controller
{
    private $pathViewController  = 'phone.pages.home.';
    private $controllerName      = 'phone';
    private $params              = [];
    private $model;

    public function __construct()
    {
        View::share('controllerName',$this->controllerName);
    }

    public function index(Request $request)
    {
        $title  = 'Phone';
        $params = [];

        $sliderPhoneModel       = new SliderPhoneModel();
        $sliders                = $sliderPhoneModel->getItem(null,['task'=>'get-item-take-three']);
        $productModel           = new ProductModel();
        $itemsFeature           = $productModel->getItem(null,['task'=> 'get-many-items-with-price-attribute']);
        $categoryProductModel   = new CategoryProductModel();
        $categoryIsHome         = $categoryProductModel->getItem(null,['task'=>'get-items-home']);
        //dd($categoryIsHome);

        return view($this->pathViewController . 'index',[
            'title'         => $title,
            'params'        => $params,
            'sliders'       => $sliders,
            'itemsFeature'  => $itemsFeature
        ]);
    }

}

