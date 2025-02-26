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
            <li id='user'>
                <a><i class="fa fa-user"></i> User<span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li><a href="{{ route('user')}}"> User</a></li>
                    <li><a href="{{ route('group')}}"> Group</a></li>
                </ul>
            </li>
            <li id='product'>
                <a><i class="fa fa-archive"></i> Quản lý Sản Phẩm<span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li><a href="{{ route('product')}}"> Product</a></li>
                    <li><a href="{{ route('categoryProduct')}}"> Category</a></li>
                    <li><a href="{{ route('productAttributePrice')}}"> Giá cả của sản phẩm theo thuộc tính</a></li>
                    <li><a href="{{ route('productHasAttribute')}}"> Thuộc tính của sản phẩm</a></li>
                </ul>
            </li>
            <li id='attribute'>
                <a><i class="fa fa-cubes"></i> Quản lý Thuộc tính Sản Phẩm<span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li><a href="{{ route('attribute')}}"> Loại thuộc tính</a></li>
                    <li><a href="{{ route('attributevalue')}}"> Giá trị thuộc tính</a></li>
                </ul>
            </li>
            <li><a href="{{ route('coupon')}}"><i class="fa fa-money"></i> Mã khuyến mãi</a></li>
            {{--  <li id='manager-sales'>
                <a><i class="fa fa-money"></i></i> Quản lý bán hàng<span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li><a href="{{ route('coupon')}}"> Mã khuyến mãi</a></li>
                </ul>
            </li>  --}}
            <li id='article-manage'>
                <a><i class="fa fa-newspaper-o"></i> Quản lý bài viết<span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li><a href="{{ route('article')}}"> Article</a></li>
                    <li><a href="{{ route('categoryArticle')}}"> Category</a></li>
                </ul>
            </li>
            <li><a href="{{ route('slider')}}"><i class="fa fa-sliders"></i> Sliders</a></li>
            <li id='media'>
                <a><i class="fa fa-file-image-o"></i></i> Quản lý media<span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li><a href="{{ route('gallery')}}"> Gallery</a></li>
                    <li><a href="{{ route('video')}}"> Playlist Youtube</a></li>
                </ul>
            </li>
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
            <li id='rss'>
                <a><i class="fa fa-rss"></i> Quản lý Rss<span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li><a href="{{ route('rss')}}"> Rss</a></li>
                    <li><a href="{{ route('rssnews')}}"> Rss News</a></li>
                </ul>
            </li>
            <li><a href="{{ route("admin.logs.index")}}"><i class="fa fa-history"></i> LogViewer</a></li>
            <li><a href="{{ route('appointment')}}"><i class="fa fa-calculator"></i> Lịch hẹn</a></li>
            <li><a href="{{ route('branch')}}"><i class="fa fa-suitcase"></i> Chi nhánh</a></li>
            <li id='userAgents'>
                <a><i class="fa fa-jsfiddle"></i> Quản lý views người dùng<span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li><a href="{{ route('dataViewsArticle')}}"> Data Views</a></li>
                    <li><a href="{{ route('userAgents')}}"> UserAgents</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<!-- /sidebar menu -->

