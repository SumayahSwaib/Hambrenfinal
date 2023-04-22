<!doctype html>
<head>
    <title>Jaslac Digital Store</title>
    <link rel="shortcut icon" href="//{$smarty.server.SERVER_NAME}/assets/images/logo/logo-red.png">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;300&family=Open+Sans:wght@300&family=Montserrat:wght@600&display=swap" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-LSC70NT89F"></script>
    <script>
        {literal}
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'G-LSC70NT89F');
        {/literal}
    </script>
    <link rel="stylesheet" href="//{$smarty.server.SERVER_NAME}/assets/bootstrap/bootstrap.css" />
</head>
<body style="background: rgba(52, 58, 64, 1); font-family: 'Montserrat', sans-serif">
<div>
    <div style="text-align: center; margin-top: 40px; margin-bottom: 40px;">
        <a href="//{$smarty.server.SERVER_NAME}">
            <img src="/assets/images/logo/logo-red.png" style="width:200px" alt="logo">
        </a>
    </div>
    <div class="card col-md-4 mx-auto text-white border-0 shadow-none bg-transparent">
        <div class="card-header bg-transparent">
            <h4 class="card-header bg-transparent border-0 text-center">MAKE PAYMENT</h4>
        </div>
        <div class="card-body">
            {if isset($smarty.get.error)}
                <div class="alert alert-info bg-transparent border border-info text-white rounded-0">
                    <h4>ERROR</h4>
                    {$smarty.get.error}
                </div>
            {/if}
            <form action="/make-payment" method="post" onsubmit="$('#btn').html('<i>...PROCESSING PAYMENT<i>').attr('disabled', 'true')">
                    <table class="table table-warning">
                        <tr><th>Amount</th><th>Charges</th><th>Total</th></tr>
                        <tr><td>UGX {$amount.amount|number_format}</td><td>UGX {$amount.charge|number_format}</td><td><b>UGX {($amount.amount + $amount.charge)|number_format}</b></td></tr>
                    </table>
                    {if ! isset($smarty.get.message)}
                        <label>Mobile Money number</label>
                        <div class="input-group">
                            <select class="input-group-prepend"><option>+256</option></select>
                            <input type="number" required name="number" class="form-control rounded-0 bg-transparent text-white border-bottom border-white border-left-0 border-right-0 border-top-0" placeholder="Airtel or MTN"/>
                        </div>
                        <button class="btn btn-dark border border-warning form-control rounded-0 mt-4" type="submit" id="btn">CONFIRM PAYMENT</button>
                    {else}
                        <div class="shadow p-3">
                            {$smarty.get.message}
                            <br/>
                            <a href="/profile/order" class="btn btn-dark btn-outline-warning">Continue</a>
                        </div>
                    {/if}
                <div class="mt-3">Payments collection Powered by <a href="https://www.boosteds.co" class="font-weight-bolder text-warning">Boosted Payments.</a></div>
            </form>
        </div>
    </div>
</div>
</body>
<script src="/assets/jquery/jquery.3.4.1.js"></script>