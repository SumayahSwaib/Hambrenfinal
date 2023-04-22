{extends file ="index.tpl"}
{block name="meta"}
    <title>Cart - Jaslac</title>
{/block}
{block name="body"}
    <div class="container">
        {include file="checkout/left-bar.tpl"}
        <div class="col-md-12 mt-3 mb-3">
            <div class="list-group list-group-horizontal">
                <div class="list-group-item border-0 bg-transparent"><a href="//{$smarty.server.SERVER_NAME}">Home</a> <i class="fa fa-angle-right"></i></div>
                <div class="list-group-item border-0 bg-transparent">cart</div>
            </div>
        </div>
        {if empty($cart_items)} <div class="alert alert-danger text-center p-2">Cart empty. Add some cool items from our store. <a href="//{$smarty.server.SERVER_NAME}/shop"><br/><button class="btn btn-danger">Go shopping</button></a></div>
        {else}
            <form action="//{$smarty.server.SERVER_NAME}/checkout/process" method="post" id="form-bg">
                <div class="col-md-12">
                    <h4 class="p-5 text-center">Cart</h4>
                    <table class="table table-responsive sm-hide shadow">
                        <tr>
                            <th class="font-weight-light border-top-0"></th>
                            <th class="font-weight-light border-top-0"></th>
                            <th class="font-weight-light border-top-0">Item</th>
                            <th class="font-weight-light border-top-0">Price</th>
                            <th class="font-weight-light border-top-0">Quantity</th>
                            <th class="border-top-0 font-weight-light">Attributes</th>
                            <th class="font-weight-light border-top-0">Subtotal</th>
                            <th class="font-weight-light border-top-0"></th>
                        </tr>
                        {$total_price = 0}
                        {foreach $cart_items item=list name=foo}
                            <tr>
                                <td>
                                   {$smarty.foreach.foo.index + 1}
                                </td>
                                <td>
                                    <a href="//{$smarty.server.SERVER_NAME}/product/{$list.url}">
                                        <img src="//{$smarty.server.SERVER_NAME}/assets/loading.gif" lsrc="//{$smarty.server.SERVER_NAME}/media/products_thumbnails/{$list.feature_photo}" style="width:100px;"/>
                                    </a>
                                </td>
                                <td>
                                    <a href="//{$smarty.server.SERVER_NAME}/product/{$list.url}">
                                        {$list.name}
                                    </a>
                                    <input type="hidden" value="{$list.id}" name="product[]" />
                                    <input type="hidden" value="{$list.price_1}" class="sm_item_price" id="sm_item_{$list.id}" />
                                </td>
                                <td>{$list.price_1|number_format}</td>
                                <td><input type="number" name="qty[]" onchange="calculateCartprice(this, {$list.id}, 2)" class="form-control sm_item_qty" value="1" /></td>
                                <td>
                                    {if ! empty($list.attributes.colors)}
                                        <h6 class="font-weight-bolder">Select color</h6>
                                        {foreach $list.attributes.colors item=color name=color_index}
                                            <input type="radio" name="color_{$list.id}" {if $smarty.foreach.color_index.index == 0} checked {/if} value="{$color.id}" /> {$color.color}<br/>
                                        {/foreach}
                                    {/if}
                                    {if ! empty($list.attributes.sizes)}
                                        <h6 class="font-weight-bolder">Select Size</h6>
                                        {foreach $list.attributes.sizes item=size name=size_index}
                                            <input type="radio" name="size_{$list.id}" {if $smarty.foreach.size_index.index == 0} checked {/if} value="{$size.id}" /> {$size.size}<br/>
                                        {/foreach}
                                    {/if}
                                </td>
                                <td class="subtotal_{$list.id}">{($list.price_1 * 1)|number_format:0}</td>
                                {$total_price = $total_price + ($list.price_1 * 1)}
                                <th>
                                    <a href="//{$smarty.server.SERVER_NAME}/cart/remove_item/{$list.id}"><small><span class="fa fa-times"></span> Remove</small></a>
                                </th>
                            </tr>
                        {/foreach}
                    </table>
                </div>
                <div class="col-md-12 mt-4 mb-4">
                    <div class="row mt-5 mb-5">
                        <div class="col-md-6">
                            <div class="input-group">
                                <input type="text" class="form-control p-4" placeholder="Coupon code" style="border-top-left-radius: 25px; border-bottom-left-radius: 25px;"/>
                                <span class="btn btn-dark input-group-prepend" style="border-radius: 0; border-top-right-radius: 25px; border-bottom-right-radius: 25px;">Apply Coupon</span>
                            </div>
                        </div>
                        <div class="col-md-6">

                            <div class="card border-0 bg-light">
                                <div class="card-header bg-transparent">
                                    <h4>Cart Summary</h4>
                                </div>
                                <div class="card-body">
                                    <table class="table">
                                        <tr>
                                            <Td class="border-0">Subtotal</Td><td class="border-0 text-right font-weight-bolder sub_total">UGX {$total_price|number_format:1}</td>
                                        </tr>
                                        <tr>
                                            <Td>Coupon costs</Td><td class="text-right">UGX 0.0</td>
                                        </tr>
                                        <tr>
                                            <Th>Total</Th><td class="text-right font-weight-bolder grand_total">UGX {($total_price + 3000)|number_format:1}</td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="card-footer bg-transparent">
                                    <button class="float-right btn btn-danger p-2 font-weight-bold" type="submit" style="">Continue to checkout</button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </form>
            {* Small devices form *}
            <form action="//{$smarty.server.SERVER_NAME}/checkout/process" method="post" id="form-sm">
                <div class="col-md-12">
                    {foreach $cart_items item=list name=foo}
                        <table class="table bg-hide table-responsive">
                            <tr>
                                <td colspan="2" class="text-center">
                                    <a href="//{$smarty.server.SERVER_NAME}/product/{$list.url}">
                                        <img src="//{$smarty.server.SERVER_NAME}/assets/loading.gif" lsrc="//{$smarty.server.SERVER_NAME}/media/products_thumbnails/{$list.feature_photo}" style="width:100%"/>
                                    </a>
                                </td>
                            </tr>
                            <tr class="border-0">
                                <td class="font-weight-bold">Product</td>
                                <td>
                                     <a href="//{$smarty.server.SERVER_NAME}/product/{$list.url}">
                                        {$list.name}
                                    </a>
                                    <input type="hidden" value="{$list.id}" name="product[]" />
                                    <input type="hidden" value="{$list.price_1}" class="item_price" id="item_{$list.id}" />
                                </td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold border-0">Price</td>
                                <td class="border-0">{$list.price_1|number_format}</td>
                            </tr>
                            <tr class="border-0">
                                <td class="font-weight-bold border-0">Qty</td>
                                <td class="border-0"><input type="number" name="qty[]" onchange="calculateCartprice(this, {$list.id})" class="form-control item_qty" value="1" /></td>
                            </tr>
                            <tr class="border-0">
                                <td class="font-weight-bold border-0">Description</td>
                                <td class="border-0">{$list.description}</td>
                            </tr>
                            <tr class="border-0">
                                <td class="font-weight-bold border-0">Attributes</td>
                                <td class="border-0">
                                    {if ! empty($list.attributes.colors)}
                                        <h6 class="font-weight-bolder">Select color</h6>
                                        {foreach $list.attributes.colors item=color name=color_index}
                                            <input type="radio" name="color_{$list.id}" {if $smarty.foreach.color_index.index == 0} checked {/if} value="{$color.id}" /> {$color.color}<br/>
                                        {/foreach}
                                    {/if}
                                    {if ! empty($list.attributes.sizes)}
                                        <h6 class="font-weight-bolder">Select Size</h6>
                                        {foreach $list.attributes.sizes item=size name=size_index}
                                            <input type="radio" name="size_{$list.id}" {if $smarty.foreach.size_index.index == 0} checked {/if} value="{$size.id}" /> {$size.size}<br/>
                                        {/foreach}
                                    {/if}
                                </td>
                            </tr>
                            <tr class="border-0 bg-warning">
                                <td class="font-weight-bold border-0">Sub Total</td>
                                <td class="border-0 subtotal_{$list.id}">{($list.price_1 * 1)|number_format:0}</td>
                            </tr>

                                {$total_price = $total_price + ($list.price_1 * 1)}

                            <tr class="border-0">
                                <th colspan="2" class="border-0">
                                    <a href="//{$smarty.server.SERVER_NAME}/cart/remove_item/{$list.id}"><small><span class="fa fa-times"></span> Remove</small></a>
                                </th>
                            </tr>
                        </table>
                    {/foreach}
                </div>
                <div class="col-md-12 mt-4 mb-4">
                    <div class="row mt-5 mb-5">
                        <div class="col-md-6">
                            <div class="input-group">
                                <input type="text" class="form-control p-4" placeholder="Coupon code" style="border-top-left-radius: 25px; border-bottom-left-radius: 25px;"/>
                                <span class="btn btn-dark input-group-prepend" style="border-radius: 0; border-top-right-radius: 25px; border-bottom-right-radius: 25px;">Apply Coupon</span>
                            </div>
                        </div>
                        <div class="col-md-6">

                            <div class="card border-0 bg-light">
                                <div class="card-header bg-transparent">
                                    <h4>Cart Summary</h4>
                                </div>
                                <div class="card-body">
                                    <table class="table">
                                        <tr>
                                            <Td class="border-0">Subtotal</Td><td class="border-0 text-right font-weight-bolder sub_total"></td>
                                        </tr>
                                        <tr>
                                            <Td>Coupon costs</Td><td class="text-right">UGX 0.0</td>
                                        </tr>
                                        <tr>
                                            <Th>Total</Th><td class="text-right font-weight-bolder grand_total"></td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="card-footer bg-transparent">
                                    <button class="float-right btn btn-danger rounded-0 p-2 font-weight-bold" type="submit" style="">Continue to checkout</button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </form>
        {/if}
    </div>
{/block}
{block name="scripts"}
    <script>
        let screenSize = $(window).width();
        if (screenSize <= 768) {
            $("#form-bg").remove();
            updateCartTotals(false)
        }else {
            $("#form-sm").remove();
            updateCartTotals(true)
        }
    </script>
{/block}