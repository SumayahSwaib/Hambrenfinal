{extends file="index.tpl"}
{block name="body"}
    <main class="main-wrapper">
        <!-- Start Breadcrumb Area  -->
        <div class="axil-breadcrumb-area">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-5 col-md-7  ">
                        <div class="inner">
                            <ul class="axil-breadcrumb">
                                <li class="axil-breadcrumb-item"><a href="index.html">Home</a></li>
                                <li class="separator"></li>
                                <li class="axil-breadcrumb-item active" aria-current="page">Contact</li>
                            </ul>
                            <h3 class="title ">Contact With Us</h3>
                            <p>Real-time and fast responses</p>
                           
                            <div class="contact-location mb--40">
                                <h6 class="title mb--20">Our Store</h6>
                                <span class="address mb--20">Canada Ontario Toronto</span><br>
                                <span class="phone">Phone: +1 (437) 980-3253</span><br>
                                <span class="email">Email: sales@hambrem.com</span>
                                <div class="opening-hour">
                                <P class="title mb--20">Opening Hours:</P>
                                <p>Monday to Saturday: 24hrs Open
                                    <br> Sundays: 24HRS Open
                                </p>
                            </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="inner">
                            <div class="bradcrumb-thumb">
                                <img src="assets/images/product/product-452.png" alt="Image">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Breadcrumb Area  -->

        <!-- Start Contact Area  -->
         
            <!-- Start About Area  -->
         <div class="axil-about-area about-style-2">
         <div class="container">
         <!-- this is the chage am to push -->
            <div class="row align-items-center mb--80 mb_sm--60">
                <div class="col-lg-5">
                    <div class="about-thumbnail">
                        <img src="assets/images/about/about-02.png" alt="about">
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="about-content content-right">
                    <h6 class="title mb--10">We would love to hear from you.</h6>
                                <p>If you’ve got great products your making or looking to work with us then drop us a line.</p>
                                
                    <!--put info-->
                    <form id="contact-form" method="POST" action="https://new.axilthemes.com/demo/template/etrade/mail.php" class="axil-contact-form">
                    <div class="row row--10">
                        <div class="col-lg-4">
                        
                            <div class="form-group">
                                <label for="contact-name">Name <span>*</span></label>
                                <input type="text" name="contact-name" id="contact-name">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="contact-phone">Phone <span>*</span></label>
                                <input type="text" name="contact-phone" id="contact-phone">
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="contact-email">E-mail <span>*</span></label>
                                <input type="email" name="contact-email" id="contact-email">
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group">
                                <label for="contact-message">Your Message</label>
                                <textarea name="contact-message" id="contact-message" cols="1" rows="2"></textarea>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group mb--0">
                                <button name="submit" type="submit" id="submit" class="axil-btn btn-bg-primary">Send Message</button>
                            </div>

                        </div>

                    </div>

                </form>

                        <!--put info-->
                    </div>
                </div>
            </div>
                    <!-- Start About Area  -->
        </div>
        <!-- End Contact Area  -->
    </main>


{/block}