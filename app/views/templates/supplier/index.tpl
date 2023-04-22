{extends file ="index.tpl"}
{block name="meta"}
    <title>Sell online with Boo store</title>
    <meta name="keywords" content="Sell with Boo store, How to sell online, sell online, online store, Uganda online store, Boo, Boo store, Boosted Store, Boosted Technologies, DevMate, Tumusiime, Rickie Ashan Tumusiime, boo.store, booo.store, Boosted Technologies Uganda, Ugandan online store, Online boo, Booo store, Betty Happy"/>
    <meta name="description" content="Are you an a manufacturer, wholesaler or retailer, our growing audience is ready to buy your products at your price. Sell now">
    <meta name="contact" content="office[at]boostedtechs[dot]com" />
    <meta name="author" content="DevMate <https://devmate.boostedtechs.com>" />
    <meta name="copyright" content="Boosted Technologies" />
    <meta Name="rating" content="General"/>
    <meta property="og:site_name" content="Sell online with Boo store">
    <meta property="og:description" content="Are you an a manufacturer, wholesaler or retailer, our growing audience is ready to buy your products at your price. Sell now">
    <meta property="og:image" content="//{$smarty.server.SERVER_NAME}/assets/images/others/sell-with-boo.png">
    <PageMap>
        <DataObject type="thumbnail">
            <Attribute name="src" value="https://{$smarty.server.SERVER_NAME}/assets/images/others/sell-with-boo.png"/>
            <Attribute name="width" value="100"/>
        </DataObject>
        <DataObject type="action">
            <Attribute name="label" value="Shop now"/>
            <Attribute name="url" value="https://booo.store"/>
            <Attribute name="class" value="download"/>
        </DataObject>
        <DataObject type="publication">
            <Attribute name="author" value="Boosted Technologies"/>
            <Attribute name="date" value="1ST NOV 2020"/>
            <Attribute name="category" value="E-commerce"/>
        </DataObject>
    </PageMap>
{/block}
{block name="body"}
    {include file="small-bar.tpl"}
    <div class="container">
        {include file="checkout/left-bar.tpl"}
        <div class="col-md-12 mt-3 mb-3">
            <div class="list-group list-group-horizontal">
                <div class="list-group-item border-0 bg-transparent"><a href="//{$smarty.server.SERVER_NAME}">Home</a> <i class="fa fa-angle-right"></i></div>
                <div class="list-group-item border-0 bg-transparent">Sell with Boo store</div>
            </div>
        </div>
        <div class="col-md-8 mx-auto">
            <img src="//{$smarty.server.SERVER_NAME}/assets/loading.gif" lsrc="//{$smarty.server.SERVER_NAME}/assets/images/others/sell-with-boo.png" class="w-100"/>
            <h4 class="text-center font-weight-bolder p-4">Sell with Boo store</h4>
            <h5 class="font-weight-bolder pt-3 pb-2 border-top border-bottom">What is Boo store?</h5>
            <p>We are an online store (Market place) selling out a variety of products and services to our clients in Uganda at pocket friendly prices.</p>
            <p>We are managed by <a href="//boostedtechs.com">Boosted Technologies</a></p>
            <h5 class="font-weight-bolder pt-3 pb-2 border-top border-bottom">Why do i sell with boo store?</h5>
            <p>
                Are you a manufacturer, wholesaler or retailer? Regradless of what you sell, Boo store is here to sell it for you.
            </p>
            <p>
                With our ever growing audience, we assure market for your products.
            </p>
            <p>
                We do not keep your products at our stores. We pick your products for delivery when ordered and cash payments are made instantly.
            </p>
            <h5 class="font-weight-bolder pt-3 pb-2 border-top border-bottom">How do i start selling with Boo store?</h5>
            <p>It has never been hard to sell with Boo store. Meet the right audience to sell your products now.</p>
            <ol type="i">
                <li>Create an account from  <a href="//{$smarty.server.SERVER_NAME}/profile">here</a>. <br/>When not logged in, you will be required to signup with Boosted Technologies Auth.</li>
                <li>To create an account, you will be redirected to our secure login platform https://auth.boostedtechs.com where you shall be requested to login with your Google.</li>
                <li>We only ask for your google username, email and profile picture. That is all we ask for.</li>
                <li>Then, on successful authorization of Boosted Auth to access your Google account, you will be redirected to Your Boosted Auth Dashboard.</li>
                <li class="alert alert-warning"><b>Boosted AUTH is Boosted Technologies'</b> login platform. You only need one account to access all Boosted Technologies' online products, manage transactions among other activities.</li>
                <li>On your Boosted Auth dashboard, you will be asked to grant access to Boo Store. Clicking on Grant Access button shall redirect you back to boo store.</li>
                <li>On successful login, you will receive a popup welcoming you to Boo Store and an email sent your provided email address</li>
                <li>On your Boo Dashboard, there will be an option button to become a supplier. Click on it and fill out the application form</li>
                <li>We shall receive your form and you will be contacted in few hours from your application.</li>
                <li>Arrangements shall be made we visit your store or work location. This is always done in less than 2 days from the day of your application</li>
            </ol>
            <div class="text-center mt-2 mb-2">
                <a href="//{$smarty.server.SERVER_NAME}/profile">
                    <button class="btn btn-danger rounded-0">Start selling now</button>
                </a>
            </div>
        </div>
    </div>
{/block}