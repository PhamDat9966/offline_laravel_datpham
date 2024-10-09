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
        // Tạo nhóm giá trị trả về theo thuộc tính - attribute
        $params         = $request->all();
        $notify         = '';
        $paramsGroup    = [];
        $attributeModel = new AttributeModel();
        $attributekeys      = $attributeModel->getItem(null, ['task' => 'get-items-name']);
        unset($params['_token']);
        $paramsIDs = [];

        //dd($params);

        foreach($attributekeys as $id){
            $paramsIDs['attributeId'][] = $id['id'];
        }

        foreach ($attributekeys as $keyvalue) {
            if (isset($params[$keyvalue['name']])) {
                $paramsGroup[$keyvalue['id']] = [
                    $keyvalue['name']            => $params[$keyvalue['name']],
                    $keyvalue['name'] . '_ids'   => $params[$keyvalue['name'] . '_ids'] ?? null,
                    $keyvalue['name'] . '_add'   => $params[$keyvalue['name'] . '_add'] ?? null
                ];
            }
        }

        //dd($paramsGroup);

        // Duyệt nhóm input theo từng trường hợp
        // Đếm số phần tử attributevalue theo các ids của attribute
        $totalAttributeValueIDs = $this->model->getItem($paramsIDs, ['task' => 'get-all-count-items']);

        //Tác vụ thêm mới, xóa tags ... Trọng tâm được xử lý qua $paramsGroup
        foreach ($paramsGroup as $idAttribute => $inputsValue) {
            $nameAttribute  = key($inputsValue); // Tại đây nó sẽ trả về truỗi: `color`, `slogan` hoặc `material`....

            $arrayInputID   = explode(',', $inputsValue[$nameAttribute . '_ids']);
            $countInputAttrValueID = count($arrayInputID);

            // Delete items theo tags input: ví dụ các input-color_ids,slogan_ids...
            foreach($totalAttributeValueIDs as $totalAttributeValueID){
                if($idAttribute == $totalAttributeValueID['attribute_id']){
                    if($totalAttributeValueID['total'] > $countInputAttrValueID){
                        $params['attribute_id']         = $totalAttributeValueID['attribute_id'];
                        $params['attributevalue_ids']   = $arrayInputID;

                        $this->model->deleteItem($params, ['task' => 'delete-items']);
                        $notify = 'Đã xóa các tag thành công!';
                    }
                }
            }

            // Add new items theo tags input: ví dụ color_add, slogan_add, material...;
            if($inputsValue[ $nameAttribute . '_add'] != null){
                $params['names']         = explode('|', $inputsValue[$nameAttribute . '_add']);
                $params['attribute_id'] = $idAttribute;
                $this->model->saveItem($params,['task'=>'add-item']);
                $notify = 'Đã thêm các tags mới thành công!';
            }
        }

        return redirect()->route($this->controllerName)->with("zvn_notify", $notify);
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
