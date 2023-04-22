{extends file="index.tpl"}
{block name="body"}
    <body>
<div class="axil-signin-area">
    <div class="row">
        <div class="col-xl-4 col-lg-6">
            <div class="axil-signin-banner bg_image bg_image-- theme-bg">
                <h3 class="title">We Offer the Best Products</h3>
            </div>
        </div>
        <div class="col-lg-6 offset-xl-2">
            <div class="axil-signin-form-wrap">
                <div class="axil-signin-form">
                    <h3 class="title">Sign up to Hambren.</h3>
                    {if ! isset($smarty.get.error)}
                        <p class="b2 mb--55">Enter your detail below</p>
                    {else}
                        <p class="b2 mb--55 text-danger border-danger">
                        {$smarty.get.error}
                        </p>
                    {/if}
                    <form class="singin-form" action="/create-account" method="post">
                        <div class="form-group">
                            <label>Names</label>
                            <input type="text" name="names" class="form-control rounded-0 " required placeholder="Your fullnames"/>
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" name="email" class="form-control" required placeholder="Email address"/>
                        </div>
                        <div class="form-group">
                            <label>DOB</label>
                            <input type="date" name="dob" class="form-control " required placeholder="Date Of Birth"/>
                        </div>
                        <div class="form-group">
                            <label>Gender</label>
                            <select name="gender" required class="form-control ">
                                <option value="1">MALE</option>
                                <option value="2">FEMALE</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" required name="password" class="form-control " placeholder="Password">
                        </div>

                        <div class="form-group d-flex align-items-center justify-content-between">
                            <button type="submit" class="axil-btn btn-bg-primary submit-btn">Signup</button>
                            <a href="/forgot-password" class="forgot-btn">Forget password?</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


{/block}