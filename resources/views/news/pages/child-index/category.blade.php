@foreach ($itemsCategory as $key=>$item)
    @if ($item['display'] == 'list')
        @include('news.pages.child-index.category_list')
    @elseif ($item['display'] == 'grid')
        @include('news.pages.child-index.category_grid')
    @endif
@endforeach

