<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use App\Models\RoleHasPermissionModel;
use Illuminate\Support\Facades\Auth;
class CheckArticlePermission
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

        $routeName = $request->route()->getName(); // Lấy tên route hiện tại
        $id = $request->route('id');

        $user = Auth::user();

        if (!$userInfo) {
            return redirect()->route('auth/login')->with('news_notily','Bạn cần đăng nhập.');;
        }

        $founderRolesID = config('zvn.config.lock.prime_id');

        if($userInfo['roles_id'] != $founderRolesID){
            if($routeName == 'article/form'){
                if ($id) {
                    // Quyền chỉnh sửa bài viết
                    $flagEditArticle = false;
                    foreach($userInfo['has_permission'] as $permission){
                        if($permission['permission_name'] == 'edit-articles'){
                            $flagEditArticle = true;
                            break;
                        }
                    }

                    if($flagEditArticle == false){
                        return redirect()->route('notify/noPermission');
                    }

                } else {
                    // Quyền tạo bài viết mới
                    $flagCreateArticle = false;
                    foreach($userInfo['has_permission'] as $permission){
                        if($permission['permission_name'] == 'create-articles'){
                            $flagCreateArticle = true;
                            break;
                        }
                    }
                    if($flagCreateArticle == false){
                        return redirect()->route('notify/noPermission');
                    }
                }
            }

            if($routeName == 'article/delete'){
                // Quyền xóa bài viết
                $flagDeleteArticle = false;
                foreach($userInfo['has_permission'] as $permission){
                    if($permission['permission_name'] == 'delete-articles'){
                        $flagDeleteArticle = true;
                        break;
                    }
                }
                if($flagDeleteArticle == false){
                    return redirect()->route('notify/noPermission');
                }
            }
        }
        return $next($request);
    }
}
