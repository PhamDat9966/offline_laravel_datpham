<!DOCTYPE html>
<html lang="en">
<head>
    @include('news.en.elements.head')
</head>
<body>
<div class="super_container">
    <!-- Header -->
    @include('news.en.elements.header')
    @yield('content')
    <!-- Footer -->
    @include('news.en.elements.footer')
</div>
    @include('news.en.elements.script')
</body>
</html>
