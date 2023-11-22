@php
    // echo '<pre>';
    // print_r($itemArticle);
    // echo '</pre>';

    use App\Helpers\Template as Template;
    use Illuminate\Support\Str;
    use App\Helpers\URL;

    $name               = $itemArticle['name'];
    $thumb              = asset('images/article/' . $itemArticle['thumb']);

    $showCategory           = (isset($showCategory)) ? $showCategory : 'false';
    $categoryName           = (isset($itemArticle['category_name'])) ? $itemArticle['category_name']:"";

    $linkCategory       = URL::linkCategory($itemArticle['category_id'],$itemArticle['category_name']);
    $linkArticle        = URL::linkArticle($itemArticle['id'],$itemArticle['name']);
    $created            = Template::showDataFrontEnd($itemArticle['created']);
    $content            = Template::showContent($itemArticle['content'], $lenghtContent);
    $created_by         = 'Lưu Trường Hải Lân';
    $classPost          = Str::slug($categoryName);

@endphp

<div class="post_image"><img src="{{$thumb}}" alt="{{$name}}" class="img-fluid w-100">
</div>
<div class="post_content">
    <div class="post_category cat_technology {{$classPost}}">
        <a href="{{$linkCategory}}">{{$categoryName}}</a>
    </div>
    <div class="post_title"><a href="{{$linkArticle}}">{{$name}}</a></div>
    <div class="post_info d-flex flex-row align-items-center justify-content-start">
        <div class="post_author d-flex flex-row align-items-center justify-content-start">
            <div class="post_author_name"><a href="bai-viet/man-city-van-du-champions-league-mua-2019-2020-15.html#">{{$created_by}}</a></div>
        </div>
        <div class="post_date"><a href="bai-viet/man-city-van-du-champions-league-mua-2019-2020-15.html#">{{$created}}</a>
        </div>
    </div>
    <div class="post_text">
        <p></p>
            <p>
                {{$content}}
            </p>
        <p></p>
    </div>
</div>
