<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\AttributevalueModel as MainModel;
use App\Http\Requests\AttributevalueRequest as MainRequest;
use App\Models\AttributeModel as AttributeModel;
use App\Helpers\Form as Form;

class AttributevalueController extends Controller
{
    private $pathViewController = 'admin.pages.attributevalue.';  // slider
    private $controllerName     = 'attributevalue';
    private $params             = [];
    private $model;

    public function __construct()
    {
        $this->model = new MainModel();
        $this->params["pagination"]["totalItemsPerPage"] = 15;
        view()->share('controllerName', $this->controllerName);
    }

    public function index(Request $request)
    {
        $this->params['filter']['status'] = $request->input('filter_status', 'all');
        $this->params['search']['field']  = $request->input('search_field', ''); // all id description
        $this->params['search']['value']  = $request->input('search_value', '');

        $items              = $this->model->listItems($this->params, ['task'  => 'admin-list-items']);
        $itemsStatusCount   = $this->model->countItems($this->params, ['task' => 'admin-count-items-group-by-status']); // [ ['status', 'count']]

        return view($this->pathViewController .  'index', [
            'params'        => $this->params,
            'items'         => $items,
            'itemsStatusCount' =>  $itemsStatusCount
        ]);
    }

    public function form(Request $request)
    {

        $itemsAttributevalue    = $this->model->getItem(null, ['task' => 'get-all-item']);
        $attributeModel         = new AttributeModel();
        $itemsAttribute         = $attributeModel->listItems(null, ['task' => 'admin-list-items-array']);

        //Mảng json để đồng bộ hóa input attribute và input attribute tại js: attribute.js
        $tagToIdMap = [];
        foreach($itemsAttributevalue as $attributeValue){

            // Chuyển chữ in hoa về chữ thường.
            $attributeValue['name']  = mb_strtolower($attributeValue['name']);
            // Loại bỏ dấu tiếng việt
            $attributeValue['name']  = Form::removeAccents($attributeValue['name']);
            // Chuyển khoảng trắng thành `-`
            if (strpos($attributeValue['name'] , ' ') !== false) {
                $attributeValue['name']  = str_replace(' ', '-', $attributeValue['name'] );
            }
            //Loại ở các dấu gạch `-` ở đầu dòng và cuối dòng
            $attributeValue['name'] = trim($attributeValue['name'] , '-');

            // Ghi vòa map ánh xạ, để thực hiện phép so sánh tại jquery
            $tagToIdMap[$attributeValue['name']] = $attributeValue['id'];
        }

        return view($this->pathViewController .  'form', [
            'itemsAttributevalue'   => $itemsAttributevalue,
            'itemsAttribute'        => $itemsAttribute,
            'tagToIdMap'            => $tagToIdMap
        ]);
    }

    public function save(MainRequest $request)
    {
        dd($request->all());

        if ($request->method() == 'POST') {
            $params = $request->all();

            $task   = "add-item";
            $notify = "Thêm phần tử thành công!";

            if ($params['id'] !== null) {
                $task   = "edit-item";
                $notify = "Cập nhật phần tử thành công!";
            }
            $this->model->saveItem($params, ['task' => $task]);
            return redirect()->route($this->controllerName)->with("zvn_notify", $notify);
        }
    }

    public function status(Request $request)
    {
        $params["currentStatus"]  = $request->status;
        $params["id"]             = $request->id;
        $this->model->saveItem($params, ['task' => 'change-status']);
        $status = $request->status == 'active' ? 'inactive' : 'active';
        $link = route($this->controllerName . '/status', ['status' => $status, 'id' => $request->id]);
        return response()->json([
            'statusObj' => config('zvn.template.status')[$status],
            'link' => $link,
        ]);
    }

    public function type(Request $request)
    {
        $params["currentType"]    = $request->type;
        $params["id"]             = $request->id;
        $this->model->saveItem($params, ['task' => 'change-type']);
        return response()->json([
            'status' => 'success'
        ]);
    }

    public function delete(Request $request)
    {
        $params["id"]             = $request->id;
        $this->model->deleteItem($params, ['task' => 'delete-item']);
        return redirect()->route($this->controllerName)->with('zvn_notify', 'Xóa phần tử thành công!');
    }
}
