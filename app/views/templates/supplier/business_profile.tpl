{extends file="index.tpl"}
{block name="meta"}
    {block name="meta"}
        <title>Business prodile - Dashboard</title>
    {/block}
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.10.20/b-1.6.1/b-html5-1.6.1/b-print-1.6.1/fh-3.1.6/kt-2.5.1/r-2.2.3/sc-2.0.1/sp-1.0.1/datatables.min.css"/>
{/block}
{block name="body"}
    <div class="container">
        <div class="col-md-12 mt-5 mb-5">
            {if ! ($user_info)}
                <h6 class="p-2 text-center">You are not logged in.</h6>
                <a class="text-dark" href="{$domain.auth}/app/{$key}?i=4&redirect={$domain.redirect}">
                    <h4 class="p-2 text-center"><button class="btn btn-danger">Sign up</button></h4>
                </a>
            {else}
                <div class="row mb-3">
                    {include "profile/profile_menu.tpl"}
                    <div class="col-md-8">
                        <table class="table table-responsive shadow">
                            <thead>
                            <tr>
                                <th>All products</th>
                                <th>Orders</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>{$order_summary.0.products}</td>
                                <td></td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="p-4 shadow mb-4">
                            Here is your business page link. You can copy it and share to your customers to come and purchase.
                            <div class="input-group">
                                <input type="text"  class="form-control" id="boo-link" value="http://{$smarty.server.SERVER_NAME}/supplier/{$suppliers.0.url}"/>
                                <button class="input-group-append btn btn-danger" onclick="copyToClipBoard()">Copy link <i class="fa fa-copy"></i></button>
                            </div>
                        </div>
                        <table class="table table-responsive shadow">
                            <thead>
                            <tr>
                                <th></th>
                                <th>Business</th>
                                <th>Email</th>
                                <th>Contacts</th>
                                <th>Description</th>
                                <th>Date created</th>
                                <th>Date Updated</th>
                                <th>Status</th>
                                <th>Owner</th>
                            </tr>
                            </thead>
                            <tbody>
                            {$i = 1}
                            {foreach $suppliers item=list}
                                <tr class="{if $list.status == 0}  alert alert-danger{/if}">
                                    <td>{$i++}</td>
                                    <td><a href="//{$smarty.server.SERVER_NAME}/supplier/{$list.url}">{$list.supplier}</a></td>
                                    <td>{$list.email}</td>
                                    <td>{$list.contacts}</td>
                                    <td>{$list.description}</td>
                                    <td>{$list.date_created}</td>
                                    <td>{$list.date_updated}</td>
                                    <td>{if $list.status == 0} Inactive {else}Active{/if}</td>
                                    <td>{$list.names}</td>
                                </tr>
                            {/foreach}
                            </tbody>
                        </table>
                        <div class="card mt-3 mb-3 border-0 shadow">
                            <div class="card-header bg-transparent font-weight-bolder">
                                {*<button class="btn btn-primary float-right" onclick="addSupplierThumbnail({$list.id})">Add images</button>*}
                                <h5>Business images</h5>
                                <h6 class="alert alert-warning">Feature photo is either your business logo another unique photo that makes your business unique on boo store</h6>
                            </div>
                            <div class="card-body" id="images">
                                <table class="table table-responsive shadow">
                                    <thead>
                                    <tr>
                                        <th></th>
                                        <th>Photo</th>
                                        <th>Feature Photo</th>
                                        <th>Link</th>
                                        <th>Date created</th>
                                        <th>Status</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    {$i = 1}
                                    {foreach $photos item=list}
                                        <tr class="{if $list.status == 0}  alert alert-danger{/if}">
                                            <td>{$i++}</td>
                                            <td>
                                                <a href="//{$smarty.server.SERVER_NAME}/media/suppliers/{$list.photo}">
                                                    <img src="//{$smarty.server.SERVER_NAME}/media/suppliers/{$list.photo}" style="width:100px;"/>
                                                </a>
                                            </td>
                                            <td>
                                                {if $list.feature_photo == 1}
                                                    <a href="//{$smarty.server.SERVER_NAME}/thumbnail/make_feature/{$list.id}/{$list.supplier}?i=1&t=product_supplier_images">Remove feature photo</a>
                                                {else}
                                                    <a href="//{$smarty.server.SERVER_NAME}/thumbnail/make_feature/{$list.id}/{$list.supplier}?i=2&t=product_supplier_images">
                                                        Make feature photo
                                                    </a>
                                                {/if}
                                            </td>
                                            <td>
                                                {$list.photo}
                                            </td>
                                            <td>
                                                {$list.date_created}
                                            </td>
                                            <td>
                                                {if $list.status == 1} Active {else} Inactive {/if}
                                            </td>
                                        </tr>
                                    {/foreach}
                                    </tbody>
                                </table>
                                {*<div class="dropdown float-right">*}
                                    {*<button type="button" class="btn btn-dark rounded-0 dropdown-toggle" data-toggle="dropdown">*}
                                        {*Choose action*}
                                    {*</button>*}
                                    {*<div class="dropdown-menu">*}
                                        {*<a class="dropdown-item active" href="javascript:activateFunction('product_supplier_images', 1)">Activate</a>*}
                                        {*<a class="dropdown-item" href="javascript:activateFunction('product_supplier_images', 2)">De activate</a>*}
                                    {*</div>*}
                                {*</div>*}
                            </div>
                        </div>
                    </div>
                </div>
            {/if}
        </div>
    </div>
{/block}
{block name="scripts"}
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.10.20/b-1.6.1/b-html5-1.6.1/b-print-1.6.1/fh-3.1.6/kt-2.5.1/r-2.2.3/sc-2.0.1/sp-1.0.1/datatables.min.js"></script>
    <script>
        $(document).ready(function() {
            let currentPage = {if isset($current_page)}{$current_page|json_encode}{else}'xx'{/if};
            $("."+currentPage).addClass("active");
            $('.table').DataTable({
                dom: 'Bfrtip',
                responsive: true,
                fixedHeader: false,
                buttons: [
                    'copyHtml5',
                    'excelHtml5',
                    'csvHtml5',
                    'pdfHtml5'
                ]
            } );
            $('a[data-toggle="collapse"]').on('shown.bs.collapse', function (e) {
                $($.fn.dataTable.tables(true)).DataTable()
                    .columns.adjust()
                    .responsive.recalc();
            });
        } );
    </script>
{/block}