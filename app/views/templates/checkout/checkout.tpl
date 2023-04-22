{extends file ="index.tpl"}
{block name="meta"}
    <title>Checkout - Jaslac Media</title>
{/block}
{block name="body"}
    <div class="container">
        {if $smarty.server.HTTP_USER_AGENT != "Boosted/jaslac.com"}
            <div class="col-md-12 mt-3 mb-3">
                <div class="list-group list-group-horizontal">
                    <div class="list-group-item border-0 bg-transparent">Home <i class="fa fa-angle-right"></i></div>
                    <div class="list-group-item border-0 bg-transparent">Checkout</div>
                </div>
            </div>
        {else}
            <div style="width: 100%;" class="border-bottom border-warning shadow-sm">
                <h3 class="p-4 text-center font-weight-bolder">CHECKOUT</h3>
            </div>
        {/if}
        <div class="col-md-12 mt-4 mb-4">
            <h3 class="p-5 text-center">Checkout</h3>
            <div class="row mt-5 mb-5">
                <div class="col-md-6  p-0 mx-auto">
                    <div class="card border-0 {if $smarty.server.HTTP_USER_AGENT == "Boosted/jaslac.com"} bg-transparent{else}bg-light{/if}" style="height: fit-content !important;">
                        <div class="card-header bg-transparent border-0">
                            <h4>Your order</h4>
                        </div>
                        {if isset($smarty.session.final_cart)}
                            <div class="card-body border-0">
                                <table class="table">
                                    <tr><th>Product</th><th class="text-right">Subtotal</th></tr>
                                    <tr>
                                        <Td class="border-0">Subtotal</Td><td class="border-0 text-right">USD {$final_cart.sub_total|number_format}</td>
                                    </tr>
                                    <tr>
                                        <Td>Delivery costs</Td><td class="text-right">USD {$final_cart.delivery_cost}</td>
                                    </tr>
                                    <tr>
                                        <Td>Coupon costs</Td><td class="text-right">USD {$final_cart.coupon_cost|number_format}</td>
                                    </tr>
                                    <tr>
                                        <Th>Total</Th><td class="text-right font-weight-bold">USD {$final_cart.grand_totals|number_format}</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="card-footer bg-transparent">
                                <p>
                                    <input type="radio" name="payment" value="1" checked> Cash balance on delivery
                                </p>
                                <div class="p-2 bg-secondary text-white ">
                                    <p class="" style="color:#ffffff">Complete transaction with cash on delivery</p>
                                </div>
                                <p class="mt-2">
                                    <input type="radio" disabled name="payment" value="2" style="color:#ffffff"> Checkout with Mobile money or Debit/Credit card
                                </p>
                                <div class="p-2 bg-secondary text-white ">
                                    <p style="color:#ffffff">With use of your Mobile money number, or debit / credit card, complete your order</p>
                                    <div class="alert alert-warning rounded-0">A Transactional charges are to be added to your final amount during payments.</div>
                                </div>
                                <div class="card mt-2 mb-2 border-0">
                                    <div class="card-header bg-transparent text-warning font-weight-bolder">
                                        Additional order information
                                    </div>
                                    <div class="card-body">
                                        <p>Any thing you would wish to share with us on this order, fill it in below.</p>
                                        <textarea class="form-control rounded-0" placeholder="You can let us know more about what exactly you expect with your order" id="order-description"></textarea>
                                    </div>

                                </div>
                                <p class="mt-3 mb-3">By <b>Placing your order</b> You agree with <a href="//{$smarty.server.SERVER_NAME}/terms">Terms and conditions <sup>*</sup></a></p>
                                    {if empty($addresses.phone_no) or empty($addresses.email) or empty($addresses.village)}
                                        <div class="alert alert-danger p-3 text-center rounded-0">Phone number, email address and your district and village are required before you can place your order. <br/><b>Update your Billing address to continue.</b>
                                        <br/>
                                            <button class="btn btn-danger rounded-0 form-control" type="button" data-bs-toggle="modal" data-bs-target="#myModal">Update Billing address</button>
                                        </div>
                                    {else}
                                        <button class="float-right btn btn-danger form-control p-2 font-weight-bold" onclick="placeOrder('{$addresses.district}', this)" style="border-radius: 25px">Place order</button>
                                {/if}
                            </div>
                        {else}
                            <div class="alert alert-danger rounded-0">Nothing to check out. <a href="//{$smarty.server.SERVER_NAME}/cart">Go to cart</a></div>
                        {/if}
                    </div>

                </div>
            </div>
        </div>
    </div>
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog rounded-0">

            <!-- Modal content-->
            <div class="modal-content rounded-0">
                <div class="modal-header">
                    <h4 class="modal-title">Update Billing address</h4>
                    <button type="button" class=" btn btn-danger close float-end" style="width:30px" data-bs-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body" style="margin-bottom: 30px">
                    <h5 class="font-weight-bolder" >Your billing and Delivery address</h5>
                    <form action="//{$smarty.server.SERVER_NAME}/profile/update" method="post">
                        <div class="mt-4 mb-4">
                            <label>Your name / Company</label>
                            <input type="text" required class="form-control border" value="{$addresses.company}" name="company" placeholder="Company name (Optional)" />
                        </div>
                        <div class="mt-4 mb-4">
                            <input type="text" class="form-control border" name="country" placeholder="Country">
                        </div>
                        <div class="mt-4 mb-4">
                            <label>Street Address *</label>
                            <input type="text" value="{$addresses.street}" required class="form-control border" name="street" placeholder="Street address" />
                        </div>
                        <div class="mt-4 mb-4">
                            <label>Town / Village *</label>
                            <input type="text" value="{$addresses.village}" required class="form-control border" name="town" placeholder="Town or village name" />
                        </div>
                        <div class="mt-4 mb-4">
                            <label>State *</label>
                            <div class="mt-4 mb-4">
                                <input type="text" class="form-control border" name="district">
                            </div>
                        </div>
                        <div class="mt-4 mb-4">
                            <label>Phone number *</label>
                            <input type="text" value="{$addresses.phone_no}" required class="form-control border" name="phone" placeholder="Phone number" />
                        </div>
                        <div class="mt-4 mb-4">
                            <label>Postal address</label>
                            <input type="text" value="{$addresses.box_no}" class="form-control border" name="box" placeholder="Postal Address" />
                        </div>
                        <div class="mt-4 mb-4">
                            <label>Email *</label>
                            <input type="email" value="{$addresses.email}" required class="form-control border" name="email" placeholder="Email address" />
                        </div>
                        <div class="" style="margin-bottom: 50px">
                        <button class="btn btn-danger form-control">Update address</button>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
{/block}
{block name="scripts"}


{/block}