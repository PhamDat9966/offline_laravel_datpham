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
        $this->table                = 'setting as a';
        $this->folderUpload         = 'setting';
        $this->fieldSearchAccepted  = ['name','content'];
        $this->crudNotActived       = ['_token','thumb_current'];
    }

}
