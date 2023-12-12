<?php

namespace App\Models;

use App\Models\AdminModel;
use Illuminate\Support\Str;                 // Hỗ trợ thao tác chuỗi
use DB;                                     // DB thao tác trên csdl
use Illuminate\Support\Facades\Storage;     // Dùng để delete image theo location
use Illuminate\Support\Facades\Session;

class UserAgentModel extends AdminModel
{
    public function __construct(){
        $this->table                = 'user_agents as u';
        $this->folderUpload         = 'userAgents';
        $this->fieldSearchAccepted  = ['name','content'];
        $this->crudNotActived       = ['_token','thumb_current'];
    }

    public function listItems($params = null,$options = null){
        $result = null;

        if($options['task'] == 'admin-list-items'){
            $query = $this->select('u.id','u.agent','u.timestamps','u.article_id','a.name as article_name')
            ->leftJoin('article as a', 'a.id', '=', 'u.article_id');

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

        if($options['task'] == 'user_agents-list-items'){
            $query = $this->select('id','agent','article_id');
            $result = $query->get()->toArray();
        }

        return $result;
    }

    public function countItems($params = null,$options = null){

        $result = null;

        if($options['task'] == 'admin-count-items-group-by-status'){

            $query  = $this->select(DB::raw('COUNT(id) as count,article_id'))
                           ->groupBy('article_id');

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

        if($options['task'] == 'change-status'){
            $status  = ($params['currentStatus'] == 'active') ? 'inactive' : 'active';
            $this::where('id', $params['id'])
                        ->update(['status' => $status]);
        }

        if($options['task'] == 'change-type'){
            $type  = ($params['currentType'] == 'feature') ? 'feature' : 'normal';
            $this::where('id', $params['id'])
                        ->update(['type' => $type]);
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
            $params['created_by']   = $userInfo['username'];
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
            $this->category_id  = $params['category_id'];
            $this->status       = $params['status'];
            $this->created_by   = $params['created_by'];
            $this->created      = $params['created'];
            $this->thumb        = $params['thumb'];
            $this->save();
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
            $item   =  $this->getItem($params,['task' => 'get-thumb']);

            //Storage::disk('zvn_storage_image')->delete($this->folderUpload . '/' . $item['thumb']);
            $this->deleteThumb($item['thumb']);

            $this->where('id', $params['id'])->delete();
        }
    }

    public function getItem($params = null,$options = null){
        $result   = null;
        if($options['task'] == 'get-item'){
            $result = $this::select('id','name','category_id','content','status','thumb')
                    ->where('id', $params['id'])
                    ->first();
                    //->get();

        }

        if($options['task'] == 'get-thumb'){
            $result = $this::select('id','thumb')
                    ->where('id', $params['id'])
                    ->first();

        }

        if($options['task'] == 'news-get-item'){
            $result = $this::select('a.id','a.name','a.category_id','a.created','a.content','a.status','a.thumb','c.name as category_name','c.display')
                    ->leftJoin('category as c', 'a.category_id', '=', 'c.id')
                    ->where('a.id', $params['article_id'])
                    ->first()->toArray();

        }

        return $result;
    }

}
