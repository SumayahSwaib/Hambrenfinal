<?php
if ( !defined('APPLICATION_LOADED') || !APPLICATION_LOADED ) {
    echo json_encode(array("status" => "fail", "code" => "503", "message" => "Invalid request"));
}
//Less define our simple routes in this file to help us map to the exact methods in our project

$routes['']                                  =               "Home/index";
$routes['about_us']                          =               "Home/about_us";
$routes['contact_us']                        =               "Home/contact_us";
$routes['privacy_policy']                    =               "Home/privacy_policy";
$routes['order-tracking']                    =               "Home/order_tracking";
$routes['payment-methods']                   =               "Home/payment_methods";
$routes['return-policy']                     =               "Home/return_policy";
$routes['refund_policy']                     =               "Home/refund_policy";
$routes['shipping_policy']                   =               "Home/shipping_policy";
$routes['terms_of_service']                  =               "Home/terms_of_service";
$routes['search']                            =               "Home/search";



/*
 * Shopping process
 */
$routes['cart']                              =               "Shop/cart";
$routes['checkout']                          =               "Shop/checkout";
$routes['shop']                              =               "Products/shop";
$routes['wishlist']                          =               "Shop/wishlist";

/*
 * Product Items
 */

$routes['product/(:any)']                     =                "Products/item/$`";

/*
 * User's section
 */
$routes['profile']                           =                "User/index";
$routes['login']                             =                "User/sign_in";
$routes['register']                          =                "User/register";
$routes['forgot-password']                   =                "User/forgot_password";
$routes['wishlist']                          =                "User/wishlist";

/*
 * Dynamic routes
 */

$routes['(:any)']                            =                "Products/index";
