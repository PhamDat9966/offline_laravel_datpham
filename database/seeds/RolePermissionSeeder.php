<?php
namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\User; // Đừng quên import User nếu có

class RolePermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Tạo danh sách các quyền
        $permissions = ['create articles', 'edit articles', 'delete articles', 'publish articles'];

        foreach ($permissions as $permission) {
            Permission::create(['name' => $permission]);
        }
        /* Hiện tại permission sẽ chia là 3 cấp là: founder, admin và member*/
        // Tạo vai trò Founder  và gán tất cả quyền
        $founder = Role::create(['name' => 'founder']);
        $founder->givePermissionTo($permissions);

        // Tạo vai trò Admin và gán tất cả quyền
        $admin = Role::create(['name' => 'admin']);
        $admin->givePermissionTo($permissions);

        // Tạo vai trò member và chỉ gán quyền chỉnh sửa
        $member = Role::create(['name' => 'member']);
        $member->givePermissionTo(['create articles', 'edit articles']);
    }

    // public function run()
    // {
    //     /*Run để cập nhật lại nội dung*/
    //     // Xóa dữ liệu cũ để tránh trùng lặp
    //     Role::where('name', 'editor')->delete();
    //     Role::where('name', 'member')->delete();

    //     // Cập nhật danh sách quyền
    //     $permissions = ['create articles', 'edit articles', 'delete articles', 'publish articles'];

    //     foreach ($permissions as $permission) {
    //         Permission::firstOrCreate(['name' => $permission]);
    //     }

    //     // Cập nhật lại Role
    //     $founder = Role::firstOrCreate(['name' => 'founder']);
    //     $founder->syncPermissions($founder);

    //     $admin = Role::firstOrCreate(['name' => 'admin']);
    //     $admin->syncPermissions($permissions);

    //     $member = Role::firstOrCreate(['name' => 'member']);
    //     $member->syncPermissions(['create articles', 'edit articles']);

    //     // Gán role cho User (nếu cần)
    //     $user = User::find(1); // ID của user admin
    //     if ($user) {
    //         $user->assignRole('admin');
    //     }
    // }
}
