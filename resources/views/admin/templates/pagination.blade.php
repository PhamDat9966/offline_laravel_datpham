@php
        // echo "<pre>(Pagination)";
        // print_r($items);
        // echo "</pre>";
        $total                  =   $items->total();
        $totalElementPerPage    =   $items->perPage();
        $totalPage              =   $items->lastPage();
        $currentPage            =   $items->currentPage()
@endphp
<div class="x_content">
    <div class="row">
        <div class="col-md-6">
            <p class="m-b-0">Số phần tử trên trang: <b>{!!$totalElementPerPage!!}</b> trên <span
                    class="label label-success label-pagination">{!!$currentPage!!} trang</span></p>
            <p class="m-b-0">Hiển thị<b> 1 </b> đến<b> 2</b> trên<b> {!!$total!!}</b> Phần tử</p>
        </div>
        <div class="col-md-6">
            {{ $items->links('admin.templates.pagination_zvn',['paginator'=>$items]) }}
            {{-- <nav aria-label="Page navigation example">
                <ul class="pagination zvn-pagination">
                    <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1">«</a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item active"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#">»</a>
                    </li>
                </ul>
            </nav> --}}
        </div>
    </div>
</div>
