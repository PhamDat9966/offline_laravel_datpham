<?php

namespace App\Models;

use App\Models\AdminModel;
use Illuminate\Support\Str;                 // Hỗ trợ thao tác chuỗi
use DB;                                     // DB thao tác trên csdl
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Storage;     // Dùng để delete image theo location

class DashboardModel extends AdminModel
{
    public function __construct(){
        $this->table                = 'totalelements';
        $this->folderUpload         = 'totalelements';
    }

    public function listItems($params = null,$options = null){

        $result = null;
        if($options['task'] == 'admin-list-items'){
            $result = $this->select('TableName','ElementCount','icon')->get()->toArray();
        }
        return $result;
    }

}
