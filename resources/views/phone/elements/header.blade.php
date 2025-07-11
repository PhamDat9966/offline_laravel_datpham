@php
    use Illuminate\Support\Facades\Session;
    use App\Helpers\Template as Template;

    use App\Models\CategoryProductModel as CategoryProductModel;
    use App\Models\ProductModel as ProductModel;
    use App\Models\MenuSmartPhoneModel as MenuSmartPhoneModel;
    use App\Helpers\URL;
    use Illuminate\Http\Request;

    use App\Models\SettingModel as SettingModel;
    use Illuminate\Support\Facades\App;

    $request = Request::capture();
    global $host;
    $host = $request->getHost();
    $host = 'http://'.$host;
    $prefixNews     = config('zvn.url.prefix_news');
    if($prefixNews != null){
        $host = $host.'/'.$prefixNews;
    }

    $params = [];
    $locale             = App::getLocale();
    $params['locale']   = (isset($locale)) ? $locale : 'vi';

    //dd(session()->all());

    $menuSmartPhoneModel    = new MenuSmartPhoneModel();
    $itemsMenu              = $menuSmartPhoneModel->listItems($params,['task'=>'news-list-items-navbar-menu']);

    $categoryProductModel  = new CategoryProductModel();
    $categoryProductNav   = $categoryProductModel->listItems(null,['task'=>'news-list-items-navbar-menu']);

    //dd($categoryProductNav);

    $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";// Lấy giao thức (http hoặc https)
    $hostCurrent = $_SERVER['HTTP_HOST'];// Lấy tên máy chủ (domain)
    $path = $_SERVER['REQUEST_URI'];// Lấy đường dẫn (path)

    // Ghép lại thành URL hoàn chỉnh
    $currentUrl = $protocol . $hostCurrent . $path;

    //dd($itemsMenu);

    $xhtmlMenu = '<ul id="main-menu" class="sm pixelstrap sm-horizontal">
                    <li>
                        <div class="mobile-back text-right">Back<i class="fa fa-angle-right pl-2"
                                aria-hidden="true"></i></div>
                    </li>';

    $categoryIdProduct          = (isset($categoryId)) ? $categoryId : '';
    $ancestorCategoryIdsProduct = (isset($ancestorCategoryIds)) ? $ancestorCategoryIds :'';

    $xhtmlMenu                 .= buildMenuSmartPhone($itemsMenu,$host,$currentUrl, $categoryProductNav,$ancestorCategoryIdsProduct,$categoryIdProduct);

    function buildMenuSmartPhone($itemsMenu,$host,$currentUrl,$categoryProductNav,$ancestorCategoryIdsProduct,$categoryIdProduct )
    {
        $xhtmlMenu = '';
        foreach($itemsMenu as $keyM=>$item){
            //dd($item);
            //$id  = $item['id'];
            //dd($item['id']);
            $hasChildren     = hasChildren($itemsMenu, number_format($item['id']));

            $menuUrl = $host . $item['url'];
            $homeUrlLocale = '';
            // Kiểm tra trạng thái "active"
            $classActive = ($currentUrl == $menuUrl || $currentUrl == $homeUrlLocale || hasActiveChild($itemsMenu, $item['id'], $currentUrl)) ? 'active' : '';

            $typeOpen        = '';
            $tmpTypeOpen     = Config::get('zvn.template.type_open');
            $typeOpen        = (array_key_exists($item['type_open'], $tmpTypeOpen)) ? $tmpTypeOpen[$item['type_open']] : '';

            if($hasChildren != 1 && $item['container'] == ''){

                $routeString        = $item['url'];

                $typeOpen           = $item['type_open'];
                $first_character    = substr($item['url'] , 0, 1);

                // Kiểm tra trạng thái "active"
                $classActive = ($currentUrl == $menuUrl || $currentUrl == $homeUrlLocale || hasActiveChild($itemsMenu, $item['id'], $currentUrl)) ? 'active' : '';

                if($first_character == '/'){
                    $xhtmlMenu     .= sprintf('<li class=""><a class="%s my-menu-link" href="'.$host.'%s" target="%s">%s</a></li>',$classActive,$routeString,$typeOpen,$item['name']);
                } else {
                    $xhtmlMenu     .= sprintf('<li><a class="%s my-menu-link" href="%s" target="%s">%s</a></li>',$classActive,$routeString,$typeOpen,$item['name']);
                }

            }else
            // Nếu có con, gọi đệ quy để xử lý menu con
            if ($hasChildren == 1) {
                $navChildLinkClass  = 'nav-link';

                $xhtmlMenu      .= '<li>
                                        <a class="'.$classActive.'" href="#">
                                            '.$item['name'].'
                                        </a>';

                $xhtmlMenu      .=      '<ul>';
                $xhtmlMenu      .=      buildMenuSmartPhone($item, $host, $currentUrl,$categoryProductNav,$ancestorCategoryIdsProduct,$categoryIdProduct);
                $xhtmlMenu      .=      '</ul>';

                $xhtmlMenu      .= '</li>';

            }else

            if($item['container'] != ''){
                $parentidCurrent = $item['id'];

                /*Tìm class active bằng việc kiểm tra phần tử con bằng cách gọi đệ quy
                    Nếu con có class active, thì cha sẽ được gắng class active */
                $classActiveCategoryFather = buildMenuCategory($categoryProductNav, $ancestorCategoryIdsProduct, $categoryIdProduct);
                if (strpos($classActiveCategoryFather, 'active') !== false) {
                    $classActiveCategoryFather = 'active';
                }else{
                    $classActiveCategoryFather = '';
                }

                $xhtmlMenu  .= '<li>
                                    <a class="'.$classActiveCategoryFather.'" href="#" id="navbarDropdown">
                                        '.$item['name'].'
                                    </a>';


                /*Nhóm lệnh để kiểm tra $item['container'] == 'category' vì $classActiveCategoryFather và  if($item['container'] == 'category') sử dụng phương thức trùng nhau
                    phải tắt $classActiveCategoryFather = buildMenuCategory($categoryProductNav, $ancestorCategoryIdsArticle, $categoryIdArticle) đi để tránh bị trả về kết quả nhầm lẫn khi đùng dd()*/
                /*End Nhóm lệnh kiểm tra*/
                if($item['container'] == 'category'){
                    //Đây là danh mục, category. Menu đa cấp của product sẽ đổ vào đây.
                    $xhtmlMenu .= buildMenuCategory($categoryProductNav, $ancestorCategoryIdsProduct , $categoryIdProduct);
                }

                // if($item['container'] == 'article'){
                //     $xhtmlMenu  .= '<ul class="dropdown-menu dropdown-submenu" role="menu">';
                //         foreach ($articleMenu as $keyArticle => $valArticle) {
                //             $articleLink = '';
                //             if($valArticle['slug'] != null){
                //                 $articleLink     = $host . '/' . $valArticle['slug'] . '.php';
                //             }else {
                //                 $articleLink     = URL::linkArticle($valArticle['id'],$valArticle['name']);
                //             }

                //             $xhtmlMenu      .= '<li><a class="nav-link '.$classActive.'" href="'.$articleLink.'">'.$valArticle['name'].'</a></li>';
                //         }
                //     $xhtmlMenu  .= '</ul>';
                // }

                $xhtmlMenu  .= '</li>';

            }
        }

        return $xhtmlMenu;
    }


    $xhtmlMenu .= '</ul>';

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


    function hasChildren($items, $parentId)
    {
        foreach ($items as $item) {
            if ($item['parent_id'] == $parentId) {
                return true;
            }
        }
        return false;
    }

    // Hàm kiểm tra xem có con active hay không
    function hasActiveChild($items, $parentId, $currentUrl)
    {
        //dd($items);
        global $host;
        foreach ($items as $item) {
            if ($item['parent_id'] == $parentId) {
                $menuUrl = $host . $item['url'];
                if($item['id'] == 1){
                    $menuUrl = $host ;
                }

                if ($menuUrl == $currentUrl || hasActiveChild($items, $item['id'], $currentUrl)) {
                    return true;
                }
            }
        }
        return false;
    }

    function hasActiveChildCategory($items, $parentId, $currentUrl)
    {
        // dd($items);
        global $host;
        foreach ($items as $item) {
            if ($item['parent_id'] == $parentId) {
                $menuUrl = $host .'/'.  $item['slug'] . '.php';
                if ($menuUrl == $currentUrl || hasActiveChildCategory($items, $item['id'], $currentUrl)) {
                    return true;
                }
            }
        }
        return false;
    }

    // Hàm đệ quy build Category ra menu
    function buildMenuCategory($itemsCategory,$ancestorCategoryIds, $categoryId)
    {
        //dd($itemsCategory);
        global $host;
        global $currentUrl;
        $xhtmlCategory = '<ul class="dropdown-menu dropdown-submenu" role="menu">';
        foreach ($itemsCategory as $keyCategory => $valueCategory) {
            $menuUrl = $host;
            if(!empty($valueCategory['slug'])){
                $menuUrl = $host . $valueCategory['slug'] . '.php';
            }
            // Kiểm tra URL của phần tử cha có khớp không
            $classActive = ($currentUrl == $menuUrl) ? 'active' : '';
            // Class active cho trường hợp truy vấn đến article
            if($ancestorCategoryIds != null || $categoryId != null){
                 // Kiểm tra xem danh mục hiện tại có nằm trong danh sách cha của category_id hay không
                $classActive = (in_array($valueCategory['id'], $ancestorCategoryIds) || $valueCategory['id'] == $categoryId) ? 'active' : '';
            }

            // Kiểm tra nếu bất kỳ phần tử con nào có class active
            if ($valueCategory['children'] != null) {
                $childActive = buildMenuCategory($valueCategory['children'], $ancestorCategoryIds, $categoryId);

                //Hàm strpos sẽ tìm xem, trong phép đệ quy menu con được return dưới dạng xhtml có chuỗi 'active' không
                // Nếu trong xhtml của phần tử con có class active, thì cha sẽ được gán class active
                if (strpos($childActive, 'active') !== false) {
                    $classActive = 'active';
                }

                $xhtmlCategory .= '<li><a class="nav-link ' . $classActive . '" href="' . $menuUrl . '">' . $valueCategory['name'] . '</a>';
                $xhtmlCategory .= $childActive;  // Gắn menu con
                $xhtmlCategory .= '</li>';
            } else {
                $xhtmlCategory .= '<li><a class="nav-link ' . $classActive . '" href="' . $menuUrl . '">' . $valueCategory['name'] . '</a></li>';
            }
        }

        $xhtmlCategory .= '</ul>';
        return $xhtmlCategory;
    }

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
                                    {{-- <ul id="main-menu" class="sm pixelstrap sm-horizontal">
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
                                    </ul> --}}
                                    {!! $xhtmlMenu !!}
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
