<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    use HasFactory;

    protected $table = 'roles'; // Chỉ định bảng roles
    protected $fillable = ['name']; // Các cột có thể gán dữ liệu

    // Quan hệ với UserModel (1 role có nhiều user)
    public function users()
    {
        return $this->hasMany(UserModel::class, 'roles_id');
    }

}
