<?php

namespace App\Models;

use App\Models\AdminModel;
use Illuminate\Support\Str;                 // Hỗ trợ thao tác chuỗi
use DB;                                     // DB thao tác trên csdl
use Illuminate\Support\Facades\Storage;     // Dùng để delete image theo location

class UserModel extends AdminModel
{
    public function __construct(){
        $this->table                = 'user';
        $this->folderUpload         = 'user';
        $this->fieldSearchAccepted  = ['id','name'];
        $this->crudNotActived       = ['_token','avatar_current'];
    }

    public function listItems($params = null,$options = null){

        $result = null;
        if($options['task'] == 'admin-list-items'){
            $query = $this->select('id','username','email','fullname','password','avatar','level','created','created_by','modified','modified_by','status');

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

            $result = $query->orderBy('id', 'asc')
                            ->paginate($params['pagination']['totalItemsPerPage']);
        }

        if($options['task'] == 'news-list-items'){
            $query = $this->select('id','name','description','link','thumb')
                          ->where('status','=','active')
                          ->limit('5');
            $result = $query->get()->toArray();
        }

        return $result;
    }

    public function countItems($params = null,$options = null){

        $result = null;
        if($options['task'] == 'admin-count-items-group-by-status'){
            //SELECT `status`, COUNT(`id`) FROM `slider` GROUP BY `status`
            // $result = self::select(DB::raw('COUNT(id) as count,status') )
            //                  ->groupBy('status')
            //                  ->get()
            //                  ->toArray();
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

        if($options['task'] == 'change-status'){
            $status  = ($params['currentStatus'] == 'active') ? 'inactive' : 'active';
            $this::where('id', $params['id'])
                        ->update(['status' => $status]);
        }

        if($options['task'] == 'change-level'){
            $this::where('id', $params['id'])
                ->update(['level' => $params['level']]);
        }

        if($options['task'] == 'add-item'){

            $avatar                 = $params['avatar'];
            $params['avatar']       = Str::random(10) . '.' . $avatar->clientExtension();
            $params['created_by']   = 'phamdat';
            $params['created']      = date('Y-m-d');

            $avatar->storeAs($this->folderUpload, $params['avatar'],'zvn_storage_image'); // Với zvn_storege_image được định nghĩa tại 'config/filesystems.php',
                                                                             // là vị trí mặc định khi lưu ảnh

            /* Save dữ liệu theo DB oject */
            // $params = array_diff_key($params,array_flip($this->crudNotActived)); // array_diff_key Hàm trả về sự khác nhau về key giữa mảng 1 và 2

            // self::insert($params);
            //// OR use
            //// DB::table('slider')->insert($params);

            /* Save dữ liệu theo eloquent */
            $this->username     = $params['username'];
            $this->fullname     = $params['fullname'];
            $this->email        = $params['email'];
            $this->status       = $params['status'];
            $this->created_by   = $params['created_by'];
            $this->created      = $params['created'];
            $this->avatar       = $params['avatar'];
            $this->save();
        }

        if($options['task'] == 'edit-item'){
            if(!empty($params["avatar"])){

                /*Xóa ảnh cũ*/
                $item   =  $this->getItem($params,['task' => 'get-avatar']);
                //Storage::disk('zvn_storage_image')->delete($this->folderUpload . '/' . $params['thumb_current']);
                $this->deleteThumb($params['avatar_current']);
                /* Thêm ảnh mới */
                // $thumb                  = $params['thumb'];
                // $params['thumb']        = Str::random(10) . '.' . $thumb->clientExtension();
                // $thumb->storeAs($this->folderUpload, $params['thumb'],'zvn_storage_image');
                $params['avatar']        = $this->uploadThumb($params['avatar']);
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
            $result = $this::select('id','username','fullname','email','status','level','avatar')
                    ->where('id', $params['id'])
                    ->first();
                    //->get();

        }

        if($options['task'] == 'get-thumb'){
            $result = $this::select('id','thumb')
                    ->where('id', $params['id'])
                    ->first();

        }

        if($options['task'] == 'get-avatar'){
            $result = $this::select('id','avatar')
                    ->where('id', $params['id'])
                    ->first();

        }

        return $result;
    }

}