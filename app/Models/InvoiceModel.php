<?php

namespace App\Models;

use App\Models\AdminModel;
use Illuminate\Support\Str;                 // Hỗ trợ thao tác chuỗi
use DB;                                     // DB thao tác trên csdl
use Illuminate\Support\Facades\Storage;     // Dùng để delete image theo location
use Illuminate\Support\Facades\Session;
use Config;

class InvoiceModel extends AdminModel
{
    public function __construct(){
        $this->table                = 'invoice';
        $this->folderUpload         = 'invoice';
        $this->fieldSearchAccepted  = ['id','user_id','code','total','status'];
        $this->crudNotActived       = ['_token'];
    }

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

}
