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

    protected $fieldSearchAccepted = [
        'id',
        'name',
        'description',
        'link'
    ] ;

    public function listItems($params = null,$options = null){

        // echo "<pre>Model";
        // print_r($params);
        // echo "</pre>";

        $result = null;
        if($options['task'] == 'admin-list-items'){
            $query = $this->select('id','name','description','link','thumb','created','created_by','modified','modified_by','status');

            if($params['filter']['status'] !== "all"){
                $query->where('status','=',$params['filter']['status']);
            }

            if($params['search'] !== ""){

                if($params["search"]["field"] == "all"){

                }else if(in_array($params["search"]["field"], $this->fieldSearchAccepted)){
                    $query->where($params["search"]["field"],"like","%".$params["search"]["value"]."%");
                    //$query->where($params["search"]["field"],"like","%{$params["search"]["value"]}%");
                }
            }

            $result = $query->orderBy('id', 'asc')
                            ->paginate($params['pagination']['totalItemsPerPage']);
        }

        return $result;
    }

    public function countItems($params = null,$options = null){

        $result = null;
        if($options['task'] == 'admin-count-items-group-by-status'){
            //SELECT `status`, COUNT(`id`) FROM `slider` GROUP BY `status`
            $result = self::select(DB::raw('COUNT(id) as count,status') )
                             ->groupBy('status')
                             ->get()
                             ->toArray();
        }

        return $result;
    }
}
