<?php

namespace App\Models;

use App\Models\AdminModel;
use Illuminate\Support\Str;                 // Hỗ trợ thao tác chuỗi
use DB;                                     // DB thao tác trên csdl
use Illuminate\Support\Facades\Storage;     // Dùng để delete image theo location
use Illuminate\Support\Facades\Session;
use Config;
use App\Models\InvoiceProductModel;


class InvoiceModel extends AdminModel
{
    public function __construct(){
        $this->table                = 'invoice';
        $this->folderUpload         = 'invoice';
        $this->fieldSearchAccepted  = ['id','user_id','code','total','status'];
        $this->crudNotActived       = ['_token'];
    }

    /*--Replaytionship--*/
    // Quan hệ với bảng user
    public function user()
    {
        $this->table  = 'invoice';
        return $this->belongsTo(UserModel::class, 'user_id', 'id');
    }
    /*--End Replaytionship--*/
    // Quan hệ với bảng invoice_product
    public function invoiceProducts()
    {
        $this->table  = 'invoice';
        return $this->hasMany(InvoiceProductModel::class, 'invoice_id', 'id');
    }
    /*--End Replaytionship--*/

    public function saveItem($params = null,$options = null){
        $userInfo     = [];
        $cart         = session('cart');
        if (Session::has('userInfo')) {
            $userInfo = Session::get('userInfo');
        } else {
            $userInfo = ['username'=>'admin'];
        }

        $params['modified_by']   = $userInfo['username'];
        $params['modified']      = date('Y-m-d');

        if($options['task'] == 'add-item'){
            /* Save dữ liệu theo eloquent */
            $this->table     = 'invoice';
            $this->user_id   = $userInfo['id'];
            $this->username  = $userInfo['username'];
            $this->code      = 'INV-' . now()->format('HisdmY') . '-' . rand(1000, 9999);
            $this->created   = now()->format('Y-m-d H:i:s');
            $this->total     = array_sum(array_column($cart, 'quantity'));
            $this->price     = array_sum(array_column($cart,'totalPrice'));
            $this->status    = 'processing';
            $this->save();
        }

    }

    public function getItem($params = null,$options = null){

        $result = null;

        $userInfo     = [];
        $cart         = session('cart');
        if (Session::has('userInfo')) {
            $userInfo = Session::get('userInfo');
        } else {
            $userInfo = ['username'=>'admin'];
        }

        $params['user_id'] = $userInfo['id'];

        if($options['task'] == 'get-item-by-user-id'){
            $this->table = 'invoice';
            $result = $this->where('user_id',$params['user_id'])->with('user')->get();
        }

        if($options['task'] == 'get-invoice-product-by-invoice-id'){
            $this->table = 'invoice_product';
            $result = $this->where('invoice_id',$params['invoice_id'])->with('invoiceProducts')->get();
        }

        return $result;
    }


}
