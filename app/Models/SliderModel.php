<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;
class SliderModel extends Model
{
    protected $table = 'slider';
    //protected $primaryKey = 'id'; //$primaryKey mặc định là id nên ở đây không cần khai báo
    public $timestamps = false;
    const CREATED_AT = 'created';
    const UPDATED_AT = 'modified';

    public function listItems($params = null,$options = null){

        $result = null;
        if($options['task'] == "admin-list-items"){
            $result = self::select('id','name','description','link','thumb','created','created_by','modified','modified_by','status')
                            // ->where('id','>=', 4)
                            ->orderBy('id', 'asc')
                            ->paginate($params['pagination']['totalItemsPerPage']);
                            //>get()
                            //->toArray();

            // $result = $this->select('id','name','description','link','thumb','created','created_by','modified','modified_by','status')
            // ->get();
        }

        return $result;
    }

    public function countItems($params = null,$options = null){

        $result = null;
        if($options['task'] == "admin-count-items"){
            //SELECT `status`, COUNT(`id`) FROM `slider` GROUP BY `status`
            $result = self::select(DB::raw('COUNT(id) as count,status') )
                             ->groupBy('status')
                             ->get()->toArray();
        }

        return $result;
    }
}
