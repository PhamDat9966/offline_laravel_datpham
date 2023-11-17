@php
    use App\Helpers\Template as Template;
    use Illuminate\Support\Str;

    $name               = $item['name'];
    $thumb              = asset('images/article/' . $item['thumb']);
    $categoryName       = $item['category_name'];
    $linkCategory       = '#';
    $linkArticle        = '#';
    $created            = Template::showDataFrontEnd($item['created']);
    $content            = Template::showContent($item['content'], $lenghtContent);
    $created_by         = 'Lưu Trường Hải Lân';
    $classPost          = Str::slug($categoryName);

@endphp
<div class="post_content">
    <div class="post_category cat_technology {{$classPost}}">
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
    @if ($lenghtContent > 0)
        <div class="post_text">
            <p>
                {{$content}}
            </p>
        </div>
    @endif
</div>
