{extends file="index.tpl"}
{block name="body"}
    <div class="axil-breadcrumb-area">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-8">
                    <div class="inner">
                        <ul class="axil-breadcrumb">
                            <li class="axil-breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="separator"></li>
                            <li class="axil-breadcrumb-item active" aria-current="page">Shop</li>
                        </ul>
                        <h1 class="title">Explore All Products</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-4">
                    <div class="inner">
                        <div class="bradcrumb-thumb">
                            <img src="/assets/images/product/product-45.png" alt="Image">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<div class="axil-shop-area axil-section-gap bg-color-white">
    <div class="container">
        <div class="row row--15">
            <div class="col-lg-12">
                <div class="axil-shop-top">
                    <div class="row">
                        <div class="col-lg-9">
                            <div class="category-select">

                                <!-- Start Single Select  -->
                                <select class="single-select">
                                    <option>Categories</option>
                                    <option>Fashion</option>
                                    <option>Electronics</option>
                                    <option>Furniture</option>
                                    <option>Beauty</option>
                                </select>
                                <!-- End Single Select  -->

                                <!-- Start Single Select  -->
                                <select class="single-select">
                                    <option>Color</option>
                                    <option>Red</option>
                                    <option>Blue</option>
                                    <option>Green</option>
                                    <option>Pink</option>
                                </select>
                                <!-- End Single Select  -->

                                <!-- Start Single Select  -->
                                <select class="single-select">
                                    <option>Price Range</option>
                                    <option>0 - 100</option>
                                    <option>100 - 500</option>
                                    <option>500 - 1000</option>
                                    <option>1000 - 1500</option>
                                </select>
                                <!-- End Single Select  -->

                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="category-select mt_md--10 mt_sm--10 justify-content-lg-end">
                                <!-- Start Single Select  -->
                                <select class="single-select">
                                    <option>Sort by Latest</option>
                                    <option>Sort by Name</option>
                                    <option>Sort by Price</option>
                                    <option>Sort by Viewed</option>
                                </select>
                                <!-- End Single Select  -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            {foreach $recently_added_products as $product}
                <div class="col-xl-2 col-lg-3 col-sm-6">
                    <div class="axil-product product-style-one has-color-pick mt--40">
                        <div class="thumbnail">
                            <a href="/product/{$product.url}">
                                <img src="{$product.feature_photo}" alt="Product Images">
                            </a>
                            <div class="label-block label-right">
                                <div class="product-badget">20% OFF</div>
                            </div>
                            <div class="product-hover-action">
                                <ul class="cart-action">
                                    <li class="wishlist"><a href="javascript:addToWatchlist({$product.id})"><i class="far fa-heart"></i></a></li>
                                    <li class="select-option"><a href="javascript:addToCart({$product.id})">Add to Cart</a></li>
                                    <li class="quickview"><a href="/shop" data-bs-toggle="modal" data-bs-target="#quick-view-modal"><i class="far fa-eye"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="product-content">
                            <div class="inner">
                                <h5 class="title text-truncate"><a href="/product/{$product.url}">{$product.name}</a></h5>
                                <div class="product-price-variant">
                                    <span class="price current-price">{$product.price_2}</span>
                                    <span class="price old-price">{$product.price_1}</span>
                                </div>
                                <div class="color-variant-wrapper">
                                    <ul class="color-variant">
                                        <li class="color-extra-01 active"><span><span class="color"></span></span>
                                        </li>
                                        <li class="color-extra-02"><span><span class="color"></span></span>
                                        </li>
                                        <li class="color-extra-03"><span><span class="color"></span></span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            {/foreach}

        </div>
    </div>
</div>
{/block}
