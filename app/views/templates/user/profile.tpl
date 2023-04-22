{extends file="index.tpl"}
{block name="body"}
    <main class="main-wrapper">
        <!-- Start Breadcrumb Area  -->

        <!-- Start My Account Area  -->

        <div class="axil-dashboard-area axil-section-gap">
            <div class="container">
                <div class="axil-dashboard-warp">
                    <div class="axil-dashboard-author">
                        <div class="media">
                            <div class="thumbnail">
                                <img src="/media/products_thumbnails/blank.jpg" style="width:100px;" alt="Hello Annie">
                            </div>
                            <div class="media-body">
                                <h5 class="title mb-0">{$user_info.0.names}</h5>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xl-3 col-md-4">
                            <aside class="axil-dashboard-aside">
                                <nav class="axil-dashboard-nav">
                                    <div class="nav nav-tabs" role="tablist">
                                        <a class="nav-item nav-link active" data-bs-toggle="tab" href="#nav-dashboard" role="tab" aria-selected="true"><i class="fas fa-th-large"></i>Dashboard</a>
                                        <a class="nav-item nav-link" data-bs-toggle="tab" href="#nav-orders" role="tab" aria-selected="false"><i class="fas fa-shopping-basket"></i>Orders</a>
                                        <a class="nav-item nav-link" data-bs-toggle="tab" href="#nav-downloads" role="tab" aria-selected="false"><i class="fas fa-file-download"></i>Downloads</a>
                                        <a class="nav-item nav-link" data-bs-toggle="tab" href="#nav-address" role="tab" aria-selected="false"><i class="fas fa-home"></i>Addresses</a>
                                        <a class="nav-item nav-link" data-bs-toggle="tab" href="#nav-account" role="tab" aria-selected="false"><i class="fas fa-user"></i>Account Details</a>
                                        <a class="nav-item nav-link" href="/logout"><i class="fal fa-sign-out"></i>Logout</a>
                                    </div>
                                </nav>
                            </aside>
                        </div>
                        <div class="col-xl-9 col-md-8">
                            <div class="tab-content">
                                <div class="tab-pane fade show active" id="nav-dashboard" role="tabpanel">
                                    <div class="axil-dashboard-overview">
                                        <div class="welcome-text">Hello {$user_info.0.names} (not <span>{$user_info.0.names}?</span> <a href="/logout">Log Out</a>)</div>
                                        <p>From your account dashboard you can view your recent orders, manage your shipping and billing addresses, and edit your password and account details.</p>
                                        {if $user_info[0].supplier == 0}
                                            <div class="mt-2 mb-2 border border-success p-4">
                                                <p class="font-weight-bolder pl-3 pr-3 mt-2">You are just a click away to start selling with Hambren.</p>
                                                <p class="pl-3 pr-3 mt-2">Fill in the supplier's application form and we shall contact you as soon as it is submited</p>
                                                <a href="javascript:supplierApplication()" class="pl-3 pr-3">
                                                    <button class="btn btn-danger rounded-0" >Apply now</button>
                                                </a>
                                            </div>
                                        {/if}
                                        {if $user_info[0].supplier == 1}
                                            <a href="https://vendor.hambren.com" class="btn btn-outline-primary mr-1 mb-1 p-3" style="font-size:18px">Vendor Dashboard</a>
                                        {/if}
                                    </div>
                                    {if isset($order_details)}
                                        <h4 class="text-center text-danger p-3">Items on order list</h4>
                                        <table class="table w-100">
                                            <thead>
                                            <tr>
                                                <th></th>
                                                <th></th>
                                                <th>Product</th>
                                                <th>Description</th>
                                                <th>Amount</th>
                                                <th>Attributes</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            {foreach $ordered_items item=list name=ordered_item}
                                                <tr>
                                                    <td>{$smarty.foreach.ordered_item.index + 1}</td>
                                                    <td>
                                                        <a href="//{$smarty.server.SERVER_NAME}/product/{$list.url}">
                                                            <img src="{$list.feature_photo}">
                                                        </a>
                                                        <br/>
                                                        <div class="text-center">
                                                            <small class="badge badge-danger p-2 rounded-circle">{$list.total_rates} / 5</small>
                                                        </div>
                                                        {for $counter=1 to 5}
                                                            <span onclick='rateProduct({$list.id}, {$counter}, "{$list.name}")' class="cursor star_{$list.id}_{$counter} star_{$list.id} {if $counter <= $list.user_rates}text-danger{/if}">
                                                                <i class="fa fa-star"></i>
                                                            </span>
                                                        {/for}
                                                    </td>
                                                    <td><a href="//{$smarty.server.SERVER_NAME}/product/{$list.url}">{$list.name}</a>
                                                    </td>
                                                    <td>{$list.description|nl2br}</td>
                                                    <td>USD {($list.amount * $list.qty)|number_format}</td>
                                                    <td>
                                                        {if ! empty($list.color)}<b>Color</b> <br/>{$list.color}{/if}
                                                        {if ! empty($list.size)}<br/><b>Size</b> <br/>{$list.size}{/if}
                                                    </td>
                                                </tr>
                                            {/foreach}
                                            <tr>
                                                <td colspan="4" class="align-content-end">Total</td>
                                                <td>USD {$order_details.0.amount|number_format}</td>
                                                <td></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    {/if}
                                </div>
                                <div class="tab-pane fade" id="nav-orders" role="tabpanel">
                                    <div class="axil-dashboard-order">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                <tr>
                                                    <th></th>
                                                    <th scope="col">Order</th>
                                                    <th scope="col">Date</th>
                                                    <th scope="col">Status</th>
                                                    <th scope="col">Total</th>
                                                    <th scope="col">Actions</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                {foreach $orders item=list name=order}
                                                    <tr>
                                                        <td>{$smarty.foreach.order.index + 1}</td>
                                                        <td><a href="//{$smarty.server.SERVER_NAME}/profile/order/{$list.id}">#ORDER{$list.id}</a></td>
                                                        <td>{$list.date_created}</td>
                                                        <td>{if $list.order_state == 0}Pending{elseif $list.order_state == 1}Submitted{elseif $list.order_state == 2}Delivered{elseif $list.order_state == 3}Returned{/if}</td>
                                                        <td>USD {$list.amount|number_format}</td>
                                                        <td><a href="#" class="axil-btn view-btn">View</a></td>

                                                    </tr>
                                                {/foreach}
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="nav-downloads" role="tabpanel">
                                    <div class="axil-dashboard-order">
                                        <p>You don't have any download</p>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="nav-address" role="tabpanel">
                                    <div class="axil-dashboard-address">
                                        <p class="notice-text">The following addresses will be used on the checkout page by default.</p>
                                        <div class="row row--30">
                                            <div class="col-lg-6">
                                                <div class="address-info mb--40">
                                                    <div class="addrss-header d-flex align-items-center justify-content-between">
                                                        <h4 class="title mb-0">Shipping Address</h4>
                                                        <a href="#" class="address-edit"><i class="far fa-edit"></i></a>
                                                    </div>
                                                    <ul class="address-details">
                                                        <li>Name: {$user_info.0.names}</li>
                                                        <li>Email: {$user_info.0.email}</li>

                                                        <li class="mt--30">{$user_info.0.country}</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="address-info">
                                                    <div class="addrss-header d-flex align-items-center justify-content-between">
                                                        <h4 class="title mb-0">Billing Address</h4>
                                                        <a href="#" class="address-edit"><i class="far fa-edit"></i></a>
                                                    </div>
                                                    <ul class="address-details">
                                                        <li>Name: {$addresses.company}</li>
                                                        <li>Email: {$addresses.email}</li>
                                                        <li>Phone: {$addresses.phone_no}</li>
                                                        <li class="mt--30">
                                                            {$addresses.street} <br/>{$addresses.country} -{$addresses.district}
                                                           </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="nav-account" role="tabpanel">
                                    <div class="col-lg-9">
                                        <div class="axil-dashboard-account">
                                            <form class="account-details-form">
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="form-group">
                                                            <label>Names</label>
                                                            <input type="text" class="form-control" value="{$user_info[0]['names']}">
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group mb--40">
                                                            <label>Country/ Region</label>
                                                            <input type="text" class="form-control" value="{$user_info[0]['country']}">
                                                            <p class="b3 mt--10">This will be how your name will be displayed in the account section and in reviews</p>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group mb--0">
                                                            <input type="submit" class="axil-btn" value="Save Changes">
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End My Account Area  -->
    </main>

{/block}