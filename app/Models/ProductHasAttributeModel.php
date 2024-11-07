<?php

namespace App\Models;

use App\Models\AdminModel;
use App\Models\ProductModel;
use App\Models\AttributevalueModel;

use Illuminate\Support\Str;                 // Hỗ trợ thao tác chuỗi
use Illuminate\Support\Facades\DB;          // DB thao tác trên csdl
use Illuminate\Support\Facades\Session;
class ProductHasAttributeModel extends AdminModel
{
    public function __construct(){
        $this->table                = 'product_has_attribute';
        $this->folderUpload         = 'product_has_attribute';
        $this->fieldSearchAccepted  = [];
        $this->crudNotActived       = ['_token'];
    }

    public function product()
    {
        $this->table  = 'product_has_attribute';
        return $this->belongsTo(ProductModel::class, 'product_id', 'id');
    }

    public function attributeValue()
    {
        return $this->belongsTo(AttributevalueModel::class, 'attribute_value_id', 'id');
    }
}
