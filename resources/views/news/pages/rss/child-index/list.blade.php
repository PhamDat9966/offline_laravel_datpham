@php
    use App\Helpers\Template as Template;
    use Illuminate\Support\Str;
@endphp

<div class="posts">
    <div class="col-lg-12">
        <div class="row">
            @foreach ($items as $item)
                @php
                    $name           = html_entity_decode($item['title']);
                    $name           = preg_replace('/&#\d+;/', '', $name);
                    $thumb          = $item['thumb'];
                    $link           = $item['link'];
                    $created_by     = '';
                    $created        = $item['pubDate'];
                    $content        = html_entity_decode(Template::showContent($item['description'], 300));
                    $created_by      = $item['created_by'];
                @endphp
                <div class="col-lg-6">
                    <div class="post_item post_v_small d-flex flex-column align-items-start justify-content-start">

                        {{-- images --}}
                        <div class="post_image">
                            <img src="{{ $thumb }}" alt="{{ $name }}" class="img-fluid w-100">
                        </div>

                        {{-- content --}}
                        <div class="post_content">
                            <div class="post_title"><a
                                    href="{{ $link }}">{{ $name }}</a></div>
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
                        {{-- end content --}}
                    </div>
                </div>

            @endforeach

        </div>
        <div class="row">
            <div class="home_button mx-auto text-center"><a href="the-loai/giao-duc-2.html">Xem
                thêm</a></div>
        </div>
    </div>
</div>

