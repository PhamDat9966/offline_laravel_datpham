@php
    use App\Helpers\Template as Template;
    use App\Helpers\Hightlight as Hightlight;
@endphp

<div class="x_content">
    <div class="table-responsive">
        <table class="table table-striped jambo_table bulk_action">
            <thead>
                <tr class="headings">
                    <th class="column-title">#</th>
                    <th class="column-title">Product Info</th>
                    <th class="column-title">Thumb</th>
                    <th class="column-title">Category Name</th>
                    <th class="column-title">Trạng thái</th>
                    <th class="column-title">Hành động</th>
                </tr>
            </thead>
            <tbody>

                @if (count($items) > 0)
                    @foreach ($items as $key => $val)
                        @php
                           //dd($val);

                            $index              = $key+1;
                            $class              = ($index % 2 == 0)? 'even' : 'odd';

                            $id                 = $val['id'];
                            $name               = Hightlight::show($val['name'], $params['search'] , 'name');
                            $content            = Hightlight::show($val['description'], $params['search'] , 'description');
                            $slug               = Hightlight::show($val['slug'], $params['search'] , 'slug');

                            $categoryName       = Template::select('category_product_id', $id , $categoryList , $val['category_product_id'] , ['class' => 'form-control select-ajax', 'data-url' => route("$controllerName/change-category", ['id'=>$id,'category_product_id'=>'value_new'])]);
                            $miniThumb          = $val['thumb'];
                            $thumb              = Template::showItemThumb($controllerName,$miniThumb,$val['name']);
                            $status             = Template::showItemStatus( $controllerName,$id,$val['status']); // $controllerName đã được share tại SliderController.php
                            $type               = Template::showItemSelect( $controllerName,$id,$val['type'], 'type');
                            $listButtonAction   = Template::showButtonAction($controllerName, $id);
                        @endphp

                        <tr class="{{$class}} pointer">
                            <td>{{ $index }}</td>
                            <td width="30%">
                                <p><strong>Name:</strong> {!! $name !!}</p>
                                <p><strong>Slug:</strong> {!! $slug !!}</p>
                                <p><strong>Content:</strong> {!! $content !!}</p>
                            </td>
                            <td width="20%">
                                {!!$thumb!!}
                            </td>
                            <td width="15%">
                                {!!$categoryName!!}
                            </td>
                            <td>
                                {!!$status!!}
                            </td>
                            {{-- <td>{!!$createdHistory!!}</td>
                            <td>{!!$modifiedHistory!!} </td> --}}
                            <td class="last">
                                {!!$listButtonAction!!}
                            </td>
                        </tr>
                    @endforeach

                @else
                    @include('admin.templates.list_empty',['colspan'=>6])
                @endif

            </tbody>
        </table>
    </div>
</div>

