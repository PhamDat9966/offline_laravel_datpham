<?php

namespace App\Models;

use App\Models\AdminModel;
use Illuminate\Support\Str;                 // Hỗ trợ thao tác chuỗi
use DB;                                     // DB thao tác trên csdl
use Illuminate\Support\Facades\Storage;     // Dùng để delete image theo location

class ArticleModel extends AdminModel
{
    public function __construct(){
        $this->table                = 'article';
        $this->folderUpload         = 'article';
        $this->fieldSearchAccepted  = ['name','content'];
        $this->crudNotActived       = ['_token','thumb_current'];
    }

    public function listItems($params = null,$options = null){

        $result = null;
        if($options['task'] == 'admin-list-items'){
            $query = $this->select('id','name','content','status','thumb','created','created_by','modified','modified_by');

            if($params['filter']['status'] !== "all"){
                $query->where('status','=',$params['filter']['status']);
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

            $result = $query->orderBy('id', 'desc')
                            ->paginate($params['pagination']['totalItemsPerPage']);
        }

        if($options['task'] == 'news-list-items'){
            $query = $this->select('id','name')
                          ->where('status','=','active')
                          ->limit('8');
            $result = $query->get()->toArray();
        }

        if($options['task'] == 'news-list-items-is-home'){
            $query = $this->select('id','name','display')
                          ->where('status','=','active')
                          ->where('is_home','=','1');
            $result = $query->get()->toArray();
        }

        return $result;
    }

    public function countItems($params = null,$options = null){

        $result = null;

        if($options['task'] == 'admin-count-items-group-by-status'){

            $query  = $this->select(DB::raw('COUNT(id) as count,status'))
                           ->groupBy('status');

                            if($params['filter']['is_home'] !== "all"){
                                $query->where("is_home","=", $params['filter']['is_home']);
                            }

                            if($params['filter']['display'] !== "all"){
                                $query->where("display","=", $params['filter']['display']);
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

        if($options['task'] == 'change-status'){
            $status  = ($params['currentStatus'] == 'active') ? 'inactive' : 'active';
            $this::where('id', $params['id'])
                        ->update(['status' => $status]);
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

            $thumb                  = $params['thumb'];
            $params['thumb']        = Str::random(10) . '.' . $thumb->clientExtension();
            $params['created_by']   = 'phamdat';
            $params['created']      = date('Y-m-d');

            $thumb->storeAs($this->folderUpload, $params['thumb'],'zvn_storage_image');

            /* Save dữ liệu theo DB oject */
            // $params = array_diff_key($params,array_flip($this->crudNotActived)); // array_diff_key Hàm trả về sự khác nhau về key giữa mảng 1 và 2

            // self::insert($params);
            //// OR use
            //// DB::table('article')->insert($params);

            /* Save dữ liệu theo eloquent */
            $this->name         = $params['name'];
            $this->content      = $params['content'];
            $this->status       = $params['status'];
            $this->created_by   = $params['created_by'];
            $this->created      = $params['created'];
            $this->thumb        = $params['thumb'];
            $this->save();
        }

        if($options['task'] == 'edit-item'){

            if(!empty($params["thumb"])){
                // echo '<pre>';
                // print_r($params);
                // echo '</pre>';
                // die();
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

            $params['modified_by']   = 'phamdat';
            $params['modified']      = date('Y-m-d');

            //$params = array_diff_key($params,array_flip($this->crudNotActived)); // array_diff_key Hàm trả về sự khác nhau về key giữa mảng 1 và 2
            $params   = $this->prepareParams($params);
            self::where('id', $params['id'])->update($params);

        }

    }

    public function deleteItem($params = null,$options = null){
        if($options['task'] == 'delete-item'){
            $item   =  $this->getItem($params,['task' => 'get-thumb']);

            //Storage::disk('zvn_storage_image')->delete($this->folderUpload . '/' . $item['thumb']);
            $this->deleteThumb($item['thumb']);

            $this->where('id', $params['id'])->delete();
        }
    }

    public function getItem($params = null,$options = null){
        $result   = null;
        if($options['task'] == 'get-item'){
            $result = $this::select('id','name','content','status','thumb')
                    ->where('id', $params['id'])
                    ->first();
                    //->get();

        }

        if($options['task'] == 'get-thumb'){
            $result = $this::select('id','thumb')
                    ->where('id', $params['id'])
                    ->first();

        }

        return $result;
    }

}