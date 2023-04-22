<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Hambren || One Stop Shopping Center</title>
    <meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="/assets/images/logo/hambren.png">

    <!-- CSS
    ============================================ -->

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="/assets/css/vendor/font-awesome.css">
    <link rel="stylesheet" href="/assets/css/vendor/flaticon/flaticon.css">
    <link rel="stylesheet" href="/assets/css/vendor/slick.css">
    <link rel="stylesheet" href="/assets/css/vendor/slick-theme.css">
    <link rel="stylesheet" href="/assets/css/vendor/jquery-ui.min.css">
    <link rel="stylesheet" href="/assets/css/vendor/sal.css">
    <link rel="stylesheet" href="/assets/css/vendor/magnific-popup.css">
    <link rel="stylesheet" href="/assets/css/vendor/base.css">
    <link rel="stylesheet" href="/assets/css/style.min.css">
    <link rel="stylesheet" type="text/css" href="/assets/custom/style.css?d={$version}"">
    <link rel="stylesheet" href="/assets/css/custom.css?d={$version}">
</head>


<body class="sticky-header newsletter-popup-modal">

<!--[if lte IE 9]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
<![endif]-->
<a href="/#top" class="back-to-top" id="backto-top"><i class="fal fa-arrow-up"></i></a>
<header class="header axil-header header-style-1">
{*    <div class="header-top-campaign">*}
{*        <div class="container position-relative">*}
{*            <div class="campaign-content">*}
{*                <p>Open Doors To A World Of Fashion <a href="/#">Discover More</a></p>*}
{*            </div>*}
{*        </div>*}
{*        <button class="remove-campaign"><i class="fal fa-times"></i></button>*}
{*    </div>*}
    {if ! isset($no_navigation)}
    <div class="axil-header-top" style="background:#333; color: #fafafa">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-sm-6 d-none d-md-block d-lg-block d-xl-block">
                    <div class="header-top-dropdown">
                        <div class="dropdown">
                            <button class="dropdown-toggle text-white" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                English
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="/#">English</a></li>

                            </ul>
                        </div>
                        <div class="dropdown">
                            <button class="dropdown-toggle text-white" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                USD
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="/#">USD</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="header-top-link">
                        <ul class="quick-link">
                            <li><a href="/contact_us#" class="text-white">Help</a></li>
                            <li class="d-none d-md-block d-lg-block d-xl-block"><a href="/profile" class="text-white">Join Us</a></li>
                            <li><a href="/profile" class="text-white">Sign In</a></li>
                            <li><a href="/register" class="text-white">Become Vendor</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Start Mainmenu Area  -->
    <div id="axil-sticky-placeholder"></div>
    <div class="axil-mainmenu" style="padding: 0" >
        <div class="container" style="max-width: 100%; min-width: 100%; margin:0; padding: 0; background: ">
            <div class="header-navbar" style="border-radius: 0; width:100%">
                <div class="header-brand">

                    <a href="/" class="logo logo-dark">
                        <img src="/assets/images/logo/hambren.png"  alt="Site Logo">
                    </a>
                    <a href="/" class="logo logo-light">
                        <img src="/assets/images/logo/hambren.png"  alt="Site Logo">
                    </a>
                </div>
                <div class="header-main-nav">
                    <!-- Start Mainmanu Nav -->
                    <nav class="mainmenu-nav">
                        <button class="mobile-close-btn mobile-nav-toggler"><i class="fas fa-times"></i></button>
                        <div class="mobile-nav-brand">
                            <a href="index.html" class="logo">
                                <img src="/assets/images/logo/hambren.png" alt="Site Logo">
                            </a>
                        </div>
                        <ul class="mainmenu">
                            <li class="">
                                <a href="/featured">New Arrivals</a>
                            </li>
                            <li class="">
                                <a href="/special_offer">Best Sellers</a>
                            </li>
{*                            <li class="">*}
{*                                <a href="/">New Arrivals</a>*}
{*                            </li>*}
                            <li class="d-lg-none d-md-none d-sm-block">
                                <a href="/register">Become vendor</a>
                            </li>
                            <li class="menu-item-has-children">
                                <a href="#">Categories</a>
                                <ul class="axil-submenu">
                                    {foreach $categories as $item}
                                        <li class="">
                                            <a href="/{$item['url']}">{$item['category']}</a>
                                        </li>
                                    {/foreach}
                                </ul>
                            </li>

                        </ul>
                    </nav>
                    <!-- End Mainmanu Nav -->
                </div>
                <div class="header-action">
                    <ul class="action-list">
                        <li class="axil-search search-small-screen">
                            <input type="search" class="placeholder product-search-input" name="search2" id="search2" value="{if isset($smarty.get.q)} {$smarty.get.q} {/if}" value="" maxlength="128" placeholder="What are you looking for?" autocomplete="off">
                            <button type="submit" class="icon wooc-btn-search">
                                <i class="flaticon-magnifying-glass"></i>
                            </button>
                        </li>
                        <li class="shopping-cart">
                            <a href="/wishlist" class="cart-dropdown-btn">
                                <span class="cart-count watchlist">0</span>
                                <i class="flaticon-heart text-white"></i>
                            </a>
                        </li>
                        <li class="shopping-cart">
                            <a href="#" onclick="rightCart(1)" class="cart-dropdown-btn">
                                <span class="cart-count cart">0</span>
                                <i class="flaticon-shopping-cart text-white"></i>
                            </a>
                        </li>
                        <li class="my-account">
                            <a href="javascript:void(0)">
                                <i class="flaticon-person text-white"></i>
                            </a>
                            <div class="my-account-dropdown">
                                <span class="title">QUICKLINKS</span>
                                <ul>
                                    <li>
                                        <a href="/profile">My Account</a>
                                    </li>
{*                                    <li>*}
{*                                        <a href="/#">Initiate return</a>*}
{*                                    </li>*}
{*                                    <li>*}
{*                                        <a href="/#">Support</a>*}
{*                                    </li>*}
{*                                    <li>*}
{*                                        <a href="/#">Language</a>*}
                                    </li>
                                </ul>
                                <div class="login-btn">
                                    <a href="/login" class="axil-btn btn-bg-primary">Login</a>
                                </div>
                                <div class="reg-footer text-center">No account yet? <a href="/profile" class="btn-link">REGISTER HERE.</a></div>
                            </div>
                        </li>
                        <li class="axil-mobile-toggle">
                            <button class="menu-btn mobile-nav-toggler">
                                <i class="flaticon-menu-2 text-white"></i>
                            </button>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Mainmenu Area -->
</header>
{/if}
{block name="body"}{/block}
{if ! isset($no_navigation)}
<div class="service-area">
    <div class="container">
        <div class="row row-cols-xl-4 row-cols-sm-2 row-cols-1 row--20">
            <div class="col">
                <div class="service-box service-style-2">
                    <div class="icon">
                        <img src="/assets/images/icons/service1.png" alt="Service">
                    </div>
                    <div class="content">
                        <h6 class="title">Fast &amp; Secure Delivery</h6>
                        <p>Tell about your service.</p>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="service-box service-style-2">
                    <div class="icon">
                        <img src="/assets/images/icons/service2.png" alt="Service">
                    </div>
                    <div class="content">
                        <h6 class="title">Money Back Guarantee</h6>
                        <p>Within 10 days.</p>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="service-box service-style-2">
                    <div class="icon">
                        <img src="/assets/images/icons/service3.png" alt="Service">
                    </div>
                    <div class="content">
                        <h6 class="title">24 Hour Return Policy</h6>
                        <p>No question ask.</p>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="service-box service-style-2">
                    <div class="icon">
                        <img src="/assets/images/icons/service4.png" alt="Service">
                    </div>
                    <div class="content">
                        <h6 class="title">Pro Quality Support</h6>
                        <p>24/7 Live support.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Start Footer Area  -->
<footer class="axil-footer-area footer-style-2">
    <!-- Start Footer Top Area  -->
    <div class="footer-top separator-top">
        <div class="container">
            <div class="row">
                <!-- Start Single Widget  -->
                <div class="col-lg-3 col-sm-6">
                    <div class="axil-footer-widget">
                        <h5 class="widget-title" style="color: white">Support</h5>
                        <!-- <div class="logo mb--30">
                        <a href="index.html">
                            <img class="light-logo" src="/assets/images/logo/logo.png" alt="Logo Images">
                        </a>
                    </div> -->
                        <div class="inner">
                            <p>Canada Ontario Toronto<br/>
                                Phone: +1 (437) 980-3253
                                <br/>
                                Email: sales@hambren.com
                                <br/>
                                email: vendor@hambren.com
                            </p>
                        </div>
                    </div>
                </div>
                <!-- End Single Widget  -->
                <!-- Start Single Widget  -->
                <div class="col-lg-3 col-sm-6">
                    <div class="axil-footer-widget">
                        <h5 class="widget-title" style="color: white">Account</h5>
                        <div class="inner">
                            <ul>
                                <li><a href="/profile">My Account</a></li>
                                <li><a href="/login">Login / Register</a></li>
                                <!--  <li><a href="/cart">Cart</a></li>
                                <li><a href="/wishlist">Wishlist</a></li>
                                <li><a href="/shop">Shop</a></li> -->
                                <li><a href="/register">Become Vendor</a></li>
                                <li><a href="/how-to-sell">How to sell with Hambren</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- End Single Widget  -->
                <!-- Start Single Widget  -->
                <div class="col-lg-3 col-sm-6">
                    <div class="axil-footer-widget">
                        <h5 class="widget-title" style="color: white">Quick Link</h5>
                        <div class="inner">
                            <ul>
                                <li><a href="/about_us">About us</a></li>
                                <li><a href="/privacy_policy">Privacy Policy</a></li>
                                <li><a href="/terms_of_us">Terms Of Use</a></li>
                                <li><a href="/contact_us">Contact</a></li>
                                <li><a href="/faq#">FAQ</a></li>

                            </ul>
                        </div>
                    </div>
                </div>
                <!-- End Single Widget  -->
                <!-- Start Single Widget  -->
                <div class="col-lg-3 col-sm-6">
                    <div class="axil-footer-widget">
                        <h5 class="widget-title" style="color: white">Download App</h5>
                        <div class="inner">
                            <span>Save $3 With App & New User only</span>
                            <div class="download-btn-group">
                                <div class="qr-code">
                                    <img src="/assets/images/others/qr.png" alt="Axilthemes">
                                </div>
                                <div class="app-link">
                                    <a href="/#">
                                        <img src="/assets/images/others/app-store.png" alt="App Store">
                                    </a>
                                    <a href="/#">
                                        <img src="/assets/images/others/play-store.png" alt="Play Store">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Single Widget  -->
            </div>
        </div>
    </div>
    <!-- End Footer Top Area  -->
    <!-- Start Copyright Area  -->
    <div class="copyright-area copyright-default separator-top">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-xl-4">
                    <div class="social-share">
                        <a href="/#"><i class="fab fa-facebook-f"></i></a>
                        <a href="/#"><i class="fab fa-instagram"></i></a>
                        <a href="/#"><i class="fab fa-twitter"></i></a>
                        <a href="/#"><i class="fab fa-linkedin-in"></i></a>
                        <a href="/#"><i class="fab fa-discord"></i></a>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-12">
                    <div class="copyright-left d-flex flex-wrap justify-content-center">
                        <ul class="quick-link">
                            <li>© 2022. All rights reserved by <a target="_blank" href="/">Hambren</a>.</li>
                        </ul>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-12">
                    <div class="copyright-right d-flex flex-wrap justify-content-xl-end justify-content-center align-items-center">
                        <span class="card-text">Accept For</span>
                        <ul class="payment-icons-bottom quick-link">
                            <li><img src="/assets/images/icons/cart/cart-1.png" alt="paypal cart"></li>
                            <li><img src="/assets/images/icons/cart/cart-2.png" alt="paypal cart"></li>
                            <li><img src="/assets/images/icons/cart/cart-5.png" alt="paypal cart"></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Copyright Area  -->

</footer>

<!-- End Footer Area  -->

<!-- Product Quick View Modal Start -->
<div class="modal fade quick-view-product" id="quick-view-modal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"><i class="far fa-times"></i></button>
            </div>
            <div class="modal-body">
                <div class="single-product-thumb">
                    <div class="row">
                        <div class="col-lg-7 mb--40">
                            <div class="row">
                                <div class="col-lg-10 order-lg-2">
                                    <div class="single-product-thumbnail product-large-thumbnail axil-product thumbnail-badge zoom-gallery">
                                        <div class="thumbnail">
                                            <img src="/assets/images/product/product-big-01.png" alt="Product Images">
                                            <div class="label-block label-right">
                                                <div class="product-badget">20% OFF</div>
                                            </div>
                                            <div class="product-quick-view position-view">
                                                <a href="/assets/images/product/product-big-01.png" class="popup-zoom">
                                                    <i class="far fa-search-plus"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="thumbnail">
                                            <img src="/assets/images/product/product-big-02.png" alt="Product Images">
                                            <div class="label-block label-right">
                                                <div class="product-badget">20% OFF</div>
                                            </div>
                                            <div class="product-quick-view position-view">
                                                <a href="/assets/images/product/product-big-02.png" class="popup-zoom">
                                                    <i class="far fa-search-plus"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="thumbnail">
                                            <img src="/assets/images/product/product-big-03.png" alt="Product Images">
                                            <div class="label-block label-right">
                                                <div class="product-badget">20% OFF</div>
                                            </div>
                                            <div class="product-quick-view position-view">
                                                <a href="/assets/images/product/product-big-03.png" class="popup-zoom">
                                                    <i class="far fa-search-plus"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-2 order-lg-1">
                                    <div class="product-small-thumb small-thumb-wrapper">
                                        <div class="small-thumb-img">
                                            <img src="/assets/images/product/product-thumb/thumb-08.png" alt="thumb image">
                                        </div>
                                        <div class="small-thumb-img">
                                            <img src="/assets/images/product/product-thumb/thumb-07.png" alt="thumb image">
                                        </div>
                                        <div class="small-thumb-img">
                                            <img src="/assets/images/product/product-thumb/thumb-09.png" alt="thumb image">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-5 mb--40">
                            <div class="single-product-content">
                                <div class="inner">
                                    <div class="product-rating">
                                        <div class="star-rating">
                                            <img src="/assets/images/icons/rate.png" alt="Rate Images">
                                        </div>
                                        <div class="review-link">
                                            <a href="/#">(<span>1</span> customer reviews)</a>
                                        </div>
                                    </div>
                                    <h3 class="product-title">Serif Coffee Table</h3>
                                    <span class="price-amount">$155.00 - $255.00</span>
                                    <ul class="product-meta">
                                        <li><i class="fal fa-check"></i>In stock</li>
                                        <li><i class="fal fa-check"></i>Free delivery available</li>
                                        <li><i class="fal fa-check"></i>Sales 30% Off Use Code: MOTIVE30</li>
                                    </ul>
                                    <p class="description">In ornare lorem ut est dapibus, ut tincidunt nisi pretium. Integer ante est, elementum eget magna. Pellentesque sagittis dictum libero, eu dignissim tellus.</p>

                                    <div class="product-variations-wrapper">

                                        <!-- Start Product Variation  -->
                                        <div class="product-variation">
                                            <h6 class="title">Colors:</h6>
                                            <div class="color-variant-wrapper">
                                                <ul class="color-variant mt--0">
                                                    <li class="color-extra-01 active"><span><span class="color"></span></span>
                                                    </li>
                                                    <li class="color-extra-02"><span><span class="color"></span></span>
                                                    </li>
                                                    <li class="color-extra-03"><span><span class="color"></span></span>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- End Product Variation  -->

                                        <!-- Start Product Variation  -->
                                        <div class="product-variation">
                                            <h6 class="title">Size:</h6>
                                            <ul class="range-variant">
                                                <li>xs</li>
                                                <li>s</li>
                                                <li>m</li>
                                                <li>l</li>
                                                <li>xl</li>
                                            </ul>
                                        </div>
                                        <!-- End Product Variation  -->

                                    </div>

                                    <!-- Start Product Action Wrapper  -->
                                    <div class="product-action-wrapper d-flex-center">
                                        <!-- Start Quentity Action  -->
                                        <div class="pro-qty"><input type="text" value="1"></div>
                                        <!-- End Quentity Action  -->

                                        <!-- Start Product Action  -->
                                        <ul class="product-action d-flex-center mb--0">
                                            <li class="add-to-cart"><a href="#" class="axil-btn btn-bg-primary">Add to Cart</a></li>
                                            <li class="wishlist"><a href="#" class="axil-btn wishlist-btn"><i class="far fa-heart"></i></a></li>
                                        </ul>
                                        <!-- End Product Action  -->

                                    </div>
                                    <!-- End Product Action Wrapper  -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Product Quick View Modal End -->

<!-- Header Search Modal End -->
<div class="header-search-modal" id="header-search-modal">
    <button class="card-close sidebar-close"><i class="fas fa-times"></i></button>
    <div class="header-search-wrap">
        <div class="card-header">
            <form action="//{$smarty.server.SERVER_NAME}/search/products" method="get">
                <div class="input-group">
                    <input type="search" value="{if isset($smarty.get.q)}{$smarty.get.q}{/if}" class="form-control" name="q" id="prod-search" onkeyup="searchBProducts(this)" onkeydown="searchBProducts(this)" placeholder="Write Something....">
                    <button type="submit" class="axil-btn btn-bg-primary"><i class="far fa-search"></i></button>
                </div>
            </form>
        </div>
        <div class="card-body">
{*            <div class="search-result-header">*}
{*                <h6 class="title">0 Result Found</h6>*}
{*                <a href="/shop" class="view-all">View All</a>*}
{*            </div>*}
            <div class="psearch-results" id="">
{*                <div class="axil-product-list">*}
{*                    <div class="thumbnail">*}
{*                        <a href="single-product.html">*}
{*                            <img src="/assets/images/product/electric/product-09.png" alt="Yantiti Leather Bags">*}
{*                        </a>*}
{*                    </div>*}
{*                    <div class="product-content">*}
{*                        <div class="product-rating">*}
{*                                <span class="rating-icon">*}
{*                                <i class="fas fa-star"></i>*}
{*                                <i class="fas fa-star"></i>*}
{*                                <i class="fas fa-star"></i>*}
{*                                <i class="fas fa-star"></i>*}
{*                                <i class="fal fa-star"></i>*}
{*                            </span>*}
{*                            <span class="rating-number"><span>100+</span> Reviews</span>*}
{*                        </div>*}
{*                        <h6 class="product-title"><a href="single-product.html">Media Remote</a></h6>*}
{*                        <div class="product-price-variant">*}
{*                            <span class="price current-price">$29.99</span>*}
{*                            <span class="price old-price">$49.99</span>*}
{*                        </div>*}
{*                        <div class="product-cart">*}
{*                            <a href="cart.html" class="cart-btn"><i class="fal fa-shopping-cart"></i></a>*}
{*                            <a href="wishlist.html" class="cart-btn"><i class="fal fa-heart"></i></a>*}
{*                        </div>*}
{*                    </div>*}
{*                </div>*}
            </div>
        </div>
    </div>
</div>
<!-- Header Search Modal End -->


<div class="cart-dropdown" id="cart-dropdown">
    <div class="cart-content-wrap">
        <div class="cart-header">
            <h2 class="header-title">Cart review</h2>
            <button class="cart-close sidebar-close"><i class="fas fa-times"></i></button>
        </div>
        <div class="cart-body-1">

        </div>
    </div>
</div>

<!-- Offer Modal Start -->
<div class="offer-popup-modal" id="offer-popup-modal">
    <div class="offer-popup-wrap">
        <div class="card-body">
            <button class="popup-close"><i class="fas fa-times"></i></button>
            <div class="content">
                <div class="section-title-wrapper">
                    <span class="title-highlighter highlighter-primary"> <i class="far fa-shopping-basket"></i> Don’t Miss!!</span>
                    <h3 class="title">Best Sales Offer<br> Grab Yours</h3>
                </div>
                <div class="poster-countdown countdown"></div>
                <a href="/shop" class="axil-btn btn-bg-primary">Shop Now <i class="fal fa-long-arrow-right"></i></a>
            </div>
        </div>
    </div>
</div>
<div class="closeMask"></div>
{/if}
<div class="bottom-pop-up-overlay p-3 alert alert-warning text-center font-weight-bolder"></div>
<div class="bottom-pop-up-overlay p-3 alert alert-warning text-center font-weight-bolder"></div>
<div class="custom-modal">
    <div class="card custom-modal-content">
        <div class="col-4 col-md-3 float-end">
            <button class="btn btn-dark rounded-0 mt-2 mb-2" style="width: 100px;" onclick="$('.custom-modal').fadeOut('slow')">Close</button>
        </div>
        <div class="card-body modal-content-fill"></div>
    </div>
</div>
<!-- Offer Modal End -->
<!-- JS
============================================ -->
<!-- Modernizer JS -->
<script src="/assets/js/vendor/modernizr.min.js"></script>
<!-- jQuery JS -->
<script src="/assets/js/vendor/jquery.js"></script>
<!-- Bootstrap JS -->
<script src="/assets/js/vendor/popper.min.js"></script>
<script src="/assets/js/vendor/bootstrap.min.js"></script>
<script src="/assets/js/vendor/slick.min.js"></script>
<script src="/assets/js/vendor/js.cookie.js"></script>
<!-- <script src="/assets/js/vendor/jquery.style.switcher.js"></script> -->
<script src="/assets/js/vendor/jquery-ui.min.js"></script>
<script src="/assets/js/vendor/jquery.countdown.min.js"></script>
<script src="/assets/js/vendor/sal.js"></script>
<script src="/assets/js/vendor/jquery.magnific-popup.min.js"></script>
<script src="/assets/js/vendor/imagesloaded.pkgd.min.js"></script>
<script src="/assets/js/vendor/isotope.pkgd.min.js"></script>
<script src="/assets/js/vendor/counterup.js"></script>
<script src="/assets/js/vendor/waypoints.min.js"></script>

<!-- Main JS -->
<script src="/assets/js/main.js"></script>
<script src="/assets/custom/scripts.js?v={$version}"></script>
<script>
    //new ().init();
    {literal}
    $(document).ready(() =>{
        $.post("//" + window.location.host + "/get_cart", (data) => {
            let items = JSON.parse(data);
            console.log(items)
            $(".cart").html(items.cart);
            $(".watchlist").html(items.watchlist);
        });
    });
    {/literal}

</script>
</body>

</html>