@php

@endphp
<div class="featured">
    <div class="featured_title">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="section_title_container d-flex flex-row align-items-start justify-content-start">
                        <div>
                            <div class="section_title">Nổi bậc</div>
                        </div>
                        <div class="section_bar"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Featured Title -->
    <div class="row">
        <div class="col-lg-8">
            @php
                use App\Helpers\Template as Template;

                $itemFeaturedFirst  = $items[0];
                $name               = $itemFeaturedFirst['name'];
                $thumb              = asset('images/article/' . $itemFeaturedFirst['thumb']);
                $categoryName       = $itemFeaturedFirst['category_name'];

                $linkCategory       = '#';
                $linkArticle        = '#';

                $created            = Template::showDataFrontEnd($itemFeaturedFirst['created']);
                $content            = Template::showContent($itemFeaturedFirst['content'], 500);

                $created_by         = 'Lưu Trường Hải Lân';
            @endphp
            <!-- Post -->
            <div class="post_item post_v_large d-flex flex-column align-items-start justify-content-start">
                <div class="post_item post_v_small d-flex flex-column align-items-start justify-content-start">
                    <div class="post_image"><img src="{{ $thumb }}"
                                                 alt="{{ $name }}"
                                                 class="img-fluid w-100"></div>
                    <div class="post_content">
                        <div class="post_category cat_technology ">
                            <a href="{{ $linkCategory }}">{{ $categoryName }}</a>
                        </div>
                        <div class="post_title"><a
                                href="{{ $linkArticle }}">{{ $name }}</a></div>
                        <div class="post_info d-flex flex-row align-items-center justify-content-start">
                            <div class="post_author d-flex flex-row align-items-center justify-content-start">
                                <div class="post_author_name"><a href="#">{{ $created_by }}</a>
                                </div>
                            </div>
                            <div class="post_date"><a href="#">{{$created}}</a></div>
                        </div>
                        <div class="post_text">
                            <p>
                                {{$content}}
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div>
                <div class="post_item post_v_small d-flex flex-column align-items-start justify-content-start">
                    <div class="post_image"><img src="{!!asset('news/images/article/iQ1RXPioFZ.jpeg')!!}"
                                                 alt="{!!asset('news/images/article/iQ1RXPioFZ.jpeg')!!}"
                                                 class="img-fluid w-100"></div>
                    <div class="post_content">
                        <div class="post_category cat_technology ">
                            <a href="the-loai/the-thao-1.html">Thể thao</a>
                        </div>
                        <div class="post_title"><a
                                href="bai-viet/bottas-gianh-pole-chang-thu-ba-lien-tiep-5.html">Bottas
                            giành pole chặng thứ ba liên tiếp</a></div>
                        <div class="post_info d-flex flex-row align-items-center justify-content-start">
                            <div class="post_author d-flex flex-row align-items-center justify-content-start">
                                <div class="post_author_name"><a href="#">Lưu Trường Hải Lân</a>
                                </div>
                            </div>
                            <div class="post_date"><a href="#">28/04/2019</a></div>
                        </div>
                        <div class="post_text">
                            <p></p>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <div class="post_item post_v_small d-flex flex-column align-items-start justify-content-start">
                    <div class="post_image"><img src="{!!asset('news/images/article/hoyOyXJrzx.png')!!}"
                                                 alt="{!!asset('news/images/article/hoyOyXJrzx.png')!!}"
                                                 class="img-fluid w-100"></div>
                    <div class="post_content">
                        <div class="post_category cat_technology ">
                            <a href="the-loai/giao-duc-2.html">Giáo dục</a>
                        </div>
                        <div class="post_title"><a
                                href="bai-viet/dai-hoc-anh-dua-khoa-hoc-hanh-phuc-vao-chuong-trinh-giang-day-7.html">Đại
                            học Anh đưa khóa học hạnh phúc vào chương trình giảng dạy</a></div>
                        <div class="post_info d-flex flex-row align-items-center justify-content-start">
                            <div class="post_author d-flex flex-row align-items-center justify-content-start">
                                <div class="post_author_name"><a href="#">Lưu Trường Hải Lân</a>
                                </div>
                            </div>
                            <div class="post_date"><a href="#">05/05/2019</a></div>
                        </div>
                        <div class="post_text">
                            <p></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
