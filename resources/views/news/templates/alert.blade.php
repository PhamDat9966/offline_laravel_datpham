@if (session('zvn_notily'))
    <div class="row">
            <div class="alert alert-danger" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                </button>
                <strong>{{session('zvn_notily')}}</strong>
            </div>
    </div>
@endif
