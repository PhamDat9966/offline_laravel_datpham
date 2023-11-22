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
<div class="single_post">
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
    <div class="section_title_container d-flex flex-row align-items-start justify-content-start zvn-title-category">
        <div>
            <div class="section_title">Bài viết liên quan</div>
        </div>
        <div class="section_bar"></div>
    </div>
    <div class="post_item post_h_large">
        <div class="row">
            <div class="col-lg-5">
                <div class="post_image"><img src="images/article/e7YyFZJCc8.jpeg" alt="images/article/e7YyFZJCc8.jpeg" class="img-fluid w-100"></div>
            </div>
            <div class="col-lg-7">
                <div class="post_content">
                    <div class="post_category cat_technology ">
                        <a href="the-loai/the-thao-1.html">Thể thao</a>
                    </div>
                    <div class="post_title"><a href="bai-viet/ha-noi-vao-vong-knock-out-afc-cup-14.html">Hà Nội vào
                        vòng knock-out AFC Cup</a></div>
                    <div class="post_info d-flex flex-row align-items-center justify-content-start">
                        <div class="post_author d-flex flex-row align-items-center justify-content-start">
                            <div class="post_author_name"><a href="bai-viet/man-city-van-du-champions-league-mua-2019-2020-15.html#">Lưu
                                Trường Hải Lân</a></div>
                        </div>
                        <div class="post_date"><a href="bai-viet/man-city-van-du-champions-league-mua-2019-2020-15.html#">10/05/2019</a>
                        </div>
                    </div>
                    <div class="post_text">
                        <p>ĐKVĐ V-League đánh bại&nbsp;Tampines Rovers 2-0 vào chiều 15/5 để
                            đứng đầu bảng F.
                            Tiếp đối thủ đến từ Singapore trong tình thế buộc phải thắng để tự
                            quyết vé đi tiếp, Hà Nội đã có trận đấu dễ dàng. Có thể nói, kết...
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


