@php
    use App\Helpers\Template as Template;
    use Illuminate\Support\Str;
    use App\Helpers\URL;

    $name               = $item['name'];
    $thumb              = asset('images/article/' . $item['thumb']);

    $showCategory           = (isset($showCategory)) ? $showCategory : 'false';
    $categoryName           = $item['category_name']  = (isset($item['category_name'])) ? $item['category_name']:"";
    $item['category_id']    = (isset($item['category_id'])) ? $item['category_id']:"";

    $linkCategory       = URL::linkCategory($item['category_id'],$item['category_name']);
    $linkArticle        = '';
    if(!empty($item['slug'])){
        $linkArticle    = $item['slug'] . '.php';
    }else{
        $linkArticle    = URL::linkArticle($item['id'],$item['name']);
    }

    $created            = Template::showDataFrontEnd($item['created']);
    $content            = html_entity_decode(Template::showContent($item['content'], $lenghtContent));
    $created_by         = 'Lưu Trường Hải Lân';
    $classPost          = Str::slug($categoryName);

@endphp
<div class="post_content">
    @if($showCategory == true)
        <div class="post_category cat_technology {{$classPost}}">
            <a href="{{ $linkCategory }}">{{ $categoryName }}</a>
        </div>
    @endif
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
