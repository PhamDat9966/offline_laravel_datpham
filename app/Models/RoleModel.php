<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RoleModel extends Model
{
    use HasFactory;

    protected $table = 'roles'; // Chỉ định bảng roles
    protected $fillable = ['name']; // Các cột có thể gán dữ liệu

    // Quan hệ với UserModel (1 role có nhiều user)
    public function users()
    {
        return $this->hasMany(UserModel::class, 'roles_id');
    }

    public function listItems($params = null,$options = null){
        $result = null;

        if($options['task'] == 'admin-list-items'){
            $query = $this->select('id','name','guard_name','created_at','updated_at')
                          ->get()->toArray();
            $result = $query;
        }

        if($options['task'] == 'admin-list-items-in-select-box'){
            $prime_id = config('zvn.config.lock.prime_id');
            $result = $this::select('id','name','guard_name','created_at','updated_at')
                            ->where('id','!=', $prime_id)
                            ->get()->toArray();
        }

        return $result;
    }

    public function getItem($params = null,$options = null){

    }
}
