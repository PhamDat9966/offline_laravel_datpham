@php
    //dd($itemCategoryArticle->toArray());
@endphp
@if ($itemCategoryArticle['display'] == 'list')
    @include('news.vi.pages.category_article.child-index.category_list',['item'=>$itemCategoryArticle,'lenghtContent'=> 500])
@elseif ($itemCategoryArticle['display'] == 'grid')
    @include('news.vi.pages.category_article.child-index.category_grid',['item'=>$itemCategoryArticle,'lenghtContent'=> 500])
@endif


