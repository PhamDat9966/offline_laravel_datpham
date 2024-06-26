@php
    use App\Models\CategoryModel as CategoryModel;
    use App\Models\ArticleModel as ArticleModel;
    use App\Models\MenuModel as MenuModel;
    use App\Helpers\URL;
    use Illuminate\Http\Request;

    $request = Request::capture();
    global $host;
    $host = $request->getHost();
    $host = 'http://'.$host;
    $prefixNews     = config('zvn.url.prefix_news');
    if($prefixNews != null){
        $host = $host.'/'.$prefixNews;
    }

    $MenuModel      = new MenuModel();
    $itemsMenu      = $MenuModel->listItems(null,['task'=>'news-list-items-navbar-menu']);

    global $categoryMenu;
    $categoryModel  = new CategoryModel();
    $categoryMenu   = $categoryModel->listItems(null,['task'=>'news-list-items-navbar-menu']);

    global $articleMenu;
    $articleModel   = new ArticleModel();
    $articleMenu    = $articleModel->listItems(null,['task'=>'news-list-items-navbar-menu']);

    $xhtmlMenu          = '';
    $xhtmlMenuMobile    = '';

    global $xhtmlMenu;
    global $currentUrl;

    // Lấy giao thức (http hoặc https)
    $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";

    // Lấy tên máy chủ (domain)
    $hostCurrent = $_SERVER['HTTP_HOST'];

    // Lấy đường dẫn (path)
    $path = $_SERVER['REQUEST_URI'];

    // Ghép lại thành URL hoàn chỉnh
    $currentUrl = $protocol . $hostCurrent . $path;

    $xhtmlMenu  .= '<nav class="main_nav"><ul class="main_nav_list d-flex flex-row align-items-center justify-content-start">';

    // Hàm đệ quy để tạo menu
    function buildMenu($items, $parentId = null, $navLinkClass = null)
    {

        // Sử dụng global để tham chiếu đến biến toàn cục
        global $xhtmlMenu;
        global $categoryMenu;
        global $articleMenu;
        global $host;
        global $currentUrl;

        foreach ($items as $item) {

            if ($item['parent_id'] == $parentId) {
                // Kiểm tra xem có con hay không
                $hasChildren     = hasChildren($items, $item['id']);

                $menuUrl = $host . $item['url'];
                // Kiểm tra trạng thái "active"
                $classActive = ($currentUrl == $menuUrl || hasActiveChild($items, $item['id'], $currentUrl)) ? 'active' : '';

                $typeOpen        = '';
                $tmpTypeOpen     = Config::get('zvn.template.type_open');
                $typeOpen        = (array_key_exists($item['type_open'], $tmpTypeOpen)) ? $tmpTypeOpen[$item['type_open']] : '';

                if($hasChildren != 1 && $item['container'] == ''){

                    $routeString        = $item['url'];
                    $typeOpen           = $item['type_open'];
                    $first_character    = substr($item['url'] , 0, 1);
                    if($first_character == '/'){
                        $xhtmlMenu     .= sprintf('<li class=""><a class="%s %s" href="'.$host.'%s" target="%s">%s</a></li>',$classActive,$navLinkClass,$routeString,$typeOpen,$item['name']);
                    } else {
                        $xhtmlMenu     .= sprintf('<li %s><a class="%s" href="%s" target="%s">%s</a></li>',$classActive,$navLinkClass,$routeString,$typeOpen,$item['name']);
                    }
                }else
                // Nếu có con, gọi đệ quy để xử lý menu con
                if ($hasChildren == 1) {
                    $navChildLinkClass  = 'nav-link';

                    $xhtmlMenu      .= '<li class="dropdown">
                                            <a class="btn nav-link dropdown-toggle '.$classActive.'" href="#" id="navbarDropdown" role="button" data-hover="dropdown" data-toggle="dropdown" data-delay="1000" aria-haspopup="true" aria-expanded="false">
                                                '.$item['name'].'
                                            </a>';

                    $xhtmlMenu      .=      '<ul class="dropdown-menu dropdown-submenu" role="menu">';
                                            buildMenu($items, $item['id'], $navChildLinkClass);
                    $xhtmlMenu      .=      '</ul>';

                    $xhtmlMenu      .= '</li>';
                }else

                if($item['container'] != ''){
                    $parentidCurrent = $item['id'];
                    $xhtmlMenu  .= '<li class="dropdown">
                                        <a class="nav-link dropdown-toggle '.$classActive.'" href="#" id="navbarDropdown" role="button" data-hover="dropdown" data-toggle="dropdown" data-delay="1000" aria-haspopup="true" aria-expanded="false">
                                            '.$item['name'].'
                                        </a>';

                        if($item['container'] == 'category'){
                            $xhtmlMenu  .= '<ul class="dropdown-menu dropdown-submenu" role="menu">';
                                foreach ($categoryMenu as $keyCategory => $valCategory) {
                                    $categoryLink     = URL::linkCategory($valCategory['id'],$valCategory['name']);
                                    $xhtmlMenu      .= '<li><a class="nav-link '.$classActive.'" href="'.$categoryLink.'">'.$valCategory['name'].'</a></li>';
                                }
                            $xhtmlMenu  .= '</ul>';
                        }

                        if($item['container'] == 'article'){
                            $xhtmlMenu  .= '<ul class="dropdown-menu dropdown-submenu" role="menu">';
                                foreach ($articleMenu as $keyArticle => $valArticle) {
                                    $articleLink     = URL::linkArticle($valArticle['id'],$valArticle['name']);
                                    $xhtmlMenu      .= '<li><a class="nav-link '.$classActive.'" href="'.$articleLink.'">'.$valArticle['name'].'</a></li>';
                                }
                            $xhtmlMenu  .= '</ul>';
                        }

                    $xhtmlMenu  .= '</li>';
                }

            }
        }
    }

    // Hàm kiểm tra xem có con hay không
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
        global $host;
        foreach ($items as $item) {
            if ($item['parent_id'] == $parentId) {
                $menuUrl = $host . $item['url'];
                if ($menuUrl == $currentUrl || hasActiveChild($items, $item['id'], $currentUrl)) {
                    return true;
                }
            }
        }
        return false;
    }

    // Gọi hàm đệ quy để tạo menu từ mảng
    buildMenu($itemsMenu, null, null);

    // $xhtmlMenu          .= sprintf('<li><a href="%s">Tin Tức Tổng Hợp</a></li>',route('rss/index'));
    // $xhtmlMenuMobile    .= sprintf('<li class="menu_mm"><a href="%s">Tin Tức Tổng Hợp</a></li>',route('rss/index'));

    // $xhtmlMenu          .= sprintf('<li><a href="%s">Hình Ảnh</a></li>',route('galleryshow'));
    // $xhtmlMenuMobile    .= sprintf('<li class="menu_mm"><a href="%s">Hình Ảnh</a></li>',route('galleryshow'));

    $xhtmlMenuUser      = sprintf('<li><a href="%s">%s</a></li>',route('auth/login'),'Đăng Nhập');
    if(session('userInfo')){
        $xhtmlMenuUser  = sprintf('<li><a href="%s">%s</a></li>',route('auth/logout'),'Thoát');
    }

    $xhtmlMenu          .= $xhtmlMenuUser.'</ul></nav>';
    $xhtmlMenuMobile    .= $xhtmlMenuUser.'</ul></nav>';


    //--end--//

@endphp
<header class="header">
    <!-- Header Content -->
    <div class="header_content_container">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="header_content d-flex flex-row align-items-center justfy-content-start">
                        <div class="logo_container">
                            <a href="{!! route('home') !!}">
                                <div class="logo"><span>ZEND</span>VN</div>
                            </a>
                        </div>
                        <div class="header_extra ml-auto d-flex flex-row align-items-center justify-content-start">
                            <a href="#">
                                <div class="background_image"
                                     style="background-image:url({!!asset('news/images/zendvn-online.png')!!});background-size: contain"></div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Header Navigation & Search -->
    <div class="header_nav_container" id="header">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="header_nav_content d-flex flex-row align-items-center justify-content-start">
                        <!-- Logo -->
                        <div class="logo_container">
                            <a href="#">
                                <div class="logo"><span>ZEND</span>VN</div>
                            </a>
                        </div>
                        <!-- Navigation -->
                        {!! $xhtmlMenu !!}
                        <!-- Hamburger -->
                        <div class="hamburger ml-auto menu_mm"><i class="fa fa-bars  trans_200 menu_mm"
                                                                  aria-hidden="true"></i></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- Menu -->
<div class="menu d-flex flex-column align-items-end justify-content-start text-right menu_mm trans_400">
    <div class="menu_close_container">
        <div class="menu_close">
            <div></div>
            <div></div>
        </div>
    </div>
    {!!$xhtmlMenuMobile!!}
</div>
