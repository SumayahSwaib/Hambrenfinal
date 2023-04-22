
{if empty($cart_items)} <div class="alert alert-warning bg-dark border border-warning text-center p-2 text-warning font-weight-bolder">Oooooops! Cart empty. Add some cool items from our store. <a href="//{$smarty.server.SERVER_NAME}/shop"><br/><button class="btn btn-dark border-warning">Go shopping</button></a></div>
{else}
    {$total_price = 0}
    {* Small devices form *}
<form action="//{$smarty.server.SERVER_NAME}/checkout/process" method="post">
    <div class="cart-body">
        <ul class="cart-item-list">
            {foreach $cart_items item=list name=foo}
                {$total_price = $total_price + ($list.price_1 * 1)}
                <input type="hidden" value="{$list.id}" name="product[]"/>
                <input type="hidden" value="{$list.price_1}" class="item_price" id="item_{$list.id}" />
            <li class="cart-item">
                <div class="item-img">
                    <a href="/product/{$list.url}"><img src="/media/products_thumbnails/{$list.feature_photo}" alt="Commodo Blown Lamp"></a>
                    <a href="//{$smarty.server.SERVER_NAME}/cart/remove_item/{$list.id}" class="close-btn"><i class="fas fa-times"></i></a>
                </div>
                <div class="item-content">
                    <div class="product-rating">
                                <span class="icon">
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
							</span>
                        <span class="rating-number">(64)</span>
                    </div>
                    <h3 class="item-title"><a href="/product/{$list.url}">{$list.name}</a></h3>
                    <div class="item-price"><span class="currency-symbol">$</span>{$list.price_1|number_format}</div>
                    <div class="pro-qty item-quantity">
                        <input type="number" name="qty[]" onchange="calculateCartprice(this, {$list.id})" class="quantity-input item_qty" value="1">
                    </div>
                    <h6 class="cart-subtotal">
                        <span class="subtotal-title">Subtotal:</span>
                        <span class="text-danger subtotal-amount subtotal_{$list.id}">$ {($list.price_1 * 1)|number_format:0}</span>
                    </h6>
                </div>
            </li>
            {/foreach}
        </ul>
    </div>
    <div class="cart-footer">
        <h3 class="cart-subtotal">
            <span class="subtotal-title">Total:</span>
            <span class=" grand_total">$ {$total_price|number_format:0}</span>
        </h3>
        <div class="group-btn">
            <a href="/cart" class="axil-btn btn-bg-primary viewcart-btn">View Cart</a>
            <button type="submit" class="axil-btn btn-bg-secondary checkout-btn">Checkout</button>
        </div>
    </div>
{*    <form action="//{$smarty.server.SERVER_NAME}/checkout/process" method="post">*}
{*        <div class="col-md-12 mb-5" style="margin-bottom: 100px">*}
{*            {foreach $cart_items item=list name=foo}*}
{*                <table class="table table-responsive mb-5">*}
{*                    <tr>*}
{*                        <td colspan="2" class="text-center">*}
{*                            <a href="//{$smarty.server.SERVER_NAME}/product/{$list.url}">*}
{*                                <img src="/media/products_thumbnails/{$list.feature_photo}" style="width:100%"/>*}
{*                            </a>*}
{*                        </td>*}
{*                    </tr>*}
{*                    <tr class="border-0">*}
{*                        <td class="font-weight-bold text-white-2">Product</td>*}
{*                        <td>*}
{*                             <a href="//{$smarty.server.SERVER_NAME}/product/{$list.url}" class="text-white-2">*}
{*                                 <span class="text-white-2 font-weight-bolder">{$list.name}</span>*}
{*                            </a>*}
{*                            <input type="hidden" value="{$list.id}" name="product[]"/>*}
{*                            <input type="hidden" value="{$list.price_1}" class="item_price" id="item_{$list.id}" />*}
{*                        </td>*}
{*                    </tr>*}
{*                    <tr>*}
{*                        <td class="font-weight-bold border-0 text-white-2">Price</td>*}
{*                        <td class="border-0 text-white-2">{$list.price_1|number_format}</td>*}
{*                    </tr>*}
{*                    <tr class="border-0">*}
{*                        <td class="font-weight-bold border-0 text-white-2">Qty</td>*}
{*                        <td class="border-0">*}
{*                            <input type="number" name="qty[]" onchange="calculateCartprice(this, {$list.id})" class="form-control item_qty bg-transparent border-bottom border-warning text-warning font-weight-bolder" value="1" />*}
{*                        </td>*}
{*                    </tr>*}
{*                    <tr class="border-0">*}
{*                        <td class="font-weight-bold border-0 text-white-2">Description</td>*}
{*                        <td class="border-0 text-white-2">{$list.description}</td>*}
{*                    </tr>*}
{*                    <tr class="border-0">*}
{*                        <td class="font-weight-bold border-0 text-white-2">Attributes</td>*}
{*                        <td class="border-0">*}
{*                            {if ! empty($list.attributes.colors)}*}
{*                                <h6 class="font-weight-bolder text-white-2">Select color</h6>*}
{*                                {foreach $list.attributes.colors item=color name=color_index}*}
{*                                    <input type="radio" name="color_{$list.id}" {if $smarty.foreach.color_index.index == 0} checked {/if} value="{$color.id}" /> <span class="text-white-2">{$color.color}</span><br/>*}
{*                                {/foreach}*}
{*                            {/if}*}
{*                            {if ! empty($list.attributes.sizes)}*}
{*                                <h6 class="font-weight-bolder text-white-2">Select Size</h6>*}
{*                                {foreach $list.attributes.sizes item=size name=size_index}*}
{*                                    <input type="radio" name="size_{$list.id}" {if $smarty.foreach.size_index.index == 0} checked {/if} value="{$size.id}" /> <span class="text-white-2">{$size.size}</span><br/>*}
{*                                {/foreach}*}
{*                            {/if}*}
{*                        </td>*}
{*                    </tr>*}
{*                    <tr class="border-0 bg-warning">*}
{*                        <td class="font-weight-bold border-0 text-white-2">Sub Total</td>*}
{*                        <td class="border-0 text-white-2 font-weight-bolder subtotal_{$list.id}">{($list.price_1 * 1)|number_format:0}</td>*}
{*                    </tr>*}

{*                        {$total_price = $total_price + ($list.price_1 * 1)}*}

{*                    <tr class="border-bottom border-warning">*}
{*                        <th colspan="2" class="border-0">*}
{*                            <a class="text-white-2" href="//{$smarty.server.SERVER_NAME}/cart/remove_item/{$list.id}"><small class="text-white-2"><span class="fa fa-times"></span> Remove</small></a>*}
{*                        </th>*}
{*                    </tr>*}
{*                </table>*}
{*            {/foreach}*}
{*        </div>*}
{*        <div class="card border-0 bg-transparent" style="margin-bottom: 1000px">*}
{*            <div class="card-header bg-transparent border-warning">*}
{*                <h4 class="font-weight-bolder text-warning">Cart Summary</h4>*}
{*            </div>*}
{*            <div class="card-body">*}
{*                <table class="table table-warning">*}
{*                    <tr>*}
{*                        <Td class="border-0">Subtotal</Td><td class="border-0 text-right font-weight-bolder sub_total"></td>*}
{*                    </tr>*}
{*                    <tr>*}
{*                        <Th>Total</Th><td class="text-right font-weight-bolder grand_total">UGX {$total_price|number_format:0}</td>*}
{*                    </tr>*}
{*                </table>*}
{*            </div>*}
{*            <div class="card-footer bg-transparent">*}
{*                <button class="float-right btn btn-dark border-warning p-2 font-weight-bold" type="submit" style="">Continue to checkout</button>*}
{*            </div>*}
{*        </div>*}
{*    </form>*}
</form>
{/if}