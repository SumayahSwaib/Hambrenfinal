
    {extends file="product_index.tpl"}

{block name="body2"}
    <div class="container">
        <div class="row">
            {include file="products/left-bar.tpl"}
            <div class="col-md-8 text-center p-4">
                <div class="row {if $smarty.server.HTTP_USER_AGENT == "Boosted/jaslac.com"}more-feeds{/if}">
                    {if ! empty($category_products)}
                        {foreach $category_products item=list}
                            <div class="col slideInUp mb-2" data--duration="2s" data--delay=".3s">
                                <div class="card border-0">
                                    <div class="card-header bg-transparent">
                                        <small class="text-truncate sm-hide">{$list.product_category} <i class="fa fa-arrow-circle-right"></i> {$list.product_sub_category} </small>
                                        <a href="//{$smarty.server.SERVER_NAME}/product/{$list.url}">
                                            <h6 class="price-text text-center">{$list.name} </h6>
                                        </a>
                                    </div>
                                    <div class="card-body">
                                        <div class="small-container-2">
                                            <a href="//{$smarty.server.SERVER_NAME}/product/{$list.url}">
                                                <img src="//{$smarty.server.SERVER_NAME}/assets/loading.gif" lsrc="//{$smarty.server.SERVER_NAME}/media/products_thumbnails/{$list.feature_photo}" class="w-100" />
                                            </a>
                                        </div>
                                        <h5 class="mt-2 mb-2 price-text">{$list.currency_name} {$list.price_1|number_format}</h5>
                                        {if $list.price_2 > 0}
                                            <h6 class="mb-2 text-muted price-text font-weight-light" style="text-decoration: line-through">{$list.currency_name} {$list.price_2|number_format:1}</h6>
                                        {/if}
                                    </div>
                                    <div class="card-footer bg-transparent">
                                        <div class="row">
                                            <button class="col-md-12 p-2 text-center mt-1 btn-warning border-0 cursor mb-1 added-watchlist{$list.id}" {if in_array($list.id, $smarty.session.watchlist)}disabled{/if}onclick="addToWatchlist({$list.id})" title="Add to Watchlist">
                                                <small>{if in_array($list.id, $smarty.session.watchlist)}
                                                        SAVED <i class='fa fa-check-circle text-primary'></i>
                                                    {else}
                                                        <span class="fa fa-plus-square watchlist-item-{$list.id}" title="add to Watchlist"></span>
                                                        <small class="">Watchlist</small>
                                                    {/if}</small>
                                            </button>
                                            <button class="col-md-12 p-2 text-center btn-danger border-0 cursor" onclick="addToCart({$list.id})" title="Add to cart">
                                                <span class="fa fa-shopping-cart p-1 cart-item-{$list.id}" title="add to cart"></span>
                                                <small class="added-cart{$list.id}">{if in_array($list.id, $smarty.session.cart)}Remove <i class='fa fa-scissors'></i>{else}BUY{/if}</small>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                        {if $smarty.server.HTTP_USER_AGENT != "Boosted/jaslac.com"}
                            <div class="col-md-12">
                                <ul class="pagination">
                                    <li class="page-item"><a class="page-link" href="//{$smarty.server.SERVER_NAME}/{$page|strtolower}?page={if isset($smarty.get.page) and $smarty.get.page > 1}{$smarty.get.page - 1}{else}2{/if}">Previous</a></li>
                                    <li class="page-item"><a class="page-link" href="//{$smarty.server.SERVER_NAME}/{$page|strtolower}?page={if isset($smarty.get.page)}{$smarty.get.page + 1}{else}2{/if}">Next</a></li>
                                </ul>
                            </div>
                        {/if}
                    {else}
                        <div class="col-md-12 p-3 text-center bg-transparent alert alert-warning">
                            <p class="">No content to display right now.</p>
                        </div>
                    {/if}
                </div>
            </div>
        </div>
    </div>
{/block}