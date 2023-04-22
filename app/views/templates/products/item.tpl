{extends file="index.tpl"}
{block name="body"}
    <main class="main-wrapper">
        <!-- Start Shop Area  -->
        <div class="axil-single-product-area axil-section-gap pb--0 bg-color-white">
            <br/>
            {$product = $products.product_info}
            {$thumbnails = $products.thumbnails}
            <div class="single-product-thumb mb--40">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-7 mb--40">
                            <div class="row">
                                <div class="col-lg-10 order-lg-2">
                                    <div class="single-product-thumbnail-wrap zoom-gallery">
                                        <div class="single-product-thumbnail product-large-thumbnail-3 axil-product">
                                                <div class="thumbnail">
                                                    <a href="{if substr($product['feature_photo'], 0, 2) == '//'}{$product['feature_photo']}{else}/media/products_thumbnails/{$product['feature_photo']}{/if}" class="popup-zoom">
                                                        <img src="{if substr($product['feature_photo'], 0, 2) == '//'}{$product['feature_photo']}{else}/media/products_thumbnails/{$product['feature_photo']}{/if}" alt="Product Images">
                                                    </a>
                                                </div>
                                        </div>
                                        <div class="label-block">
                                            <div class="product-badget">{$product.supplier_name}</div>
                                        </div>
{*                                        <div class="product-quick-view position-view">*}
{*                                            <a href="/assets/images/product/product-big-01.png" class="popup-zoom">*}
{*                                                <i class="far fa-search-plus"></i>*}
{*                                            </a>*}
{*                                        </div>*}
                                    </div>
                                </div>
                                <div class="col-lg-2 order-lg-1">
                                    <div class="product-small-thumb-3 small-thumb-wrapper">
                                        {foreach $thumbnails as $photos}
                                            <div class="small-thumb-img">
                                                <img src="{if substr($photos['photo'], 0, 2) == '//'}{$photos['photo']}{else}/media/products_thumbnails/{$photos['photo']}{/if}" alt="thumb image">
                                            </div>
                                        {/foreach}
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-5 mb--40">
                            <div class="single-product-content">
                                <div class="inner">
                                    <h2 class="product-title">{$products.product_info.name}</h2>
                                    <span class="price-amount">${$product.price_1}</span>
                                    <div class="product-rating">
                                        {for $counter=1 to 5}
                                            <span class="cursor ">
                                                                <i class="fas fa-star {if $counter <= $product.total_rates} {else}text-muted{/if}" ></i>
                                                            </span>
                                        {/for}
                                    </div>
                                    <ul class="product-meta">
                                        <li><i class="fal fa-check"></i>In stock</li>
                                        <li><i class="fal fa-check"></i>Free delivery available</li>
                                        <li><i class="fal fa-check"></i>Sales 30% Off Use Code: HAMB</li>
                                    </ul>
                                    <p class="description">{$product.description}</p>

                                    <div class="product-variations-wrapper">

                                        <!-- Start Product Variation  -->
                                        <div class="product-variation">
                                            <h6 class="title">Colors:</h6>
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
                                        <!-- End Product Variation  -->

                                        <!-- Start Product Variation  -->
                                        <div class="product-variation product-size-variation">
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
                                            <li class="add-to-cart"><a href="javascript:addToCart({$product.id})" class="axil-btn btn-bg-primary">Add to Cart</a></li>
                                            <li class="wishlist"><a href="javascript:addToWatchlist({$product.id})" class="axil-btn wishlist-btn"><i class="far fa-heart"></i></a></li>
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

            <!-- End .single-product-thumb -->

        </div>

        <!-- Start Recently Viewed Product Area  -->
        <div class="axil-product-area bg-color-white axil-section-gap pb--50 pb_sm--30">
            <div class="container">
                <div class="section-title-wrapper">
                    <span class="title-highlighter highlighter-primary"><i class="far fa-shopping-basket"></i> Your Recently</span>
                    <h2 class="title">Viewed Items</h2>
                </div>
                <div class="recent-product-activation slick-layout-wrapper--15 axil-slick-arrow arrow-top-slide">
                    {foreach $recently_added_products as $product}
                    <div class="slick-single-layout">
                        <div class="axil-product">

                                <div class="thumbnail">
                                    <a href="/">
                                        <img src="{if substr($product['feature_photo'], 0, 2) == '//'}{$product['feature_photo']}{else}/media/products_thumbnails/{$product['feature_photo']}{/if}" alt="Product Images">
                                    </a>
                                    <div class="label-block label-right">
                                        <div class="product-badget">20% OFF</div>
                                    </div>
                                    <div class="product-hover-action">
                                        <ul class="cart-action">
                                            <li class="wishlist"><a href="javascript:addToWatchlist({$product.id})"><i class="far fa-heart"></i></a></li>
                                            <li class="select-option"><a href="javascript:addToCart({$product.id})">Add to Cart</a></li>
                                            <li class="quickview"><a href="/product/{$product.url}" data-bs-toggle="modal" data-bs-target="#quick-view-modal"><i class="far fa-eye"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            <div class="product-content">
                                <div class="inner">
                                    <h5 class="title text-truncate"><a href="/product/{$product.url}">{$product.name}</a></h5>
                                    <div class="product-price-variant">
                                        <span class="price old-price">{$product.price_2}</span>
                                        <span class="price current-price">{$product.price_1}</span>
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
                    <!-- End .slick-single-layout -->
                </div>
            </div>
        </div>
    </main>
{/block}