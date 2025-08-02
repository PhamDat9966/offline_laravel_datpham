<?php

namespace App\Models;

use App\Models\AdminModel;
use Illuminate\Support\Str;                 // Hỗ trợ thao tác chuỗi
use DB;                                     // DB thao tác trên csdl
use Illuminate\Support\Facades\Storage;     // Dùng để delete image theo location
use Illuminate\Support\Facades\Session;
use Config;

class InvoiceProductModel extends AdminModel
{
    protected $fillable = [
                                'invoice_id',
                                'product_id',
                                'color_id',
                                'material_id',
                                'product_name',
                                'color_name',
                                'material_name',
                                'quantity',
                                'price',
                                'total_price',
                                'thumb',
                            ];
    public function __construct(){
        $this->table                = 'invoice_product';
        $this->folderUpload         = 'invoice_product';
        $this->fieldSearchAccepted  = ['id','invoice_id','product_id','color_id','material_id'];
        $this->crudNotActived       = ['_token'];
    }
    /*--Replaytionship--*/
    public function invoice()
    {
        $this->table  = 'invoice_product';
        return $this->belongsTo(InvoiceModel::class, 'invoice_id', 'id');
    }
    /*--End Replaytionship--*/

}
