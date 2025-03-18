<!DOCTYPE html>
<html lang="en">
<head>
    @include('news.vi.elements.head')
</head>
<body>
<div class="super_container">
    <!-- Header -->
    @include('news.vi.elements.header')
    @yield('content')
    <!-- Footer -->
    @include('news.vi.elements.footer')
</div>
    @include('news.vi.elements.script')
</body>
</html>
