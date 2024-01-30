@php
    use App\Models\CategoryModel as CategoryModel;
    use App\Models\MenuModel as MenuModel;
    use App\Helpers\URL;

    $MenuModel      = new MenuModel();
    $itemsMenu      = $MenuModel->listItems(null,['task'=>'news-list-items-navbar-menu']);

    $xhtmlMenu          = '';
    $xhtmlMenuMobile    = '';

    if(count($itemsMenu) > 0){
        $xhtmlMenu          .= '<nav class="main_nav"><ul class="main_nav_list d-flex flex-row align-items-center justify-content-start">';
        $xhtmlMenuMobile    .= '<nav class="menu_nav"><ul class="menu_mm">';
        $menuIdCurrent      = request()->menu_id;
        foreach ($itemsMenu as $item) {

            $typeOpen = '';
            $tmpTypeOpen     = Config::get('zvn.template.type_open');
            $typeOpen = (array_key_exists($item['type_open'], $tmpTypeOpen)) ? $tmpTypeOpen[$item['type_open']] : '';

            if($item['type_menu'] == 'link'){
                if($item['url'] == '/'){
                    $link                = route('home');
                    $classActive         = ($menuIdCurrent == $item['id']) ? 'class="active"' : '';
                    $xhtmlMenu          .= sprintf('<li %s><a href="%s" target="%s">%s</a></li>',$classActive,$link,$typeOpen,$item['name']);
                }
            }

            // Tạm thời xếp `category_article` và `category_product` chung một nhóm.
            if($item['type_menu'] == 'category_article' || $item['type_menu'] == 'category_product'){
                if($item['parent_id'] === null){
                    $parentidCurrent = $item['id'];
                    $xhtmlMenu  .= '<li class="dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-hover="dropdown" data-toggle="dropdown" data-delay="1000" aria-haspopup="true" aria-expanded="false">
                                            '.$item['name'].'
                                        </a>';
                        $xhtmlMenu  .= '<ul class="dropdown-menu" role="menu">';
                        foreach ($itemsMenu as $child) {
                            if($child['parent_id'] == $parentidCurrent){
                                $typeOpen = '';
                                $tmpTypeOpen     = Config::get('zvn.template.type_open');
                                $typeOpen = (array_key_exists($child['type_open'], $tmpTypeOpen)) ? $tmpTypeOpen[$child['type_open']] : '';

                                $link        = URL::linkCategory($child['url'],$item['name']);
                                $xhtmlMenu  .= sprintf('<li><a tabindex="-1" href="%s" target="%s">%s</a></li>',$link,$typeOpen,$child['name']);
                            }
                        }
                        $xhtmlMenu  .= '</li></ul>';
                    $xhtmlMenu  .= '</li>';
                }
            }

        }

        $xhtmlMenu          .= sprintf('<li><a href="%s">Tin Tức Tổng Hợp</a></li>',route('rss/index'));
        $xhtmlMenuMobile    .= sprintf('<li class="menu_mm"><a href="%s">Tin Tức Tổng Hợp</a></li>',route('rss/index'));

        $xhtmlMenuUser      = sprintf('<li><a href="%s">%s</a></li>',route('auth/login'),'Đăng Nhập');
        if(session('userInfo')){
            $xhtmlMenuUser  = sprintf('<li><a href="%s">%s</a></li>',route('auth/logout'),'Thoát');
        }

        $xhtmlMenu          .= $xhtmlMenuUser.'</ul></nav>';
        $xhtmlMenuMobile    .= $xhtmlMenuUser.'</ul></nav>';
    }

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
