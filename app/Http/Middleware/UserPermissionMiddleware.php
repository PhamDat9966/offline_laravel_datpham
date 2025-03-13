<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use App\Models\PermissionModel;
use App\Models\Permission;

class UserPermissionMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        $session = session()->all();
        $userInfo = $session['userInfo'];

        // Lấy role_id của user
        $params['roles_id'] = $userInfo['roles_id'];

        $founderRolesID = config('zvn.config.lock.prime_id');
        if($userInfo['roles_id'] != $founderRolesID){

            $prefix = request()->segment(1); // admin96
            $module = request()->segment(2); // user
            $action = request()->segment(3) ?? 'index'; // Nếu không có thì mặc định là 'index'
            $id = $request->route('id') ?? null;

            //Bước 1: Xác định permission hiện tại ở API
            $permissionInAction = "access-$module";
            if($action == 'form'){
                $permissionInAction = "create-$module";
                if($id != null){
                    $permissionInAction = "edit-$module";
                }
            }

            //Bước 2: Kiểm tra xem quyền này có tồn tại không? Nếu không tồn tại thì không kiểm tra tiếp.
            $permissionModule = new PermissionModel();
            $permissionExist  = PermissionModel::where('name', $permissionInAction)->exists();

            if($permissionExist){

                //Bước 3: Nếu quyền này có tồn tại, thì kiểm tra xem userInfo có quyền này không? Nếu có thì đi tiếp, nếu ko thì trả về trang "Bạn không có quyền truy cập"
                $userInfoHasPermission = in_array($permissionInAction, array_column($userInfo['has_permission'], 'permission_name'));

                //Debug:
                //dd($userInfo,$prefix,$module,$action,$id,$permissionInAction,$permissionExist,$userInfoHasPermission);

                if ($userInfoHasPermission) {
                    return $next($request);
                } else {
                    return redirect()->route('notify/noPermission');
                }

            }else{
                //Nếu quyền ở module action này không tồn tại thì kết thúc kiểm tra tại đây.
                return $next($request);
            }

        }
        return $next($request);
    }
}
