{extends file="index.tpl"}
{block name="body"}
    <body>
    <div class="axil-signin-area">

        <!-- Start Header -->
        <div class="signin-header">
            <div class="row align-items-center">
                <div class="col-sm-4">
                    <a href="/" class="site-logo"><img src="/assets/images/logo/hambren.png" style="width:100px" alt="logo"></a>
                </div>
                <div class="col-sm-8">
                    <div class="singin-header-btn">
                        <p>Not a member?</p>
                        <a href="/register" class="axil-btn btn-bg-secondary sign-up-btn">Sign Up Now</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Header -->

        <div class="row">
            <div class="col-xl-4 col-lg-6">
                <div class="axil-signin-banner bg_image bg_image-- theme-bg">
                    <h3 class="title">We Offer the Best Products</h3>
                </div>
            </div>
            <div class="col-lg-6 offset-xl-2">
                <div class="axil-signin-form-wrap">
                    <div class="axil-signin-form">
                        <h3 class="title">Sign in to Hambren.</h3>
                        {if ! isset($smarty.get.error)}
                            <p class="b2 mb--55">Enter your detail below</p>
                        {else}
                            <p class="b2 mb--55 text-danger border-danger">
                                {$smarty.get.error}
                            </p>
                        {/if}
                        <form class="singin-form" action="/auth" method="post">
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" class="form-control" name="email" placeholder="doe@gmail.com">
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input type="password" class="form-control" name="password" placeholder="password">
                            </div>
                            <div class="form-group d-flex align-items-center justify-content-between">
                                <button type="submit" class="axil-btn btn-bg-primary submit-btn">Sign In</button>
                                <a href="/forgot-password" class="forgot-btn">Forget password?</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


{/block}