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
        parent::__construct();
        $this->params['pagination']['totalItemsPerPage']  = 999;
        $this->pathViewController   = 'admin.pages.productAttributePrice.';
        $this->controllerName       = 'productAttributePrice';
        //$this->srcMedia             = asset("images/$this->controllerName");
        $this->model  = new MainModel();
        View::share('controllerName',$this->controllerName);
        //parent::__construct();
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

        //dd($data);

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

    public function updateOrdering(Request $request){

        $params['ids']          = $request->ids;
        $params['orderings']    = $request->orderings;

        // $params['filter']['color']        = $request->input('filter_color','all');
        // $params['filter']['material']     = $request->input('filter_material','all');
        // $params['search']['field']    = $request->input('search_field','product_name');
        // $params['search']['value']    = $request->input('search_value','all');

        $params['filter']['color']        = $request->filter_color;
        $params['filter']['material']     = $request->filter_material;

        $params['search']['value']    = $request->search_value;
        $params['search']['field']    = $request->search_field;

        $params['ids_ordering']        = array_combine($params['ids']  , $params['orderings']);

        // Sắp xếp lại mảng $idsOrdering theo value tăng dần nhưng vẫn giữ lại thứ tự key:
        // Lấy danh sách value và sắp xếp tăng dần
        $values = array_values($params['ids_ordering']);
        sort($values); // Sắp xếp giá trị tăng dần

        // Gán lại giá trị vào mảng ban đầu
        $i = 0;
        foreach ($params['ids_ordering'] as $key => &$value) {
            $value = $values[$i++];
        }

        $this->model->saveItem($params,['task' => 'update-ordering']);

        return response()->json([
            'params'            => $params,
            'orderingsPosition' => $params['ids_ordering'],
            'messege'           => 'update ordering comlete',
        ]);
    }

    public function arrangeOrdering(Request $request){
        //Sắp xếp lại ordering thành 1,2,3... Theo trình tự tăng dần và theo nhóm id. Ví dụ: samsung là 1,2,3,4 iphone 5,6,7,8...
        $data = $this->model->getItem(null,['task'=>'get-all-item-array']);

        // Bước 1: Nhóm dữ liệu theo product_id. Ví dụ: samsung s24 id=27 là một nhóm, iphone 15 id=28 là một nhóm
        $groupedData = [];
        foreach ($data as $row) {
            $groupedData[$row['product_id']][] = $row;
        }

        // Bước 2: Sắp xếp lại từng nhóm và cập nhật ordering mới
        $ordering = 1;
        $sortedData = []; //Mảng lưu lại kết quả sắp xếp.
        foreach ($groupedData as $group) {
            /* Sắp xếp nhóm theo ordering cũ
                Hàm ẩn danh (function ($a, $b) {...}): Là hàm so sánh dùng để xác định thứ tự sắp xếp.
                Dùng $groupA['ordering'] <=> $groupB['ordering'] để sắp xếp tăng dần.
                Dùng $groupB['ordering'] <=> $groupA['ordering'] để sắp xếp giảm dần.
                Với bước usort này có thể bỏ qua nếu không quan tâm đến thứ tự ban đầu của ordering
            */
            usort($group, function ($groupA, $groupB) {
                return $groupA['ordering'] <=> $groupB['ordering'];
            });

            // Sau khi đã sắp xếp thứ tự tăng dần theo ordering của từng nhóm id.
            // tiếp theo là cập nhật lại ordering mới có tính liên tục: samsung s24: 1,2,3,4 .iphone 15: 5,6,7...
            foreach ($group as $key => $item) {
                $item['ordering'] = $ordering++;
                $sortedData[] = $item;
            }
        }

        //Cập nhật lại ordering tại bản:
        $params['data'] = $sortedData;
        $this->model->saveItem($params,['task'=>'update-ordering-to-array']);

        return redirect()->route($this->controllerName);
    }

    // public function arrangeOrdering(Request $request){
    //     //Sắp xếp lại ordering thành 1,2,3... Theo trình tự tăng dần và theo nhóm id. Ví dụ: samsung là 1,2,3,4 iphone 5,6,7,8...
    //     $globalOrdering  = 1;

    //     $products = $this->model::orderBy('product_id')->orderBy('ordering')->get();
    //     dd($products);
    //     foreach ($products->groupBy('product_id') as $group) {
    //         foreach ($group as $record) {
    //             $record->ordering = $globalOrdering;
    //             $record->save();
    //             $globalOrdering++;
    //         }
    //     }

    //     return redirect()->route($this->controllerName);
    // }
}

