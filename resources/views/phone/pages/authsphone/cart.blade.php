@php
    //dd($item);
@endphp

@extends('phone.main')

<!DOCTYPE html>
<html lang="en">

<head>
    @include('phone.elements.head')
</head>

<body>
    {{-- @include('phone.elements.loader-skeleton') --}}

    <!-- header start -->
    @include('phone.elements.header')
    <!-- header end -->
    @include('phone.pages.authsphone.child-index.cartView')

