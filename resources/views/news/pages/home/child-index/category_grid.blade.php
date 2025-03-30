@php
    use App\Helpers\Template as Template;
    use Illuminate\Support\Str;
    $urlCategory = Route($controllerName) .'/'.$item['slug'].'.php';
@endphp
<div class="world">
    <div class="section_title_container d-flex flex-row align-items-start justify-content-start">
        <div>
            <div class="section_title">{{$item['name']}}</div>
        </div>
        <div class="section_bar"></div>
    </div>
    <div class="row world_row">
        <div class="col-lg-11">
            <div class="row">
                @foreach ($item['article'] as $article)

                    <div class="col-lg-6">
                        <div class="post_item post_v_small d-flex flex-column align-items-start justify-content-start">
                            @include('news.en.partials.article.image',['item'=>$article])
                            @include('news.en.partials.article.content',['item'=>$article,'lenghtContent'=> 200,'showCategory'=>false])
                        </div>
                    </div>

                @endforeach

            </div>
            <div class="row">
                <div class="home_button mx-auto text-center"><a href="{{$urlCategory}}">Read More</a></div>
            </div>
        </div>
    </div>
</div>
