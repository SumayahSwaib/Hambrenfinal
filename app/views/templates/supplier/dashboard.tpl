{extends file="index.tpl"}
{block name="meta"}
    <title>Vendor application - Dashboard</title>
{/block}
{block name="body"}
    <div class="container">
        <div class="col-md-12 mt-5 mb-5">
            {if ! ($user_info)}
                <h6 class="p-2 text-center">You are not logged in.</h6>
            {else}
                <div class="row mb-3">
                    <div class="col-md-8">
                        {if $user_info[0].supplier == 1}
                            <h4 class="text-center">Supplier Information</h4>
                            {if $application_data.status == 0}
                                <div class="alert alert-warning text-center">
                                    <b>Your application has been received.</b>
                                </div>
                                <div class="card border-0 shadow">
                                <div class="card-header">
                                    <a href="#suppliers" class="text-danger font-weight-bolder">
                                        Your application
                                        <span class="float-right"><i class="fa fa-angle-down"></i></span>
                                    </a>
                                </div>
                                <div class="card-body" id="suppliers">
                                    <form action="//{$smarty.server.SERVER_NAME}/supplier/update" method='post'>
                                        <h4 class='text-center font-weight-bolder'>BUSINESS INFORMATION</h4>
                                        <label>Business name</label>
                                        <input type='text' name='company' value="{$application_data.business_name}" required class='form-control rounded-0' placeholder='How is your business called.'>
                                        <br/>
                                        <label>Type of business ({$application_data.business_type})</label>
                                        <select class='form-control rounded-0' name='business-type'>
                                            <option value='wholesaler'>Wholesaler (sell in bulk)</option>
                                            <option value='retailer'>Retailer (Sell to end consumer)</option>
                                            <option value='manufacturer'>Manufacturer</option>
                                            <option value='others'>Others</option></select>
                                        <br/>
                                        <label>Tell us about your business</label>
                                        <textarea name='description' required class='form-control rounded-0' placeholder='With your description, you will be helping us understand you better'>{$application_data.description}</textarea>
                                        <br/>
                                        <label>Where is your business located?</label>
                                        <textarea name='location' required class='form-control rounded-0' placeholder='Help us locate you faster'>{$application_data.address}</textarea>
                                        <br/>
                                        <label>Phone numbers</label>
                                        <input type='text' name='numbers' required class='form-control rounded-0' value="{$application_data.phone_number}" placeholder='This phone number(s) will help us contact you' />
                                        <br/>
                                        <label>Your Business email (Optional)</label>
                                        <input type='email' name='email' class='form-control rounded-0' value="{$application_data.email}" placeholder='We shall contact you with this email' />
                                        <label>Website (Optional)</label>
                                        <input type='text' class='form-control rounded-0' name='website' value="{$application_data.website}" placeholder='Your business where we can link your account'/>
                                        <br/>
                                        <label>What do you sell?</label>
                                        <textarea name='products' required class='form-control rounded-0' placeholder='What does your business sell?'>{$application_data.items_sold}</textarea>
                                        {if $application_data.status == 0}
                                            <button class="btn btn-danger rounded-0 mt-2 mb-2">UPDATE</button>
                                        {/if}
                                    </form>
                                </div>
                                {elseif $application_data.status == 1}
                                <div class="alert alert-warning text-center">
                                    <b>You are now a Vendor with Hambren</b>
                                    <br/>
                                    <a class="btn btn-danger rounded-0 border-0 text-white" href="https://vendor.hambren.com/">Login to your vendor Account</a>
                                </div>
                            {/if}
                            </div>
                        {/if}
                    </div>
                </div>
            {/if}
        </div>
    </div>
{/block}