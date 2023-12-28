@if ($itemCategory['display'] == 'list')
    @include('news.pages.category.child-index.category_list',['item'=>$itemCategory,'lenghtContent'=> 500])
@elseif ($itemCategory['display'] == 'grid')
    @include('news.pages.category.child-index.category_grid',['item'=>$itemCategory,'lenghtContent'=> 500])
@endif


