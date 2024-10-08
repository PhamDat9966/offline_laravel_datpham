<!-- menu profile quick info -->
@php
    use Illuminate\Support\Facades\Session;
    use App\Helpers\Template as Template;
    $userInfo = $value = Session::get('userInfo');
    $nameUser = ucfirst($userInfo['username']);
    $avatar   = Template::showAvatar($userInfo['avatar'],$userInfo['username']);
@endphp
<div class="profile clearfix">
    <div class="profile_pic">
        <img src="{{asset('images/user/'.$userInfo['avatar'].'')}}" alt="..." class="img-circle profile_img">
    </div>
    <div class="profile_info">
        <span>Welcome,</span>
        <h2>{{$nameUser}}</h2>
    </div>
</div>
<!-- /menu profile quick info -->
<br/>
<!-- sidebar menu -->
<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
    <div class="menu_section">
        <h3>Menu</h3>
        <ul class="nav side-menu">
            <li><a href="{{ route('dashboard') }}"><i class="fa fa-home"></i> Dashboard</a></li>
            <li><a href="{{ route('user') }}"><i class="fa fa-user"></i> User</a></li>
            <li><a href="{{ route('category')}}"><i class="fa fa fa-building-o"></i> Category</a></li>
            <li><a href="{{ route('article')}}"><i class="fa fa-newspaper-o"></i> Article</a></li>
            <li><a href="{{ route('slider')}}"><i class="fa fa-sliders"></i> Sliders</a></li>
            <li><a href="{{ route('gallery')}}"><i class="fa fa-file-image-o"></i> Gallery</a></li>
            <li><a href="{{ route('changePassword')}}"><i class="fa fa-key"></i> Change Password</a></li>
            <li><a href="{{ route('menu')}}"><i class="fa fa-sitemap"></i> Menu</a></li>
            <li><a href="{{ route('admin.contact')}}"><i class="fa fa-paper-plane"></i>Liên hệ</a></li>
            <li><a href="{{ route('phone')}}"><i class="fa fa-volume-control-phone"></i>Fast Phone</a></li>
            <li id='setting'>
                <a><i class="fa fa-cog"></i> Setting<span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li><a href="{{ route('setting',['type'=>'general'])}}">General</a></li>
                    <li><a href="{{ route('setting',['type'=>'email'])}}">Email</a></li>
                    <li><a href="{{ route('setting',['type'=>'social'])}}">Social</a></li>
                </ul>
            </li>
            <li><a href="{{ route('rss')}}"><i class="fa fa-navicon"></i> Rss</a></li>
            <li><a href="{{ route('rssnews')}}"><i class="fa fa-newspaper-o"></i> Rss News</a></li>
            <li><a href="{{ route("admin.logs.index")}}"><i class="fa fa-history"></i> LogViewer</a></li>
            <li><a href="{{ route('appointment')}}"><i class="fa fa-calculator"></i> Lịch hẹn</a></li>
            <li><a href="{{ route('branch')}}"><i class="fa fa-suitcase"></i> Chi nhánh</a></li>
            <li><a href="{{ route('attribute')}}"><i class="fa fa-cube"></i> Thuộc tính</a></li>
            <li><a href="{{ route('attributevalue')}}"><i class="fa fa-cubes"></i> Giá trị thuộc tính</a></li>
            <li><a href="{{ route('dataViewsArticle')}}"><i class="fa fa-clone"></i> Data Views</a></li>
            <li><a href="{{ route('userAgents')}}"><i class="fa fa-jsfiddle"></i> UserAgents</a></li>
        </ul>
    </div>
</div>
<!-- /sidebar menu -->

