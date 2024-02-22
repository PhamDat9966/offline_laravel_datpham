@php
    use App\Models\CategoryModel as CategoryModel;
    use App\Models\MenuModel as MenuModel;
    use App\Helpers\URL;

    $MenuModel      = new MenuModel();
    $itemsMenu      = $MenuModel->listItems(null,['task'=>'news-list-items-navbar-menu']);

    global $categoryMenu;
    $categoryModul  = new CategoryModel();
    $categoryMenu   = $categoryModul->listItems(null,['task'=>'news-list-items-navbar-menu']);

    $xhtmlMenu          = '';
    $xhtmlMenuMobile    = '';

    global $xhtmlMenu;
    global $menuIdCurrent;

    $menuIdCurrent      = request()->menu_id;

    $xhtmlMenu  .= '<nav class="main_nav"><ul class="main_nav_list d-flex flex-row align-items-center justify-content-start">';

    // Hàm đệ quy để tạo menu
    function buildMenu($items, $parentId = null, $navLinkClass = null)
    {

        // Sử dụng global để tham chiếu đến biến toàn cục
        global $xhtmlMenu;
        global $menuIdCurrent;
        global $categoryMenu;

        foreach ($items as $item) {
            if ($item['parent_id'] == $parentId) {

                // Kiểm tra xem có con hay không
                $hasChildren     = hasChildren($items, $item['id']);

                $link            = route('home');
                $classActive     = ($menuIdCurrent == $item['id']) ? 'class="active"' : '';

                $typeOpen        = '';
                $tmpTypeOpen     = Config::get('zvn.template.type_open');
                $typeOpen        = (array_key_exists($item['type_open'], $tmpTypeOpen)) ? $tmpTypeOpen[$item['type_open']] : '';

                if($hasChildren != 1 && $item['container'] == ''){

                    if($item['url'] == '/' || $item['url'] == null){
                        $xhtmlMenu      .= sprintf('<li %s><a class="%s" href="%s" target="%s">%s</a></li>',$classActive,$navLinkClass,$link,$typeOpen,$item['name']);
                    }

                    if($item['url'] != null && $item['url'] != '/'){
                        $routeString = $item['url'];

                        if (strpos($routeString, 'route(') !== false) {
                            $routeUrl = eval("return $routeString;");
                            $xhtmlMenu      .= sprintf('<li %s><a class="%s" href="%s" target="%s">%s</a></li>',$classActive,$navLinkClass,$routeUrl,$typeOpen,$item['name']);
                        } else {
                            $xhtmlMenu      .= sprintf('<li %s><a class="%s" href="%s" target="%s">%s</a></li>',$classActive,$navLinkClass,$routeString,$typeOpen,$item['name']);
                        }
                    }
                }
                // Nếu có con, gọi đệ quy để xử lý menu con
                if ($hasChildren == 1) {
                    $navChildLinkClass  = 'nav-link';

                    $xhtmlMenu      .= '<li class="dropdown">
                                            <a class="btn nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-hover="dropdown" data-toggle="dropdown" data-delay="1000" aria-haspopup="true" aria-expanded="false">
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
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-hover="dropdown" data-toggle="dropdown" data-delay="1000" aria-haspopup="true" aria-expanded="false">
                                            '.$item['name'].'
                                        </a>';

                        if($item['container'] == 'category'){
                            $xhtmlMenu  .= '<ul class="dropdown-menu dropdown-submenu" role="menu">';
                                foreach ($categoryMenu as $keyCategory => $valCategory) {
                                    $categoryLink     = URL::linkCategory($valCategory['id'],$valCategory['name']);
                                    $xhtmlMenu      .= '<li><a class="nav-link" href="'.$categoryLink.'">'.$valCategory['name'].'</a></li>';
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

    // Gọi hàm đệ quy để tạo menu từ mảng
    buildMenu($itemsMenu, null, null);

    //test url rounte của category và article
    $thethao        = route('category/index',[
                        'category_id'   =>  1,
                        'category_name' =>  'the-thao'
                    ]);
    $xhtmlMenu          .= sprintf('<li><a href="%s">Thể thaoTEST</a></li>',$thethao);
    $xhtmlMenuMobile    .= sprintf('<li class="menu_mm"><a href="%s">Thể thao</a></li>',$thethao);

    $baivietCaudo   = route('article/index',[
                        'article_id'   =>  16,
                        'article_name' =>  'nhung-cau-do'
                    ]);
    $xhtmlMenu          .= sprintf('<li><a href="%s">Câu đốTEST</li>',$baivietCaudo);
    $xhtmlMenuMobile    .= sprintf('<li class="menu_mm"><a href="%s">Câu đố rèn luyện</li>',$baivietCaudo);


    $xhtmlMenu          .= sprintf('<li><a href="%s">Tin Tức Tổng Hợp</a></li>',route('rss/index'));
    $xhtmlMenuMobile    .= sprintf('<li class="menu_mm"><a href="%s">Tin Tức Tổng Hợp</a></li>',route('rss/index'));

    $xhtmlMenuUser      = sprintf('<li><a href="%s">%s</a></li>',route('auth/login'),'Đăng Nhập');
    if(session('userInfo')){
        $xhtmlMenuUser  = sprintf('<li><a href="%s">%s</a></li>',route('auth/logout'),'Thoát');
    }

    $xhtmlMenu          .= $xhtmlMenuUser.'</ul></nav>';
    $xhtmlMenuMobile    .= $xhtmlMenuUser.'</ul></nav>';


    //--end--//


    // if(count($itemsMenu) > 0){
    //     $xhtmlMenu          .= '<nav class="main_nav"><ul class="main_nav_list d-flex flex-row align-items-center justify-content-start">';
    //     $xhtmlMenuMobile    .= '<nav class="menu_nav"><ul class="menu_mm">';
    //     $menuIdCurrent      = request()->menu_id;
    //     foreach ($itemsMenu as $item) {

    //         $typeOpen = '';
    //         $tmpTypeOpen     = Config::get('zvn.template.type_open');
    //         $typeOpen = (array_key_exists($item['type_open'], $tmpTypeOpen)) ? $tmpTypeOpen[$item['type_open']] : '';

    //         if($item['type_menu'] == 'link' || $item['type_menu'] == ''){
    //             if($item['url'] == '/'){
    //                 $link                = route('home');
    //                 $classActive         = ($menuIdCurrent == $item['id']) ? 'class="active"' : '';
    //                 $xhtmlMenu          .= sprintf('<li %s><a href="%s" target="%s">%s</a></li>',$classActive,$link,$typeOpen,$item['name']);
    //             }
    //         }

    //         // Tạm thời xếp `category_article` và `category_product` chung một nhóm.
    //         if($item['type_menu'] == 'category_article' || $item['type_menu'] == 'category_product'){

    //             // Hasn't child
    //             if($item['parent_id'] === null){
    //                 $parentidCurrent = $item['id'];
    //                 $xhtmlMenu  .= '<li class="dropdown">
    //                                     <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-hover="dropdown" data-toggle="dropdown" data-delay="1000" aria-haspopup="true" aria-expanded="false">
    //                                         '.$item['name'].'
    //                                     </a>';

    //                     if($item['container'] == 'category'){
    //                         $xhtmlMenu  .= '<ul class="dropdown-menu" role="menu">';
    //                             foreach ($categoryMenu as $keyCategory => $valCategory) {
    //                                 $categoryLink     = URL::linkCategory($valCategory['id'],$valCategory['name']);
    //                                 $xhtmlMenu      .= '<li><a href="'.$categoryLink.'">'.$valCategory['name'].'</a></li>';
    //                             }
    //                         $xhtmlMenu  .= '</ul>';
    //                     }

    //                 $xhtmlMenu  .= '</li>';
    //             }

    //             // Has child
    //             // if($item['parent_id'] === null){
    //             //     $parentidCurrent = $item['id'];
    //             //     $xhtmlMenu  .= '<li class="dropdown">
    //             //                         <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-hover="dropdown" data-toggle="dropdown" data-delay="1000" aria-haspopup="true" aria-expanded="false">
    //             //                             '.$item['name'].'
    //             //                         </a>';
    //             //         $xhtmlMenu  .= '<ul class="dropdown-menu" role="menu">';
    //             //         foreach ($itemsMenu as $child) {
    //             //             if($child['parent_id'] == $parentidCurrent){
    //             //                 $typeOpen = '';
    //             //                 $tmpTypeOpen     = Config::get('zvn.template.type_open');
    //             //                 $typeOpen = (array_key_exists($child['type_open'], $tmpTypeOpen)) ? $tmpTypeOpen[$child['type_open']] : '';

    //             //                 $link        = URL::linkMenu($child['url'],$item['name']);
    //             //                 $xhtmlMenu  .= sprintf('<ul><a tabindex="-1" href="%s" target="%s">%s</a>',$link,$typeOpen,$child['name']);

    //             //                 //Container

    //             //                 $xhtmlMenu  .='</ul>';
    //             //             }
    //             //         }
    //             //         $xhtmlMenu  .= '</li></ul>';
    //             //     $xhtmlMenu  .= '</li>';
    //             // }


    //         }

    //     }

    //     $xhtmlMenu          .= sprintf('<li><a href="%s">Tin Tức Tổng Hợp</a></li>',route('rss/index'));
    //     $xhtmlMenuMobile    .= sprintf('<li class="menu_mm"><a href="%s">Tin Tức Tổng Hợp</a></li>',route('rss/index'));

    //     $xhtmlMenuUser      = sprintf('<li><a href="%s">%s</a></li>',route('auth/login'),'Đăng Nhập');
    //     if(session('userInfo')){
    //         $xhtmlMenuUser  = sprintf('<li><a href="%s">%s</a></li>',route('auth/logout'),'Thoát');
    //     }

    //     $xhtmlMenu          .= $xhtmlMenuUser.'</ul></nav>';
    //     $xhtmlMenuMobile    .= $xhtmlMenuUser.'</ul></nav>';
    // }



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
