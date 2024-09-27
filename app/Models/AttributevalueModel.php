<?php

namespace App\Models;

use App\Models\AdminModel;
use App\Models\CategoryModel;
use Illuminate\Support\Str;                 // Hỗ trợ thao tác chuỗi
use Illuminate\Support\Facades\DB;          // DB thao tác trên csdl
use Illuminate\Support\Facades\Storage;     // Dùng để delete image theo location
use Illuminate\Support\Facades\Session;
use Config;
class AttributevalueModel extends AdminModel
{
    public function __construct(){
        $this->table                = 'attribute_value as av';
        $this->folderUpload         = 'attribute_value';
        $this->fieldSearchAccepted  = ['name','fieldClass'];
        $this->crudNotActived       = ['_token'];
    }

    public function listItems($params = null,$options = null){

        $result = null;
        if($options['task'] == 'admin-list-items'){
            $query = $this->select('av.id','av.attribute_id','av.name','av.fieldClass','av.status')
                           ->leftJoin('attribute as a', 'av.attribute_id', '=', 'a.id');
            if($params['filter']['status'] !== "all"){
               $query->where('av.status','=',$params['filter']['status']);

            }

            if($params['search'] !== ""){

                if($params["search"]["field"] == "all"){

                    $query->where(function ($query) use ($params){
                        foreach ($this->fieldSearchAccepted as $column) {
                            {
                                $query->orWhere('av.'.$column,"like","%".$params["search"]["value"]."%");
                            }
                        }
                    }
                );

                }else if(in_array($params["search"]["field"], $this->fieldSearchAccepted)){
                    $query->where('av.'.$params["search"]["field"],"like","%".$params["search"]["value"]."%");
                    //$query->where($params["search"]["field"],"like","%{$params["search"]["value"]}%");
                }
            }

            $result = $query->orderBy('av.id', 'desc')
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
                          ->leftJoin('category as c', 'a.category_id', '=', 'c.id')
                          ->where('a.status','=','active')
                          ->where('a.type','feature')
                          ->orderBy('a.id', 'desc')
                          ->take(3);
            $result = $query->get()->toArray();
        }

        if($options['task'] == 'news-list-items-normal'){
            $query = $this->select('a.id','a.name','a.content','a.created','a.category_id','c.name as category_name','a.thumb')
                          ->leftJoin('category as c', 'a.category_id', '=', 'c.id')
                          ->where('a.status','=','active')
                          ->orderBy('a.id', 'desc')
                          ->take(3);
            $result = $query->get()->toArray();
        }

        if($options['task'] == 'news-list-items-many-conditions'){
            $query = $this->select('a.id','a.name','a.content','a.slug','a.created','a.category_id','c.name as category_name','a.thumb')
                          ->leftJoin('category as c', 'a.category_id', '=', 'c.id')
                          ->where('a.status','=','active')
                          ->orwhere('a.type','feature')
                          ->orderBy('a.type', 'asc')
                          ->orderBy('a.id', 'desc')
                          ->take(3);
            $result = $query->get()->toArray();
        }

        if($options['task'] == 'news-list-items-latest'){
            $query = $this->select('a.id','a.name','a.slug','a.created','a.category_id','c.name as category_name','a.thumb')
                          ->leftJoin('category as c', 'a.category_id', '=', 'c.id')
                          ->where('a.status','=','active')
                          ->orderBy('a.id', 'desc')
                          ->take(4);
            $result = $query->get()->toArray();
        }

        if($options['task'] == 'news-list-items-in-category'){
            $query = $this->select('a.id','a.name','a.slug','a.created','a.content','a.created','a.thumb','a.type')
                          ->leftJoin('category as c', 'a.category_id', '=', 'c.id')
                          ->where('a.status','=','active')
                          ->where('a.category_id','=',$params['category_id'])
                          ->orderBy('a.id', 'desc')
                          ->take(4);
            $result = $query->get()->toArray();
        }

        if($options['task'] == 'news-list-items-in-category-id-array'){
            $query = $this->select('a.id','a.name','a.slug','a.created','a.content','a.created','a.thumb','a.type')
                          ->leftJoin('category as c', 'a.category_id', '=', 'c.id')
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
                          ->leftJoin('category as c', 'a.category_id', '=', 'c.id')
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
                          ->leftJoin('category as c', 'a.category_id', '=', 'c.id')
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
                    ->leftJoin('category as c', 'a.category_id', '=', 'c.id')
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
            $params['modified-return']      = date(Config::get('zvn.format.short_time'),strtotime($params['modified']));
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

            /* Save dữ liệu theo DB oject */
            // $params = array_diff_key($params,array_flip($this->crudNotActived)); // array_diff_key Hàm trả về sự khác nhau về key giữa mảng 1 và 2

            // // self::insert($params);
            // //// OR use
            // DB::table('article')->insert($params);

            /* Save dữ liệu theo eloquent */
            $this->table            = 'attribute_value';
            $this->name             = $params['name'];
            $this->attribute_id     = $params['attribute_id'];
            $this->fieldClass       = $params['fieldClass'];
            $this->status           = $params['status'];
            $this->created_by       = $params['created_by'];
            $this->created          = $params['created'];
            $this->save();
        }

        if($options['task'] == 'edit-item'){
            $params   = $this->prepareParams($params);
            self::where('id', $params['id'])->update($params);
        }

    }

    public function deleteItem($params = null,$options = null){
        if($options['task'] == 'delete-item'){
            $item   =  $this->getItem($params,['task' => 'get-thumb']);

            //Storage::disk('zvn_storage_image')->delete($this->folderUpload . '/' . $item['thumb']);
            $this->deleteThumb($item['thumb']);

            $this->table = 'article';
            $this->where('id', $params['id'])->delete();
        }
    }

    public function getItem($params = null,$options = null){
        $result   = null;
        if($options['task'] == 'get-item'){
            $result = $this::select('id','name','status','fieldClass')
                    ->where('id', $params['id'])
                    ->first();
                    //->get();

        }

        if($options['task'] == 'get-all-item'){
            $result = $this::select('av.id','av.name','av.attribute_id','av.fieldClass','av.status')
                    ->leftJoin('attribute as a', 'av.attribute_id', '=', 'a.id')
                    ->get()->toArray();

        }

        return $result;
    }

}
