<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use App\Models\ProductModel as MainModel;
use App\Models\CategoryProductModel;
use App\Http\Requests\ProductRequest as MainRequest;

use App\Http\Controllers\Admin\AdminController;
use App\Models\AttributeModel;
use App\Models\AttributevalueModel;

use Illuminate\Support\Facades\File;

class ProductController extends AdminController
{
    public function __construct()
    {
        $this->pathViewController   = 'admin.pages.product.';
        $this->controllerName       = 'product';
        $this->model  = new MainModel();
        View::share('controllerName',$this->controllerName);
        parent::__construct();
    }

    public function index(Request $request) //index trèn thêm dữ liệu
    {
        // Gọi method index của AdminController
        $response = parent::index($request);

        $this->params['filter']['category']   = $request->input('filter_category','all');
        $this->params['filter']['type']       = $request->input('filter_type','all');

        // Thêm nội dung mới của ProductController
        $categoryModel  = new CategoryProductModel();
        //$categoryList   = $categoryModel->listItems(null, ['task' => 'category-list']);
        // $firstItem      = ['id' => 'all', 'name' => 'Tất Cả'];
        // $categoryList   = array('all' => $firstItem) + $categoryList;

        $categoryList   = $categoryModel->listItems(null, ['task' => 'admin-list-items-in-select-box']);
        unset($categoryList[1]); // Xóa phần tử root
        $categoryList = ['all' => 'Tất cả'] + $categoryList; // Thêm phần tử có key = 'all' và value = 'Tất cả' vào đầu mảng

        // Lấy dữ liệu từ response của AdminController
        $data = $response->getData(); //$data ở đây bao gồm cả 'params','items', 'itemsStatusCount'

        // Thêm dữ liệu mới vào dữ liệu từ AdminController
        $data['categoryList'] = $categoryList;

        // Trả về response mới
        return view($this->pathViewController . 'index', (array)$data);
    }

    public function save(MainRequest $request) // MainRequest là đối tượng $request có validate
    {
        // dd($request->all());
        if($request->method() == 'POST'){

            $params = $request->all();  // Lấy param từ request chi dung voi POST
            $task   = 'add-item';
            $notify = 'Thêm phần tử thành công!';

            /* Sử lý ảnh tại dropzone */
            $thumbNames     = $request->input('thumb.name');        // Mảng chứa tên file từ form
            $imagePath      = public_path('images/product');       // Đường dẫn thư mục chứa ảnh
            $updatedNames   = [];                                        // Mảng lưu tên file mới
            foreach($thumbNames  as $tempName){
                // Loại bỏ tiền tố 'temp_'
                $newName = str_replace('temp_', '', $tempName);

                // Đường dẫn file cũ và mới, ở đây khi đổi tên file sử dụng hàm `move`nên ta vẫn phải thiết lập đường dẫn để đổi tên
                $oldFilePath = $imagePath . '/' . $tempName;
                $newFilePath = $imagePath . '/' . $newName;

                if (File::exists($oldFilePath)) {
                    // Đổi tên file
                    File::move($oldFilePath, $newFilePath);
                    $updatedNames[] = $newName; // Lưu lại tên file mới
                }
            }
            dd($updatedNames);
            /* End Sử lý ảnh tại dropzone */

            if($params['id'] !== null){
                $task = 'edit-item';
                $notify   = 'Cập nhật thành công!';
            }

            $this->model->saveItem($params,['task'=>$task]);
            return redirect()->route($this->controllerName)->with('zvn_notily', $notify);
        }
    }

    public function form(Request $request)
    {

        $item   = null;
        $autoIncrement = $this->model->getItem(null,['task'=>'get-auto-increment']);
        $autoIncrement = $autoIncrement[0]->AUTO_INCREMENT;

        $attributeModel         = new AttributeModel();
        $attributesWithValue    = $attributeModel->getItem( null , ['task'=>'get-attributes-with-attributevalues']);

        $item_has_attribute_ids = [];   // Mảng chưa id của thuộc tính sản phẩm

        if($request->id !== null){
            $params['id']   = $request->id;
            $autoIncrement  = $params['id'];
             // Trong trường hợp edit thì autoIncrement sẽ không tạo mới, autoIncrement = id hiện có,
             // tránh lỗi khi lấy dữ liệu $this->model->getItem($params,['task'=>'get-item']); trong trường hợp copy paste để sửa lại slug
            $item = $this->model->getItem($params,['task'=>'get-item']);

            if($item['attributes']){
                foreach($item['attributes'] as $itemAttribute){
                    $item_has_attribute_ids[] = $itemAttribute['attribute_value_id'];
                }
            }
        }

        $categoryModel      = new CategoryProductModel();
        $itemsCategory      = $categoryModel->listItems(null,["task"=>'admin-list-items-in-select-box']);
        unset($itemsCategory[1]); // Xóa phần tử root
        $itemsCategory = ['all' => 'Tất cả'] + $itemsCategory;

        return view($this->pathViewController . 'form', [
            'item'                      =>$item,
            'item_has_attribute_ids'    =>$item_has_attribute_ids,
            'itemsCategory'             =>$itemsCategory,
            'autoIncrement'             =>$autoIncrement,
            'attributesWithValue'       =>$attributesWithValue
        ]);
    }

    public function changeCategory(Request $request)
    {
        $params["category_id"]      = $request->category_id;
        $params["id"]               = $request->id;

        $this->model->saveItem($params, ['task' => 'change-category']);

        return response()->json([
            'status' => 'success'
        ]);
    }

    public function media(Request $request){

        if ($request->hasFile('file')) {
            $path = public_path('images/product');

            if(!file_exists($path)) mkdir($path,0777, true);
            $file = $request->file('file');
            $name = $this->model->uploadTempDropzoneThumb($file); //thêm tiền tố temp_ vào tên file khi upload

            return response()->json([
                'name'              => $name,
                'original_name'     => $file->getClientOriginalName(),
            ]);
        }

        return response()->json(['error' => 'Không có file được tải lên'], 400);
    }

    public function deleteMedia(Request $request){

        $fileName = $request->input('fileName'); // Lấy tên file từ yêu cầu
        $filePath = public_path('images/product/' . $fileName); // Đường dẫn đến file

        if (file_exists($filePath)) {
            unlink($filePath); // Xóa file
            return response()->json(['success' => 'File đã được xóa']);
        }

        return response()->json(['error' => 'File không tồn tại']);

    }

    public function cleanupTemporaryFiles()
    {
        /* Dọn Dẹp File thông qua Sự Kiện Form */
        $tempPath = public_path('images/product');

        // Lấy danh sách file có tiền tố 'temp_'
        $files = File::files($tempPath);
        foreach ($files as $file) {
            if (str_starts_with($file->getFilename(), 'temp_')) {
                File::delete($file->getPathname()); // Xóa file tạm
            }
        }

        return response()->json(['success' => 'File tạm đã được dọn dẹp']);
    }
}

