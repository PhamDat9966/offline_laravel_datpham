@php
    use Illuminate\Support\Facades\Session;
    use App\Helpers\Template as Template;
    //dd(session()->all());
    $userInfo = [];

    $homePhone      = route('phoneHome');

    $iconAvatar     = asset("images/phonetheme/avatar.png");
    $urlLogout      = route('authsphone/logout');

    $xhtmlUserInfo  = '';
    if(session()->has('userInfo')){
        $userInfo       = session('userInfo');
        $nameUser       = ucfirst($userInfo['username']);
        $avatar         = Template::showAvatarSmartPhone($userInfo['avatar'],$userInfo['username']);


        $xhtmlUserInfo  = ' <div class="top-header">
                                <ul class="header-dropdown">
                                    <li class="onhover-dropdown mobile-account">
                                        '.$avatar.'
                                        <ul class="onhover-show-div">
                                            <li><a href="'.$urlLogout.'">Đăng xuất</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>';
    }else{
        $urlLogin       = route('authsphone/login');

        $xhtmlUserInfo  = ' <div class="top-header">
                        <ul class="header-dropdown">
                            <li class="onhover-dropdown mobile-account">
                                <img src="'.$iconAvatar.'" alt="avatar">
                                <ul class="onhover-show-div">
                                    <li><a href="'.$urlLogin.'">Đăng nhập</a></li>
                                    <li><a href="register.html">Đăng ký</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>';
    }

    //Cart
    $totalQuantity  = 0;
    $iconCart       = asset("images/phonetheme/cart.png");
    $urlCart        = route('authsphone/cart');
    $cart           = session()->get( 'cart');
    if($cart){
        foreach($cart as $key=>$elementCart){
            $totalQuantity += $elementCart['quantity'];
        }
    }
    //dd(session()->all());
    $cart               = '<li class="onhover-div mobile-cart">
                                <div>
                                    <a href="'.$urlCart.'" id="cart" class="position-relative">
                                        <img src="'.$iconCart.'" class="img-fluid blur-up lazyload"
                                            alt="cart">
                                        <i class="ti-shopping-cart"></i>
                                        <span class="badge badge-warning">'.$totalQuantity.'</span>
                                    </a>
                                </div>
                            </li>';

@endphp
<header class="my-header sticky">
        <div class="mobile-fix-option"></div>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="main-menu">
                        <div class="menu-left">
                            <div class="brand-logo">
                                <a href="{{$homePhone}}">
                                    <h2 class="mb-0" style="color: #5fcbc4">Smart Phone</h2>
                                </a>
                            </div>
                        </div>
                        <div class="menu-right pull-right">
                            <div>
                                <nav id="main-nav">
                                    <div class="toggle-nav"><i class="fa fa-bars sidebar-bar"></i></div>
                                    <ul id="main-menu" class="sm pixelstrap sm-horizontal">
                                        <li>
                                            <div class="mobile-back text-right">Back<i class="fa fa-angle-right pl-2"
                                                    aria-hidden="true"></i></div>
                                        </li>
                                        <li><a href="{{$homePhone}}" class="my-menu-link active">Trang chủ</a></li>
                                        <li><a href="list.html">Sách</a></li>
                                        <li>
                                            <a href="category.html">Danh mục</a>
                                            <ul>
                                                <li><a href="list.html">Bà mẹ - Em bé</a></li>
                                                <li><a href="list.html">Chính Trị - Pháp Lý</a></li>
                                                <li><a href="list.html">Học Ngoại Ngữ</a></li>
                                                <li><a href="list.html">Công Nghệ Thông Tin</a></li>
                                                <li><a href="list.html">Giáo Khoa - Giáo Trình</a>
                                            </ul>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                            {!! $xhtmlUserInfo !!}
                            <div>
                                <div class="icon-nav">
                                    <ul>
                                        <li class="onhover-div mobile-search">
                                            <div>
                                                <img src="images/search.png" onclick="openSearch()"
                                                    class="img-fluid blur-up lazyload" alt="">
                                                <i class="ti-search" onclick="openSearch()"></i>
                                            </div>
                                            <div id="search-overlay" class="search-overlay">
                                                <div>
                                                    <span class="closebtn" onclick="closeSearch()"
                                                        title="Close Overlay">×</span>
                                                    <div class="overlay-content">
                                                        <div class="container">
                                                            <div class="row">
                                                                <div class="col-xl-12">
                                                                    <form action="" method="GET">
                                                                        <div class="form-group">
                                                                            <input type="text" class="form-control"
                                                                                name="search" id="search-input"
                                                                                placeholder="Tìm kiếm sách...">
                                                                        </div>
                                                                        <button type="submit" class="btn btn-primary"><i
                                                                                class="fa fa-search"></i></button>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        {!! $cart !!}
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
