{extends file="index.tpl"}
{block name=""}
    {if ! empty($supplier)}
        <title>{$supplier.0.supplier} - on Hambren</title>
        <meta name="keywords" content="{$supplier.0.supplier}"/>
        <meta name="description" content="Buy from {$supplier.0.supplier} on Boo store : {$supplier.0.description}">
        <meta name="contact" content="office[at]boostedtechs[dot]com" />
        <meta name="author" content="DevMate <https://devmate.boostedtechs.com>" />
        <meta name="copyright" content="Boosted Technologies" />
        <meta Name="rating" content="General"/>
        <meta property="og:title" content="{$supplier.0.supplier} sells on Boo Store">
        <meta property="og:type" content="Website" />
        <meta property="og:site_name" content="Boo Store ">
        <meta property="og:description" content="Buy from {$supplier.0.supplier} on Boo store : {$supplier.0.description}">
        <meta property="og:image" content="{$photos.0.photo}">
        <PageMap>
            <DataObject type="thumbnail">
                <Attribute name="src" value="//{$smarty.server.SERVER_NAME}/media/suppliers/{$photos.0.photo}"/>
                <Attribute name="width" value="100"/>
            </DataObject>
        </PageMap>
    {/if}
{/block}
{block name="body"}
    <div class="container" style="margin-top: 100px">
        <div class="row">
            <div class="col-md-12 mx-auto text-center p-4">
                <div class="row">

                    {if ! empty($supplier)}
                        <div class="col-md-12 p-0">
                            <div>
                                <img src="" class="w-100"/>
                                <div class="text-right supplier-names p-4 text-white" style="background: #859F49">
                                    <h4 class="font-weight-bolder">{$supplier.0.supplier}</h4>
                                    <h6>@{$supplier.0.url}</h6>
                                </div>
                            </div>
                            <div class="feature_photo_logo img-thumbnail" style="background: #859F49">
                                <img src="{$supplier.0.photo}" class="w-100"/>
                            </div>
                            <div class="bg-hide divider"></div>
                            <div class="p-3 text-left" style="margin-top: -120px">
                                <p class="text-muted">{$supplier.0.description|nl2br}</p>
                            </div>
                        </div>
                        <hr/>
                        <h4 class="mt-5 mb-5 text-center col-md-12">Products of <b>{$supplier.0.supplier}</b></h4>
                    {else}
                        <div class="col-md-12 p-3 text-center bg-danger">
                            <h5 class="text-white">Supplier not found</h5>
                        </div>
                    {/if}
                    <div class="col-md-12">
                        <div class="row">
                            {if ! empty($category_products)}
                                {foreach $category_products item=list}
                                    <div class="col-6 col-md-4">
                                        <div class="card border-0">
                                            <div class="card-header bg-transparent">
                                                <small class="text-truncate sm-hide">{$list.product_category} <i class="fa fa-arrow-circle-right"></i> {$list.product_sub_category} </small>
                                                <a href="//{$smarty.server.SERVER_NAME}/product/{$list.url}">
                                                    <h6 class="text-truncate">{$list.name}</h6>
                                                </a>
                                            </div>
                                            <div class="card-body">
                                                <div class="small-container-2">
                                                    <a href="//{$smarty.server.SERVER_NAME}/product/{$list.url}">
                                                        <img src="{$list.feature_photo}" class="w-100"/>
                                                    </a>
                                                </div>
                                                <h5 class="mt-2 price-text">{$list.currency_name} {$list.price_1|number_format}</h5>
                                                {if $list.price_2 > 0}
                                                    <h6 class="mb-2 text-muted price-text font-weight-light" style="text-decoration: line-through">{$list.currency_name} {$list.price_2|number_format:1}</h6>
                                                {/if}
                                            </div>
                                            <div class="card-footer bg-transparent">
                                                <div class="row">
                                                    <div class="col-6 col-md-6 text-center bg-transparent border-0 cursor" onclick="addToWatchlist({$list.id})" title="Add to watchlist">
                                                        <i class="fa fa-heart watchlist-item-{$list.id}"></i><br/><small class="sm-hide">Watchlist</small>
                                                    </div>
                                                    <div class="col-6 col-md-6 text-center bg-transparent border-0 cursor" onclick="addToCart({$list.id})" title="Add to cart">
                                                        <span class="fa fa-shopping-cart badge-danger p-1 rounded-circle cart-item-{$list.id}" title="add to cart"></span>
                                                        <br/><small class="sm-hide">Shop it</small>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                {/foreach}
                                <div class="col-md-12">
                                    <ul class="pagination">
                                        <li class="page-item"><a class="page-link" href="//{$smarty.server.SERVER_NAME}/supplier/{strtolower($page)}?page={if isset($smarty.get.page) and $smarty.get.page > 1}{$smarty.get.page - 1}{else}2{/if}">Previous</a></li>
                                        <li class="page-item"><a class="page-link" href="//{$smarty.server.SERVER_NAME}/supplier/{strtolower($page)}?page={if isset($smarty.get.page)}{$smarty.get.page + 1}{else}2{/if}">Next</a></li>
                                    </ul>
                                </div>
                            {else}
                                <div class="col-md-12 p-3 text-center bg-danger">
                                    <h5 class="text-white">No content to display right now.</h5>
                                </div>
                            {/if}
                        </div>
                    </div>
                    <div class="col-md-12 p-2">
                        <!-- AddToAny BEGIN -->
                        <div class="a2a_kit a2a_kit_size_32 a2a_default_style">
                            <a class="a2a_dd" href="https://www.addtoany.com/share"></a>
                            <a class="a2a_button_facebook"></a>
                            <a class="a2a_button_whatsapp"></a>
                            <a class="a2a_button_twitter"></a>
                            <a class="a2a_button_email"></a>
                            <a class="a2a_button_telegram"></a>
                            <a class="a2a_button_linkedin"></a>
                        </div>
                        <script>
                            var a2a_config = a2a_config || {};
                            a2a_config.onclick = 1;
                            a2a_config.num_services = 4;
                        </script>
                        <script async src="https://static.addtoany.com/menu/page.js"></script>
                        <!-- AddToAny END -->
                    </div>
                </div>
            </div>
        </div>
    </div>
{/block}