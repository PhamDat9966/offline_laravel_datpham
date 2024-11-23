<?php

namespace App\Models;

use App\Models\AdminModel;
use App\Models\ProductModel;
use App\Models\ProductHasAttributeModel;

use Illuminate\Support\Str;                 // Hỗ trợ thao tác chuỗi
use Illuminate\Support\Facades\DB;          // DB thao tác trên csdl
use Illuminate\Support\Facades\Session;
class MediaModel extends AdminModel
{
    public function __construct(){
        $this->table                = 'media';
        $this->folderUpload         = 'media';
        $this->fieldSearchAccepted  = [];
        $this->crudNotActived       = ['_token'];
    }

    public function product()
    {
        $this->table  = 'media';
        return $this->belongsTo(ProductModel::class, 'product_id', 'id');
    }

    public function ProductHasAttributes()
    {
        $this->table  = 'media';
        return $this->belongsTo(ProductHasAttributeModel::class, 'attribute_value_id', 'id');
    }
}
