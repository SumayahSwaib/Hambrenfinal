<div class="col-md-4 wow slideInUp" data-wow-duration="2s" data-wow-delay=".3">
    <div class="menu-list sm-hide" style="display: none">
        <div class="list-group">
            <div class="list-group-item">Shop from</div>
            {foreach $categories item=list}
                <div class="list-group-item profile-menu"><a href="//{$smarty.server.SERVER_NAME}/{$list.url}"><span class="fa fa-angle-right float-right"></span> {$list.category}</a></div>
            {/foreach}
        </div>
    </div>
</div>