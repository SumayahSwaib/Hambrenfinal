//$(window).height();
let menu = 0;
function SideMenu() {
    if (menu === 0) {
        $(".small-menu").fadeIn("slow");
        let leftMenu = $(".menu-list").html();
        $(".small-menu-list").html(leftMenu);
        menu = 1;
    } else
        CloseSideMenu()
}

function CloseSideMenu() {
    menu = 0
    $(".small-menu").fadeOut("slow");
}

function closeSearchPop() {
    $(".search-products-pop").fadeOut("slow")

}

// let searchInputSmallToggle = 0;
// function ShowSearchInput(e) {
//     if (searchInputSmallToggle === 0) {
//         let searchInput = $(".search-duplicate").html();
//         $(".search-products-pop").fadeIn("slow")
//         $(e).removeClass("fa-search").addClass("fa-times");
//         searchInputSmallToggle = 1;
//     }else {
//         $(".search-input-show").fadeOut("slow").html("");
//         $(e).removeClass("fa-times").addClass("fa-search");
//         searchInputSmallToggle = 0;
//     }
// }

function searchProducts(e) {
    let value = $(e).val()
    $.get("/ajax-search", {q : value}, function success(data) {
        //console.log(data)
        let r = JSON.parse(data)
        $("#psearch-results").html(r)
    })
}

function searchBProducts(e) {
    let value = $(e).val()
    if (value.length < 1)
        $(".big-search").hide()
    else
        $(".big-search").show()
    $.get("/ajax-search", {q : value}, function success(data) {
        console.log(data)
        let r = JSON.parse(data)
        $(".psearch-results").html(r)
    })
}

const target = document.querySelector('.search-input-show');

document.addEventListener('click', (event) => {
    const withinBoundaries = event.composedPath().includes(target);

    if (withinBoundaries) {
    } else {

    }
});

function addCategory() {
    let html = "<div class='col-md-6 mx-auto'>" +
        "<h5>Add new category</h5>" +
        "<form action='//" + window.location.host + "/category/new' method='post' onsubmit='submitButton()'>" +
        "<input type='text' required class='form-control' name='category' placeholder='Add new category'/>" +
        "<label>Select state</label>" +
        "<select class='form-control' name='status'>" +
        "<option value='1'>Active</option>" +
        "<option value='0'>Inactive</option>" +
        "</select>" +
        "<label>Default Cost</label>" +
        "<input type='number' placeholder='Default Amount' name='amount' class='form-control'/>" +
        "<button class='btn btn-info rounded-0 mt-2 mb-2 submit-button' type='submit'>Save</button> " +
        "</form>" +
        "</div>";
    addContentToModal(html);
}

function addContentToModal(content) {
    $(".modal-content-fill").html(content);
    $(".custom-modal").fadeIn("slow");
}

function submitButton() {
    $(".submit-button").attr("disabled", "true");
}

function addSubCategory() {
    let html = "<div class='col-md-6 mx-auto'>" +
        "<h5>Add new sub category</h5>" +
        "<form action='//" + window.location.host + "/category/new_sub_category' method='post' onsubmit='submitButton()'>" +
        "<input type='text' required class='form-control' name='category' placeholder='Add new category'/>" +
        "<label>Select state</label>" +
        "<select class='form-control' name='status'>" +
        "<option value='1'>Active</option>" +
        "<option value='0'>Inactive</option>" +
        "</select>" +
        "<button class='btn btn-info rounded-0 mt-2 mb-2 submit-button' type='submit'>Save</button> " +
        "</form>" +
        "</div>";
    addContentToModal(html);
}

function addMetric() {
    let html = "<div class='col-md-6 mx-auto'>" +
        "<h5>Add measurement unit</h5>" +
        "<form action='//" + window.location.host + "/metrics/new_metric' method='post' onsubmit='submitButton()'>" +
        "<input type='text' required class='form-control' name='metric' placeholder='Add measurement units'/>" +
        "<label>Select state</label>" +
        "<select class='form-control' name='status'>" +
        "<option value='1'>Active</option>" +
        "<option value='0'>Inactive</option>" +
        "</select>" +
        "<button class='btn btn-info rounded-0 mt-2 mb-2 submit-button' type='submit'>Save</button> " +
        "</form>" +
        "</div>";
    addContentToModal(html);
}

function addCurrency() {
    let html = "<div class='col-md-6 mx-auto'>" +
        "<h5>Add currency</h5>" +
        "<form action='//" + window.location.host + "/currency/new_currency' method='post' onsubmit='submitButton()'>" +
        "<input type='text' required class='form-control' name='currency' placeholder='Add currency'/>" +
        "<label>Select state</label>" +
        "<select class='form-control' name='status'>" +
        "<option value='1'>Active</option>" +
        "<option value='0'>Inactive</option>" +
        "</select>" +
        "<button class='btn btn-info rounded-0 mt-2 mb-2 submit-button' type='submit'>Save</button> " +
        "</form>" +
        "</div>";
    addContentToModal(html);
}

function addSupplier() {
    let html = "<div class='col-md-6 mx-auto'>" +
        "<h5>Add Supplier</h5>" +
        "<form action='//" + window.location.host + "/supplier/new_supplier' method='post' onsubmit='submitButton()'>" +
        "<input type='text' required class='form-control border' style='border:1px solid black' name='supplier' placeholder='Supplier name'/>" +
        "<label>Select state</label>" +
        "<select class='form-control mt-2 mb-2' name='status'>" +
        "<option value='1'>Active</option>" +
        "<option value='0'>Inactive</option>" +
        "</select>" +
        "<label>Supplier email</label>" +
        "<input type='text' required class='form-control mt-2 mb-2' name='email' placeholder='Supplier email'/>" +
        "<label>Supplier phone numbers</label>" +
        "<input type='text' required class='form-control mt-2 mb-2' name='phone' placeholder='Supplier phone numbers'/>" +
        "<label>Supplier description</label>" +
        "<textarea  required class='form-control mt-2 mb-2' name='description' placeholder='Supplier description'></textarea>" +
        "<button class='btn btn-info rounded-0 mt-2 mb-2 submit-button' type='submit'>Save</button> " +
        "</form>" +
        "</div>";
    addContentToModal(html);
}

function newProductSizes() {
    let html = "<div class='col-md-6 mx-auto'>" +
        "<h5>Add Product sizes</h5>" +
        "<form action='//" + window.location.host + "/products/new_sizes' method='post' onsubmit='submitButton()'>" +
        "<input type='text' required class='form-control' name='size' placeholder='Size eg S, M, L, XL etc'/>" +
        "<label>Select state</label>" +
        "<select class='form-control mt-2 mb-2' name='status'>" +
        "<option value='1'>Active</option>" +
        "<option value='0'>Inactive</option>" +
        "</select>" +
        "<button class='btn btn-info rounded-0 mt-2 mb-2 submit-button' type='submit'>Save</button> " +
        "</form>" +
        "</div>";
    addContentToModal(html);
}

function newColor() {
    let html = "<div class='col-md-6 mx-auto'>" +
        "<h5>Add Product sizes</h5>" +
        "<form action='//" + window.location.host + "/products/new_colors' method='post' onsubmit='submitButton()'>" +
        "<input type='text' required class='form-control' name='color' placeholder='eg GRAY etc'/>" +
        "<label>Select state</label>" +
        "<select class='form-control mt-2 mb-2' name='status'>" +
        "<option value='1'>Active</option>" +
        "<option value='0'>Inactive</option>" +
        "</select>" +
        "<button class='btn btn-info rounded-0 mt-2 mb-2 submit-button' type='submit'>Save</button> " +
        "</form>" +
        "</div>";
    addContentToModal(html);
}

function updateProductColorAttr(color, product, e) {
    let checkBox = 0;
    if ($(e).is(':checked'))
        checkBox = 1;
   $.post("//" + window.location.host + "/products/update_product_color", {
    value :  color, product : product, action : checkBox
    });
}

function updateProductSizeAttr(size, product, e) {
    let checkBox = 0;
    if ($(e).is(':checked'))
        checkBox = 1;
    $.post("//" + window.location.host + "/products/update_product_size", {
        value :  size, product : product, action : checkBox

    });
}

function addThumbnail(product) {
    let html = "<div class='col-md-6 mx-auto'>" +
        "<form id='formUpload' method='post' enctype='multipart/form-data' action=\"//" + window.location.host + "/products/add_thumbnail\">" +
        "<h5>Add Product thumbnail</h5>" +
        "<input type='hidden' name='product' value=\"" + product + "\" />" +
        "<input type='file' name='file'><br/>" +
        "<div class='progress-bar'></div>" +
        "<button class='btn btn-info rounded-0 mt-2 mb-2 submit-button' type='submit'>Upload</button> " +
        "</form></div>";
    addContentToModal(html);
}

function addSupplierThumbnail(supplier) {
    let html = "<div class='col-md-6 mx-auto'>" +
        "<form id='formUpload' method='post' enctype='multipart/form-data' action=\"//" + window.location.host + "/supplier/add_thumbnail\">" +
        "<h5>Add supplier thumbnail</h5>" +
        "<input type='hidden' name='product' value=\"" + supplier + "\" />" +
        "<input type='file' name='file'><br/>" +
        "<div class='progress-bar'></div>" +
        "<button class='btn btn-info rounded-0 mt-2 mb-2 submit-button' type='submit'>Upload</button> " +
        "</form></div>";
    addContentToModal(html);
}

function activateFunction(page, action) {
    //Page is the exact page on which the manipulation is made
    //Action is either activate or deactivate
    let checkBoxes = $(".checkbox");
    let checkedBoxes = [];

    for (let i = 0; i < checkBoxes.length; i++)
        if ($(checkBoxes[i]).is(":checked"))
            checkedBoxes.push($(checkBoxes[i]).val());

    if (checkedBoxes.length < 1)
        return false;
    let html = "<div class='col-md-6 mx-auto'>" +
        "<h5 class='update-placeholder text-center'>Updating please wait.....</h5>" +
       "</div>";
    addContentToModal(html);
    $.post("//" + window.location.host + "/products/activate_deactivate", {data : checkedBoxes, page: page, action : action}, (data) => {
       console.log(data);
        $(".update-placeholder").html("successfully updated. <br/><button class='btn btn-dark' onclick='location.reload()'>OK</button>")
    })
}

function addToSpecialCategory(page, action) {
    //Page is the exact page on which the manupilation is made
    //Action is either activate or deactivate
    let checkBoxes = $(".checkbox");
    let checkedBoxes = [];

    for (let i = 0; i < checkBoxes.length; i++)
        if ($(checkBoxes[i]).is(":checked"))
            checkedBoxes.push($(checkBoxes[i]).val());

    if (checkedBoxes.length < 1)
        return false;
    let html = "<div class='col-md-6 mx-auto'>" +
        "<h5 class='update-placeholder text-center'>Updating please wait.....</h5>" +
        "</div>";
    addContentToModal(html);
    $.post("//" + window.location.host + "/products/special_categories", {data : checkedBoxes, page: page, action : action}, (data) => {
        console.log(data);
        $(".update-placeholder").html("successfully updated. <br/><button class='btn btn-dark' onclick='location.reload()'>OK</button>")
    })
}

function addToCart(id) {
    $.post("//" + window.location.host + "/create_cart", {item : id}, (data) => {
        console.log(data)
        let cartItems = JSON.parse(data)
        $(".cart").html(cartItems[0])
        let action = cartItems[1] === 0 ? "Remove <i class='fa fa-scissors'></i>" : "BUY"
        $(".added-cart" + id) . html(action)
        bottomPopUp("Cart successfully updated.")
    });
}

function addToWatchlist(id) {
    $.post("//" + window.location.host + "/create_watchlist", {item : id}, (data) => {
        let watchlistItems = JSON.parse(data);
        $(".watchlist").html(watchlistItems[0]);
        console.log(data)
        $(".added-watchlist" + id) . html("SAVED <i class='fa fa-check-circle text-primary'></i>")
        bottomPopUp("Watchlist successfully updated.")
    });
}

function  bottomPopUp(content) {
    $(".bottom-pop-up-overlay").fadeIn("slow").html(content).delay("5000").fadeOut("slow");
}

function calculateCartprice(e, id, small_form = false) {
    let price = 0;
    if (small_form)
        price = $("#sm_item_" + id).val();

    else
        price = $("#item_" + id).val();
    let qty = $(e).val();

    if (isNaN(qty))
        return false;
    if (qty < 1)
        return false;

    let total = price * qty;
    $(".subtotal_" + id).html("$ " + addCommas(total));
    updateCartTotals(small_form);
}

function addCommas(nStr)
{
    nStr += '';
    x = nStr.split('.');
    x1 = x[0];
    x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }
    return x1 + x2;
}

function updateCartTotals(smallDisplay = false) {
    let prices = 0;
    let qty = 0;
    // if (! smallDisplay) {
        prices = $(".item_price");
        qty = $(".item_qty");
    // }
    // else {
    //     prices = $(".sm_item_price"); // For small devices or big devices
    //     qty = $(".sm_item_qty");
    //}

    let totals = 0;
    let item_price = 0;
    let item_qty = 0;
    for (let i = 0; i < prices.length; i++) {
        item_price = $(prices[i]).val();
        item_qty = $(qty[i]).val();
        totals = totals + (item_price * item_qty);
    }
    $(".sub_total").html("$ " + addCommas(totals));
    $(".grand_total").html("$ " + addCommas(totals ));
}

function placeOrder(district, e) {
    $(e).attr("disabled", true)
    let paymentMode = 1
        jQuery("[name='payment']").each(function() {
        //console.log(this.value + ":" + this.checked);
        if (this.checked)
            paymentMode =  this.value
    })
    // console.log(paymentMode)
    // return;
    let description = $("#order-description").val();
    $.post("//" + window.location.host + "/checkout/place-order", {id : 1, district : district, description : description}, (data) => {
          console.log(data);
         // return;
        let order = JSON.parse(data);
        if (order) {
            if (paymentMode == 1)
                window.location = "/profile/order"
            else
                window.location = "/profile/" + order
        }
        else
            bottomPopUp("Checkout failed. Your cart may be empty already. Add some items.");
    })
}

function replaceOrder(id) {
    window.location = "/replace-order/" + id
}

function mailSubscription(e) {
    $(e).attr("disabled", true)
    let email = $(".email-subscription").val();
    $(".email-subscription").attr("disabled", true);
    $.post("//" + window.location.host + "/subscribe", {email : email}, (data) =>{
        //console.log(data);
        bottomPopUp(data);
    });
}

function rateProduct(product, counter, name) {
    $(".star_" + product).removeClass("text-danger");
    for(let i = 1; i <= counter; i++)
        $(".star_" + product + "_" + i).addClass("text-danger");

    $.post("//" + window.location.host + "/product/rate", {rates : counter, product : product}, (data) => {
       let reply = JSON.parse(data);
       if (reply) {
           let html = "<div class='col-md-6 mx-auto p-3 bg-dark text-white comment-area'>" +
               "<h5 class='text-center p-3 font-weight-bolder'>Thank you for rating " + name + "</h5> <h6>Share with us your experience with " + name + ".</h6>" +
               "<textarea class='form-control' id='rate-comment' placeholder='Add comment'></textarea>" +
               "<button class='btn btn-danger rounded-0 form-control mt-2 mb-2' onclick=\"addCommentToProduct( " + product + ", this)\">Comment</button>" +
               "</div>";
           addContentToModal(html)
       }
    });
}

function addCommentToProduct(product, e) {
    let comment = $("#rate-comment").val();
    $("#rate-comment").html("").attr("disabled", true);
    $(e).attr("disabled", true);
    $.post("//" + window.location.host + "/product/comment", {product : product, comment : comment}, (data) => {
        console.log(data);
        $(".comment-area").html("<h4 class='text-center p-4'>Thank you for your feedback." +
            "<br/><button class='btn btn-light mt-2 mb-2' onclick=\"$('.custom-modal').fadeOut('slow')\">Okay</button></h4>")
    });
}

function addThumbnailUrl(product) {
    let html = "<div class='col-md-6 mx-auto'>" +
        "<form id='formUpload' method='post'  action=\"//" + window.location.host + "/products/add_thumbnail_url\">" +
        "<h5>Image url goes here</h5>" +
        "<input type='text' class='form-control' name='url' placeholder='url goes here for the image'/>" +
        "<input type='hidden' name='product' value=\"" + product + "\" />" +
        "<button class='btn btn-info rounded-0 mt-2 mb-2 submit-button' type='submit'>Save Image</button> " +
        "</form></div>";
    addContentToModal(html);
}

function copyToClipBoard() {
    /* Get the text field */
    var copyText = document.getElementById("boo-link");

    /* Select the text field */
    copyText.select();
    copyText.setSelectionRange(0, 99999); /*For mobile devices*/

    /* Copy the text inside the text field */
    document.execCommand("copy");

    /* Alert the copied text */
    let html = "Copied the text: " + copyText.value;
    bottomPopUp(html);
}

function supplierApplication() {
    $.get("//" + window.location.host + "/get_addresses", (data) => {
        let response = JSON.parse(data);
        if (response) {
            //console.log(response);
            let html = "" +
                "<div class='col-md-8 mx-auto p-4 shadow'>" +
                "<form action='//"+ window.location.host + "/supplier/apply' method='post'>" +
                "<h4 class='text-center font-weight-bolder'>APPLICATION FORM</h4>" +
                "<div class='alert alert-info'>By filling this form, you are applying to sell with Boo store and you agree to our <a href='https://booo.store/terms'>terms and conditions</a></div>" +
                "<label>Business name</label>" +
                "<input type='text' name='company' required class='form-control rounded-0 border border-dark' placeholder='How is your business called.'>" +
                "<br/>" +
                "<label>Type of business</label>" +
                "<select class='form-control rounded-0' name='business-type'>" +
                "<option value='wholesaler'>Wholesaler (sell in bulk)</option>" +
                "<option value='retailer'>Retailer (Sell to end consumer)</option>" +
                "<option value='manufacturer'>Manufacturer</option>" +
                "<option value='others'>Others</option></select>" +
                "<br/>" +
                "<label>Tell us about your business</label>" +
                "<textarea name='description' required class='form-control rounded-0 border border-dark' placeholder='With your description, you will be helping us understand you better'></textarea>" +
                "<br/>" +
                "<label>Where is your business located?</label>" +
                "<textarea name='location' required class='form-control rounded-0 border border-dark' placeholder='Help us locate you faster'></textarea>" +
                "<br/>" +
                "<label>Phone numbers</label> " +
                "<input type='text' name='numbers' required class='form-control rounded-0 border border-dark' placeholder='This phone number(s) will help us contact you' />" +
                "<br/>" +
                "<label>Your Business email (Optional)</label>" +
                "<input type='email' name='email' class='form-control rounded-0 border border-dark' placeholder='We shall contact you with this email' />" +
                "<label>Website (Optional)</label>" +
                "<input type='text' class='form-control rounded-0 border border-dark' name='website' placeholder='Your business where we can link your account'/>" +
                "<br/>" +
                "<label>What do you sell?</label>" +
                "<textarea name='products' required class='form-control rounded-0 border border-dark' placeholder='What does your business sell?'></textarea>" +
                "<br/>" +
                "<label>State of operation </label>" +
                "<select class='form-control rounded-0' name='district'>";
                for (let i = 0; i < response.district_list.length; i++) {
                    html += "<option value='" + response.district_list[i]['id'] + "'>" + response.district_list[i]['district'] + "</option>";
                }
                html += "</select>" +
                "<label>Country of operation </label>" +
                "<select class='form-control rounded-0' name='country'>";
                for (let i = 0; i < response.country_list.length; i++) {
                    let disbabled = "";
                    if (response.country_list[i]['status'] === 0)
                        disbabled = "disabled = 'true'";
                    html += "<option value='" + response.country_list[i]['id'] + "' " + disbabled + ">" + response.country_list[i]['country'] + "</option>";
                }
                html += "</select>" +
                    "<button class='btn btn-danger rounded-0 mt-3 mb-3' onclick='submitButton()'>Submit Application</button>";
                html += "</form>" +
                    "</div>";
            addContentToModal(html);

        }
    });
}

function convertApplicationToSupplier() {
    console.log(applicantData);
    let html = "<div class='col-md-6 mx-auto'>" +
        "<h5>Add Supplier</h5>" +
        "<form action='//" + window.location.host + "/supplier/new_supplier' method='post' onsubmit='submitButton()'>" +
        "<input type='text' required class='form-control' value='" + applicantData.business_name + "' name='supplier' placeholder='Supplier name'/>" +
        "<label>Select state</label>" +
        "<select class='form-control mt-2 mb-2' name='status'>" +
        "<option value='1'>Active</option>" +
        "<option value='0'>Inactive</option>" +
        "</select>" +
        "<label>Supplier email</label>" +
        "<input type='text' required class='form-control mt-2 mb-2' value='" + applicantData.email + "' name='email' placeholder='Supplier email'/>" +
        "<label>Supplier phone numbers</label>" +
        "<input type='text' required class='form-control mt-2 mb-2' name='phone' value='" + applicantData.phone_number + "' placeholder='Supplier phone numbers'/>" +
        "<label>Supplier description</label>" +
        "<input type='hidden' name='user' value='" + applicantData.user + "' />"+
        "<textarea  required class='form-control mt-2 mb-2' name='description' placeholder='Supplier description'>"+ applicantData.description + "</textarea>" +
        "<button class='btn btn-info rounded-0 mt-2 mb-2 submit-button' type='submit'>Save</button> " +
        "</form>" +
        "</div>";
    addContentToModal(html);
}
let is_right_cart = 0;
function rightCart(cart = 1) {
    // if (is_right_cart === 0) {
    //     $(".right-cart").show("slow");
    //     is_right_cart = 1;

        $(".cart-body-1") . html("<div class='mt-5 text-warning p-5 text-center'>Loading content! please wait......</div>")
        $.get("/get-cart-content", {i : cart}, function success(data) {
            $(".cart-body-1").html(data)
        })
    // }
    // else {
    //     $(".right-cart").hide("slow");
    //     $(".right-cart-content").html('')
    //     is_right_cart = 0;
    // }
}