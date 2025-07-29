<?php

namespace App\Http\Controllers\Phone;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use App\Models\UserModel;
use App\Http\Requests\AuthRequest as MainRequest;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Auth;

use App\Models\ProductModel as ProductMode;
use App\Models\ProductAttributePriceModel as ProductAttributePriceMode;
use App\Models\MediaModel as MediaModel;


class AuthsphoneController extends Controller
{
    private $pathViewController  = 'phone.pages.authsphone.';
    private $controllerName      = 'authsphone';
    private $params              = [];
    private $model;

    public function __construct()
    {
      View::share('controllerName',$this->controllerName);
    }

    public function login(Request $request)
    {
        $previousUrl = url()->previous();   // Đây là "URL trước đó"
        $currentUrl = $request->url();      // Đây là  "URL đăng nhập"

        // Kiểm tra nếu "URL trước đó" không phải là URL đăng nhập, nếu nó không phải url đăng nhập thì ghi vào intended
        if (strpos($previousUrl, $currentUrl) === false) {
            Session::put('url.intended', $previousUrl);
        }

        return view($this->pathViewController . 'index');
    }

    public function postLogin(MainRequest $request)
    {
        //dd('postLogin');
        if($request->method() == 'POST'){

            $params = $request->all();
            $userModel  = new UserModel();
            $userInfo   = $userModel->getItem($params,['task'=>'auth-login']);
            //User Lấy quyền từ Role
            $roleHasPermission  = $userModel->getItem($userInfo,['task'=>'role-has-permission']);
            $userInfo['has_permission'] = $roleHasPermission;
            //User lấy quyền từ gán trực tiếp
            $modelHasPermission  = $userModel->getItem($userInfo,['task'=>'model-has-permission']);
            $userInfo['has_permission'] = $userInfo['has_permission'] + $modelHasPermission;

            // Dùng Collection để loại bỏ phần tử trùng giữa RoleHasPermission và ModelHasPermission
            $userInfo['has_permission'] = collect($userInfo['has_permission'])->unique(function ($item) {
                return $item['permission_id'] . '-' . $item['permission_name'];
            })->values()->toArray();
            //end Collection

            if(!$userInfo) return redirect()->route($this->controllerName . '/login')->with('news_notily','Tài khoảng hoặc mật khẩu không chính xác!');

            $request->session()->put('userInfo', $userInfo);
            $user   = $userModel::find($userInfo['id']);
            Auth::login($user); //Bổ xung thêm đăng nhập vào Auth

            //dd(session()->all(),route('phoneHome'));

            //Kiểm tra "URL trước đó" trong session
            if (isset(Session::get('url')['intended'])) {
                // Tiến đến "url trước đó" khi đăng nhập
                return redirect()->intended(Session::get('url')['intended']);
            }

            return redirect()->route('phoneHome');
        }
    }

    public function logout(Request $request)
    {
        $request->session()->pull('userInfo');
        Auth::logout(); //Đăng xuất user khỏi Auth
        return redirect()->route('phoneHome');
    }

    public function addToCart(Request $request)
    {
        $params         = [];
        $productId      = $params['id']             = $request->itemID;
        $colorId        = $params['color-id']       = $request->colorID;
        $materialId     = $params['material-id']    = $request->materialID;
        $productName    = $request->name;

        //Lấy giá sản phẩm.
        $productAttributePriceMode = new ProductAttributePriceMode();
        $price = $productAttributePriceMode->getItem($params,['task' => 'get-price-item']);
        $price = $price['price'];
        if($price == null){
            return 'false';
        }

        //Lấy price_discount (giảm giá):
        $productModel   = new ProductMode();
        $product        = $productModel->getItem($params,['task'=>'get-item']);

        if($product->price_discount_type == 'percent'){
            $price      = $price - ($price * $product->price_discount_percent)/100;
        } else{
            $price      = $price - $product->price_discount_value;
        }

        //Lấy ảnh
        $mediaModel     = new MediaModel();
        $contentMedia   = $mediaModel->getItem($params,['task' => 'get-image-with-color-id']);
        $contentMedia   = ($contentMedia) ? json_decode($contentMedia->content) : '';
        $thumb          = ($contentMedia) ? ($contentMedia->name) : '';

        $cart = session()->get('cart', []);
        $uniqueKey = $productId . '-' . $colorId . '-' . $materialId;

        if (isset($cart[$uniqueKey])) {
            // Nếu sản phẩm đã tồn tại thì cộng số lượng
            $cart[$uniqueKey]['quantity']    = $cart[$uniqueKey]['quantity'] + 1;
            $cart[$uniqueKey]['totalPrice']  = $cart[$uniqueKey]['price'] * $cart[$uniqueKey]['quantity'];
        } else {
            // Nếu chưa có thì thêm mới
            $cart[$uniqueKey] = [
                'product_id'   => $productId,
                'color_id'     => $colorId,
                'material_id'  => $materialId,
                'price'        => $price,
                'totalPrice'   => $price,
                'quantity'     => 1,
                'name'         => $productName,
                'thumb'        => $thumb,
            ];
        }

        session(['cart' => $cart]);
        return 'true';
    }

    public function removeCart(){
        session()->forget('cart');
    }

    public function cart(Request $request){

        $cart = [];
        if(session()->get('cart')){
            $cart = session()->get('cart', []);
        }
        return view($this->pathViewController . 'cart',[
            'cart' => $cart
        ]);
    }

    public function buy(Request $request){

        $cart = [];
        if(session()->get('cart')){
            $cart = session()->get('cart', []);
        }
        return view($this->pathViewController . 'buy',[ //Đặt tên file view là buy.blade.php
            'cart' => $cart
        ]);
    }
}

