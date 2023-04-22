{extends file="android_index.tpl"}
{block name="styles"}
    <style>
        .slidecontainer {
            width: 100%; /* Width of the outside container */
        }

        /* The slider itself */
        .slider {
            -webkit-appearance: none;  /* Override default CSS styles */
            appearance: none;
            width: 100%; /* Full-width */
            height: 10px; /* Specified height */
            background: #d3d3d3; /* Grey background */
            outline: none; /* Remove outline */
            opacity: 0.7; /* Set transparency (for mouse-over effects on hover) */
            -webkit-transition: .2s; /* 0.2 seconds transition on hover */
            transition: opacity .2s;
        }

        /* Mouse-over effects */
        .slider:hover {
            opacity: 1; /* Fully shown on mouse-over */
        }

        /* The slider handle (use -webkit- (Chrome, Opera, Safari, Edge) and -moz- (Firefox) to override default look) */
        .slider::-webkit-slider-thumb {
            -webkit-appearance: none; /* Override default look */
            appearance: none;
            width: 8px; /* Set a specific slider handle width */
            height: 15px; /* Slider handle height */
            background: #ffc107; /* Green background */
            cursor: pointer; /* Cursor on hover */
        }

        .slider::-moz-range-thumb {
            width: 25px; /* Set a specific slider handle width */
            height: 25px; /* Slider handle height */
            background: #ffc107; /* Green background */
            cursor: pointer; /* Cursor on hover */
        }
    </style>
{/block}
{block name="body"}
    <div style="width: 100%;" class="border-bottom border-warning shadow-sm">
        <h3 class="p-4 text-center font-weight-bolder">SHOP</h3>
    </div>
    <div class="container pt-2 ">
        <div class="row">
            <div class="col-6">
                <h6 class="pt-2 pb-2">Filter categories</h6>
                <select class="form-control border-0 rounded-0">
                    {foreach $categories item=list}
                        <option>
                            {$list.category}
                        </option>
                    {/foreach}
                </select>
            </div>
            <div class="col-6">
                <div class="row">
                    <h6 class="col-12 pt-2 pb-2">Filter prices</h6>
                    <div class="col-6">
                        <div class="slidecontainer">
                            <small>Above</small><br/>
                            <small><span id="demo"></span>/-</small>
                            <input type="range" min="1" max="100" value="50" class="slider" id="myRange">
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="slidecontainer">
                            <small>Below</small><br/>
                            <small><span id="demo2"></span>/-</small>
                            <input type="range" min="1" max="100" value="50" class="slider" id="myRange2">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mb-3 mt-3 more-feeds">
            {foreach $recently_added_products item=list}
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
        </div>
    </div>
{/block}
{block name="scripts"}
    <script>
        const slider = document.getElementById("myRange");
        const output = document.getElementById("demo");
        output.innerHTML = slider.value; // Display the default slider value

        // Update the current slider value (each time you drag the slider handle)
        slider.oninput = function() {
            output.innerHTML = this.value;
        }
        const slider1 = document.getElementById("myRange2");
        const output1 = document.getElementById("demo2");
        output1.innerHTML = slider.value; // Display the default slider value

        // Update the current slider value (each time you drag the slider handle)
        slider.oninput = function() {
            output.innerHTML = this.value;
        }
        slider1.oninput = function() {
            output1.innerHTML = this.value;
        }
    </script>
{/block}