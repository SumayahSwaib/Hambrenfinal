{extends file="index.tpl"}
{block name="body"}
<div class="axil-shop-area axil-section-gap bg-color-white">
    <div class="container">
        <div class="row row--15">
            {foreach $products as $product}
                <div class="col-xl-3 col-lg-4 col-sm-6">
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
