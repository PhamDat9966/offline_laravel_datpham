<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use App\Models\ProductAttributePriceModel as MainModel;
use App\Http\Requests\ProductAttributePriceRequest as MainRequest;

use App\Http\Controllers\Admin\AdminController;
use App\Models\AttributeModel;
use App\Models\AttributevalueModel;

use Illuminate\Support\Facades\File;

class  ProductAttributePriceController extends AdminController
{
    public function __construct()
    {
        $this->pathViewController   = 'admin.pages.productAttributePrice.';
        $this->controllerName       = 'productAttributePrice';
        //$this->srcMedia             = asset("images/$this->controllerName");
        $this->model  = new MainModel();
        View::share('controllerName',$this->controllerName);
        parent::__construct();
    }

    public function index(Request $request) //index trèn thêm dữ liệu
    {
        // Gọi method index của AdminController
        $response = parent::index($request);

        // Lấy dữ liệu từ response của AdminController
        $data = $response->getData();
        $attributeValueModel = new AttributevalueModel();
        $color      = $attributeValueModel->getItem(null, ['task'=>'get-color']);
        $material   = $attributeValueModel->getItem(null, ['task'=>'get-material']);
        $data['colorList']      = $color;
        $data['materialList']   = $material;
        // Trả về response mới
        return view($this->pathViewController . 'index', (array)$data);
    }

    public function save(MainRequest $request) // MainRequest là đối tượng $request có validate
    {

        if($request->method() == 'POST'){

            $params = $request->all();  // Lấy param từ request chi dung voi POST

            $task   = 'add-item';
            $notify = 'Thêm phần tử thành công!';

            /* Sử lý ảnh tại dropzone */
            $thumbNames     = $request->input('thumb.name');        // Mảng chứa tên file từ form
            $imagePath      = public_path('images/product');       // Đường dẫn thư mục chứa ảnh
            $updatedNames   = [];
            if($thumbNames){                                   // Mảng lưu tên file mới
                foreach($thumbNames  as $tempName){
                    // Loại bỏ tiền tố 'temp_'
                    $newName = str_replace('temp_', '', $tempName);

                    // Đường dẫn file cũ và mới, ở đây khi đổi tên file sử dụng hàm `move`nên ta vẫn phải thiết lập đường dẫn để đổi tên
                    $oldFilePath = $imagePath . '/' . $tempName;
                    $newFilePath = $imagePath . '/' . $newName;

                    if (File::exists($oldFilePath)) {
                        // Đổi tên file
                        File::move($oldFilePath, $newFilePath);
                    }
                }
            }
            /* End Sử lý ảnh tại dropzone */

            if($params['id'] !== null){
                $task = 'edit-item';
                $notify   = 'Cập nhật thành công!';
            }

            $this->model->saveItem($params,['task'=>$task]);
            return redirect()->route($this->controllerName)->with('zvn_notily', $notify);
        }
    }

    public function ordering(Request $request){

        $params['id']       = $request->id;
        $params['ordering']    = $request->ordering;

        $this->model->saveItem($params,['task' => 'change-ordering']);
        echo "Cập nhật menu thành công";
    }

    public function price(Request $request){

        $params['id']       = $request->id;
        $params['price']    = $request->price;

        $this->model->saveItem($params,['task' => 'change-price']);
        echo "Cập nhật menu thành công";
    }

    public function default(Request $request){

        $params['id']       = $request->id;
        $params['default']    = $request->default;

        $this->model->saveItem($params,['task' => 'change-default']);
        echo "Cập nhật menu thành công";
    }

}

