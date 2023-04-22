{extends file="index.tpl"}
{block name="body"}
    <div class="default-layout-pc_outer__jEU3P">
        <div class="swiper-container" style="padding: 10px">
            <div id="home-product_list">
                {if isset($smarty.get.q)}
                    <h1 style="text-align: center">No products found with query <b>{$smarty.get.q}.</b></h1>
                {/if}
            </div>
        </div>
    </div>
{/block}