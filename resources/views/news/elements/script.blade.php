<script src="{{asset('news/js/jquery-3.2.1.min.js')}}"></script>
<script src="{{asset('news/css/bootstrap-4.1.2/popper.min.js')}}"></script>
<script src="{{asset('news/css/bootstrap-4.1.2/bootstrap.js')}}"></script>
<script src="{{asset('news/js/greensock/TweenMax.min.js')}}"></script>
<script src="{{asset('news/js/greensock/TimelineMax.min.js')}}"></script>
<script src="{{asset('news/js/scrollmagic/ScrollMagic.min.js')}}"></script>
<script src="{{asset('news/js/greensock/animation.gsap.min.js')}}"></script>
<script src="{{asset('news/js/greensock/ScrollToPlugin.min.js')}}"></script>
<script src="{{asset('news/js/OwlCarousel2-2.2.1/owl.carousel.js')}}"></script>
<script src="{{asset('news/js/easing/easing.js')}}"></script>
<script src="{{asset('news/js/parallax-js-master/parallax.min.js')}}"></script>
<script src="{{asset('news/js/custom.js')}}"></script>
<script src="{{asset('news/js/my-js.js')}}"></script>
{{-- Chỉ khởi động DailyTask khi controller là Rss --}}
@if($controllerName == 'rss')
    <script src="{{asset('news/js/rundailytask-js.js')}}"></script>
@endif

