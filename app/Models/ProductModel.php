<?php

namespace App\Models;

use App\Models\AdminModel;
use App\Models\CategoryArticleModel;
use App\Models\ProductHasAttributeModel;    //Model quan hệ

use Illuminate\Support\Str;                 // Hỗ trợ thao tác chuỗi
use Illuminate\Support\Facades\DB;          // DB thao tác trên csdl
use Illuminate\Support\Facades\Storage;     // Dùng để delete image theo location
use Illuminate\Support\Facades\Session;
class ProductModel extends AdminModel
{
    public function __construct(){
        $this->table                = 'product';
        $this->folderUpload         = 'product';
        $this->fieldSearchAccepted  = ['name','content','slug'];
        $this->crudNotActived       = ['_token','thumb_current','taskAdd','taskEditInfo','taskChangeCategory'];
    }

    // Quan hệ với bảng product_has_attribute
    public function attributes()
    {
        $this->table  = 'product';
        return $this->hasMany(ProductHasAttributeModel::class, 'product_id', 'id');
    }

    public function listItems($params = null,$options = null){
        $result = null;
        $this->table    = 'product as p';

        if($options['task'] == 'admin-list-items'){
            $query = $this->select('p.id','p.name','p.description','p.slug','p.status','p.category_product_id');
                        // ->leftJoin('category_article as c', 'a.category_id', '=', 'c.id');

            if($params['filter']['status'] !== "all"){
               $query->where('a.status','=',$params['filter']['status']);

            }

            if($params['filter']['category'] !== "all"){

                // Cách 1: từ $params['filter']['category'] rồi lấy danh sách con, sau đó tạo mảng $categories đưa cha và danh sách con vào rồi whereIn để lọc
                $category        = CategoryArticleModel::find($params['filter']['category']); // Lấy danh mục cha
                $childCategories = CategoryArticleModel::whereBetween('_lft', [$category->_lft + 1, $category->_rgt - 1])
                                                        ->orderBy('_lft')
                                                        ->get()
                                                        ->toArray(); // Danh sách các danh mục con dưới dạng array

                $categories         = [];
                $categories[0]      = (int)$params['filter']['category'];
                foreach($childCategories as $childCategoryValue){
                    $categories[]   = $childCategoryValue['id'];
                }

                // Cách 2: Dùng các phương thức hỗ trợ của Nester set module
                // $categories  = CategoryModel::descendantsAndSelf($params['filter']['category'])
                //             ->pluck('id')
                //             ->toArray();

                $query->whereIn('a.category_id',$categories);
            }

            if($params['filter']['type'] !== "all"){
                $query->where("type","=", $params['filter']['type']);
            }

            if($params['search'] !== ""){

                if($params["search"]["field"] == "all"){

                    $query->where(function ($query) use ($params){
                        foreach ($this->fieldSearchAccepted as $column) {
                            {
                                $query->orWhere('a.'.$column,"like","%".$params["search"]["value"]."%");
                            }
                        }
                    }
                );

                }else if(in_array($params["search"]["field"], $this->fieldSearchAccepted)){
                    $query->where('a.'.$params["search"]["field"],"like","%".$params["search"]["value"]."%");
                    //$query->where($params["search"]["field"],"like","%{$params["search"]["value"]}%");
                }
            }

            $result = $query->orderBy('id', 'desc')
                            ->paginate($params['pagination']['totalItemsPerPage']);
        }

        if($options['task'] == 'news-list-items'){
            $query = $this->select('id','name')
                          ->where('status','=','active')
                          ->limit('8');
            $result = $query->get()->toArray();
        }

        if($options['task'] == 'news-list-items-feature'){
            $query = $this->select('a.id','a.name','a.content','a.slug','a.created','a.category_id','c.name as category_name','a.thumb')
                          ->leftJoin('category_article as c', 'a.category_id', '=', 'c.id')
                          ->where('a.status','=','active')
                          ->where('a.type','feature')
                          ->orderBy('a.id', 'desc')
                          ->take(3);
            $result = $query->get()->toArray();
        }

        if($options['task'] == 'news-list-items-normal'){
            $query = $this->select('a.id','a.name','a.content','a.created','a.category_id','c.name as category_name','a.thumb')
                          ->leftJoin('category_article as c', 'a.category_id', '=', 'c.id')
                          ->where('a.status','=','active')
                          ->orderBy('a.id', 'desc')
                          ->take(3);
            $result = $query->get()->toArray();
        }

        if($options['task'] == 'news-list-items-many-conditions'){
            $query = $this->select('a.id','a.name','a.content','a.slug','a.created','a.category_id','c.name as category_name','a.thumb')
                          ->leftJoin('category_article as c', 'a.category_id', '=', 'c.id')
                          ->where('a.status','=','active')
                          ->orwhere('a.type','feature')
                          ->orderBy('a.type', 'asc')
                          ->orderBy('a.id', 'desc')
                          ->take(3);
            $result = $query->get()->toArray();
        }

        if($options['task'] == 'news-list-items-latest'){
            $query = $this->select('a.id','a.name','a.slug','a.created','a.category_id','c.name as category_name','a.thumb')
                          ->leftJoin('category_article as c', 'a.category_id', '=', 'c.id')
                          ->where('a.status','=','active')
                          ->orderBy('a.id', 'desc')
                          ->take(4);
            $result = $query->get()->toArray();
        }

        if($options['task'] == 'news-list-items-in-category'){
            $query = $this->select('a.id','a.name','a.slug','a.created','a.content','a.created','a.thumb','a.type')
                          ->leftJoin('category_article as c', 'a.category_id', '=', 'c.id')
                          ->where('a.status','=','active')
                          ->where('a.category_id','=',$params['category_id'])
                          ->orderBy('a.id', 'desc')
                          ->take(4);
            $result = $query->get()->toArray();
        }

        if($options['task'] == 'news-list-items-in-category-id-array'){
            $query = $this->select('a.id','a.name','a.slug','a.created','a.content','a.created','a.thumb','a.type')
                          ->leftJoin('category_article as c', 'a.category_id', '=', 'c.id')
                          ->where('a.status','=','active')
                          ->whereIn('a.category_id',$params['category_id'])
                          ->orderBy('a.id', 'desc')
                          ->take(4);
            $result = $query->get()->toArray();
        }

        if($options['task'] == 'new-list-items-related-in-category'){
            $query = $this->select('id','name','created','thumb','content')
                          ->where('category_id','=',$params['category_id'])
                          ->where('id','!=',$params['article_id'])
                          ->where('status','=','active')
                          ->orderBy('id', 'desc')
                          ->take(4);
            $result = $query->get()->toArray();
        }

        if($options['task'] == 'news-list-items-usually-max'){
            $query = $this->select('a.id','a.name','a.content','a.slug','a.created','a.category_id','c.name as category_name','a.thumb')
                          ->leftJoin('category_article as c', 'a.category_id', '=', 'c.id')
                          ->where('a.category_id','=',$params['usually_key_max'])
                          ->where('a.status','=','active')
                          ->latest('a.id')
                          //->inRandomOrder()
                          //->orderBy('a.id', 'desc')
                          ->take(6);
            $result = $query->get()->toArray();
        }

        if($options['task'] == 'news-list-items-navbar-menu'){
            $query = $this->select('id','name','slug')
                          ->where('status','=','active');
            $result = $query->get()->toArray();
        }

        if($options['task'] == 'news-list-items-usually-second-highest'){
            $query = $this->select('a.id','a.name','a.content','a.slug','a.created','a.category_id','c.name as category_name','a.thumb')
                          ->leftJoin('category_article as c', 'a.category_id', '=', 'c.id')
                          ->where('a.category_id','=',$params['usually_key_second_highest'])
                          ->where('a.status','=','active')
                          ->inRandomOrder()
                          ->first();

           // Trường hợp categoryID theo giá trị  $params['usually_key_second_highest'] không có article
           // thì thay đổi ngẫu nhiên một categoryID khác theo danh sách $params['listCategoryID']
           while ($query == null) {
                $randomElement = array_rand($params['listCategoryID']);

                // Đảm bảo không chọn lại categoryID đã kiểm tra
                while ($randomElement == $params['usually_key_second_highest']) {
                    $randomElement = array_rand($params['listCategoryID']);
                }

                $query = $this->select('a.id','a.name','a.content','a.created','a.category_id','c.name as category_name','a.thumb')
                    ->leftJoin('category_article as c', 'a.category_id', '=', 'c.id')
                    ->where('a.category_id', '=', $randomElement)
                    ->where('a.status', '=', 'active')
                    ->inRandomOrder()
                    ->first();
            }

            $result = $query->toArray();
        }

        return $result;
    }

    public function countItems($params = null,$options = null){

        $result = null;

        if($options['task'] == 'admin-count-items-group-by-status'){

            $query  = $this->select(DB::raw('COUNT(id) as count,status'))
                           ->groupBy('status');

                           if($params['filter']['created'] !== null){
                                $query->where('created',"like","%".$params['filter']['created']."%");
                            }

                            if($params['filter']['modified'] !== null){
                                $query->where('modified',"like","%".$params['filter']['modified']."%");
                            }
                            if($params['filter']['category'] !== "all"){
                                $query->where("category_id","=", $params['filter']['category']);
                            }

                            if($params['filter']['type'] !== "all"){
                                $query->where("type","=", $params['filter']['type']);
                            }


                            if($params['search'] !== ""){

                                if($params["search"]["field"] == "all"){

                                    $query->where(function ($query) use ($params){
                                        foreach ($this->fieldSearchAccepted as $column) {
                                            {
                                                $query->orWhere($column,"like","%".$params["search"]["value"]."%");
                                            }
                                        }
                                    }
                                );

                                }else if(in_array($params["search"]["field"], $this->fieldSearchAccepted)){
                                    $query->where($params["search"]["field"],"like","%".$params["search"]["value"]."%");
                                    //$query->where($params["search"]["field"],"like","%{$params["search"]["value"]}%");
                                }
                            }

            $result     = $query->get()
                                ->toArray();
        }

        return $result;
    }

    public function saveItem($params = null,$options = null){

        if (Session::has('userInfo')) {
            $userInfo = Session::get('userInfo');
        } else {
            $userInfo = ['username'=>'admin'];
        }

        $params['modified_by']   = $userInfo['username'];
        $params['modified']      = date('Y-m-d');

        if($options['task'] == 'change-status'){
            $status  = ($params['currentStatus'] == 'active') ? 'inactive' : 'active';
            $this::where('id', $params['id'])
                        ->update(['status' => $status, 'modified'=>$params['modified'],'modified_by'=>$params['modified_by']]);
            $params['modified-return']      = date(config('zvn.format.short_time'),strtotime($params['modified']));
            return array('modified'=>$params['modified-return'],'modified_by'=>$params['modified_by']);
        }

        if($options['task'] == 'change-type'){
            $type  = ($params['currentType'] == 'feature') ? 'feature' : 'normal';
            $this::where('id', $params['id'])
                        ->update(['type' => $type]);
        }

        if($options['task'] == 'change-category'){
            $category_id = $params['category_id'];
            $this::where('id', $params['id'])
                        ->update(['category_id' => $category_id,'modified' => $params['modified'],'modified_by' =>  $params['modified_by']]);
        }

        if($options['task'] == 'change-display'){
            $this::where('id', $params['id'])
                        ->update(['display' => $params['display']]);
        }

        if($options['task'] == 'change-is-home'){
            $isHome  = ($params['currentIsHome'] == true) ? false : true;
            $this::where('id', $params['id'])
                        ->update(['is_home' => $isHome]);
        }

        if($options['task'] == 'add-item'){

            $params['created_by']   = $userInfo['username'];
            $params['created']      = date('Y-m-d');

            /* Save dữ liệu theo eloquent */
            $this->table                = 'product';
            $this->name                 = $params['name'];
            $this->slug                 = $params['slug'];
            $this->description          = $params['description'];
            $this->status               = $params['status'];
            $this->category_product_id  = $params['category_id'];
            $this->created_by           = $params['created_by'];
            $this->created              = $params['created'];
            $this->save();

            //Kiểm tra và lưu các attribute_value vào bảng `product_has_attribute`
            if ($params['attribute_value']) {
                // Mảng chứa dữ liệu cho bảng `product_has_attribute`
                $attributesData = [];

                foreach ($params['attribute_value'] as $attributeValue) {
                    $arrayAttribute     = explode('$',$attributeValue);
                    $attributeValueId   = $arrayAttribute[0];
                    $attributeValueName = $arrayAttribute[1];

                    $attributesData[] = [
                        'product_id'            => $this->id,
                        'attribute_value_id'    => $attributeValueId,
                        'product_name'          => $this->name,
                        'attribute_value_name'  => $attributeValueName
                    ];
                }

                // Lưu nhiều bản ghi vào `product_has_attribute` cùng lúc
                DB::table('product_has_attribute')->insert($attributesData);
            }

        }

        if($options['task'] == 'edit-item'){

            if(!empty($params["thumb"])){
                /*Xóa ảnh cũ*/
                $item   =  $this->getItem($params,['task' => 'get-thumb']);
                //Storage::disk('zvn_storage_image')->delete($this->folderUpload . '/' . $params['thumb_current']);
                $this->deleteThumb($params['thumb_current']);
                /* Thêm ảnh mới */
                // $thumb                  = $params['thumb'];
                // $params['thumb']        = Str::random(10) . '.' . $thumb->clientExtension();
                // $thumb->storeAs($this->folderUpload, $params['thumb'],'zvn_storage_image');
                $params['thumb']        = $this->uploadThumb($params['thumb']);
                /* end Thêm ảnh mới */
            }

            $params['modified_by']   = $userInfo['username'];
            $params['modified']      = date('Y-m-d');

            //$params = array_diff_key($params,array_flip($this->crudNotActived)); // array_diff_key Hàm trả về sự khác nhau về key giữa mảng 1 và 2
            $params   = $this->prepareParams($params);
            self::where('id', $params['id'])->update($params);

        }

    }

    public function deleteItem($params = null,$options = null){
        if($options['task'] == 'delete-item'){

            // $item   =  $this->getItem($params,['task' => 'get-thumb']);
            //Storage::disk('zvn_storage_image')->delete($this->folderUpload . '/' . $item['thumb']);
            // $this->deleteThumb($item['thumb']);

            $this->table = 'product';
            $this->where('id', $params['id'])->delete();
        }
    }

    public function getItem($params = null,$options = null){
        $result   = null;
        if($options['task'] == 'get-item'){

            $this->table  = 'product'; //Gọi table một lần nữa để loại bỏ alias (bí danh)

            // Gọi relationship  từ các liên kết hàm. attributes của ProductModel, attributeValue của ProductHasAttributeModel
            // Ở đây cũng có thể chỉ cần gọi mỗi hàm attributes cũng cho ra kết quả cần truy vấn nhưng nếu gọi cả 2 hàm thì tính liên kết sẽ chặt chẽ hơn.

            $product = self::with('attributes')->find($params['id']);       // Sử dụng khi  product_has_attribute đã có cột attribute_value_name được gán giá trị trước
            //$product = self::with('attributes.attributeValue')->find($params['id']);     // Sử dụng khi cần truy vấn đến bản attribute_value để lấy attribute_value.name

            $result = $product;
        }

        if($options['task'] == 'get-auto-increment'){
            $dataBaseName = DB::connection()->getDatabaseName();
            $result = DB::select("SELECT AUTO_INCREMENT
                                  FROM INFORMATION_SCHEMA.TABLES
                                  WHERE TABLE_SCHEMA = '".$dataBaseName."'
                                  AND TABLE_NAME = 'article'");
        }

        if($options['task'] == 'get-thumb'){
            $result = $this::select('id','thumb')
                    ->where('id', $params['id'])
                    ->first();

        }
        //dd($params);
        if($options['task'] == 'news-get-item'){
            $result = $this::select('a.id','a.name','a.slug','a.category_id','a.created','a.content','a.status','a.thumb','c.name as category_name','c.display')
                    ->leftJoin('category_article as c', 'a.category_id', '=', 'c.id')
                    ->where('a.id', $params['article_id'])
                    ->first()->toArray();

        }


        if($options['task'] == 'get-all-item'){
            $result = $this::select('a.id','a.name','a.slug','a.category_id','a.created','a.content','a.status','a.thumb','c.name as category_name','c.display')
                    ->leftJoin('category_article as c', 'a.category_id', '=', 'c.id')
                    ->get()->toArray();

        }

        return $result;
    }

}
