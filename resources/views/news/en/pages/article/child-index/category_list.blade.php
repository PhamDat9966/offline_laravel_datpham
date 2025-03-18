@php
    use App\Helpers\Template as Template;
    use Illuminate\Support\Str;

@endphp
<div class="posts">
    @foreach ($item['related_article'] as $article)
        <div class="post_item post_h_large">
            <div class="row">
                <div class="col-lg-5">
                    @include('news.en.partials.article.image',['item'=>$article])
                </div>
                <div class="col-lg-7">
                    @include('news.en.partials.article.content',['item'=>$article,'lenghtContent'=> 200, 'showCategory'=>false])
                </div>
            </div>
        </div>
    @endforeach
</div>

<div class="row">
    <div class="home_button mx-auto text-center"><a href="the-loai/the-thao-1.html">Xem
        thêm</a></div>
</div>
