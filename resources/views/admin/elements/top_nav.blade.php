@php
    use Illuminate\Support\Facades\Session;
    use App\Helpers\Template as Template;
    $userInfo = $value = Session::get('userInfo');
    $nameUser = ucfirst($userInfo['username']);
    $avatar   = Template::showAvatar($userInfo['avatar'],$userInfo['username']);
@endphp
<div class="nav_menu">
    <nav>
        <div class="nav toggle">
            <a id="menu_toggle"><i class="fa fa-bars"></i></a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li class="">
                <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown"
                   aria-expanded="false">
                    {!!$avatar!!}{{$nameUser}}
                    <span class=" fa fa-angle-down"></span>
                </a>
                <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="{!!route('changePassword')!!}"> Change Password</a></li>
                    <li><a href="{!!route('auth/logout')!!}"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                </ul>
            </li>
        </ul>
    </nav>
</div>
