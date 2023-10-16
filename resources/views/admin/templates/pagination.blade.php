@php
    $total                  =   $items->total();
    $totalElementPerPage    =   $items->perPage();
    $totalPage              =   $items->lastPage();
    $currentPage            =   $items->currentPage();
    echo $items->links();
@endphp
<div class="x_content">
    <div class="row">
        <div class="col-md-6">
            <p class="m-b-0">Tông số phần tử là: <span
                class="label label-primary label-pagination">{{$total}}</span></p>
            <p class="m-b-0">Số phần tử trên trang <b>{{$currentPage}}</b> là: <span
                    class="label label-success label-pagination">{{$totalElementPerPage}}</span></p>
            <p class="m-b-0">Tổng số trang là: <span
                class="label label-danger label-pagination">{{$totalPage}}</span></p>
        </div>
        <div class="col-md-6">
            {{$items->links()}}
            {{-- {{ $items->links('pagination.pagination_backend',['paginator'=>$items]) }} --}}
            {{-- Mặc định $items->links() Nó sẽ tự động tao $paginator và $element...Bên trong nó --}}
        </div>
    </div>
</div>
