@extends('phone.main')


@section('content')
    @include('phone.pages.phoneItem.child-index.breadcrumb',['nameBreadcrumb'=>$item['name']])

    <section class="section-b-space">
        <div class="collection-wrapper">
            <div class="container">
                <div class="row">
                    <!-- phone item view -->
                    @include('phone.pages.phoneItem.child-index.phoneItem')
                    <!-- end phone item view -->

                    <div class="col-sm-3 collection-filter">
                        @include('phone.pages.phoneItem.child-index.servicePhoneItem')
                        @include('phone.block.phoneFeature',['productsFeature' => $productsFeature,
                                                                               'maxCount'  => 8
                                                                        ])
                        @include('phone.block.phoneNew')
                    </div>
                </div>

                <div class="row">
                    @include('phone.pages.phoneItem.child-index.relatedPhoneItem',['productsRelated' => $productsRelated])
                </div>

            </div>
        </div>
    </section>

    @include('phone.block.phonering')
    @include('phone.block.quick-view')
    @include('phone.block.message')

@endsection
