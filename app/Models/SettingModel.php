<?php

namespace App\Models;

use App\Models\AdminModel;
use Illuminate\Support\Str;                 // Hỗ trợ thao tác chuỗi
use DB;                                     // DB thao tác trên csdl
use Illuminate\Support\Facades\Storage;     // Dùng để delete image theo location
use Illuminate\Support\Facades\Session;
use Config;
class SettingModel extends AdminModel
{
    public function __construct(){
        $this->table                = 'setting as s';
        $this->folderUpload         = 'setting';
        $this->fieldSearchAccepted  = ['name','content'];
        $this->crudNotActived       = ['_token','thumb_current'];
    }

    public function getItem($params = null,$options = null){
        $result   = null;

        if($options['task'] == 'get-all-items'){
            $result = $this::select('id','setting_key','setting_value')
                    //->first();
                    ->get()->toArray();

        }

        if($options['task'] == 'get-items'){
            $result = $this::select('id','setting_key','setting_value')
                    ->where('type', $params['type'])
                    //->first();
                    ->get()->toArray();

        }

        return $result;
    }

}
