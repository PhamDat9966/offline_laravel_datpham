<?php

namespace App\Models;

use App\Models\AdminModel;
use Illuminate\Support\Str;                 // Hỗ trợ thao tác chuỗi
use DB;                                     // DB thao tác trên csdl
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Storage;     // Dùng để delete image theo location
use Config;

class GroupModel extends AdminModel
{
    public function __construct(){
        $this->table                = 'group';
        $this->folderUpload         = 'group';
        $this->fieldSearchAccepted  = ['name','permission_ids'];
        $this->crudNotActived       = ['_token'];
    }

    public function listItems($params = null,$options = null){
        $result = null;
        if($options['task'] == 'admin-list-items'){
            $query = $this->select('id','name','permission_ids')
                          ->get()->toArray();
            $result = $query;
        }

        return $result;
    }

    public function saveItem($params = null,$options = null){

        if($options['task'] == 'add-item'){

        }

        if($options['task'] == 'edit-item'){

        }

    }

}
