{extends file="_index.tpl"}
{block name="body"}
    <div class="authincation h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100 align-items-center">
                <div class="col-md-6">
                    <div class="authincation-content">
                        <div class="row no-gutters">
                            <div class="col-xl-12">
                                <div class="auth-form">
                                    <div class="text-center mb-3">
                                        <a href="/"><img src="/assets/icons/logo.png" alt="" style="width:50px"></a>
                                    </div>
                                    <h4 class="text-center mb-4 text-white">Forgot Password</h4>
                                    <form action="index.html">
                                        <div class="form-group">
                                            <label class="text-white"><strong>Email</strong></label>
                                            <input type="email" class="form-control" value="hello@example.com">
                                        </div>
                                        <div class="text-center">
                                            <button type="submit" class="btn bg-white text-primary btn-block">SUBMIT</button>
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

{/block}