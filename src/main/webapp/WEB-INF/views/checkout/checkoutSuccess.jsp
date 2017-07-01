<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<body class="checkout-cart-index">
    	
        <div class="wrapper">
            <noscript>
                <div class="global-site-notice noscript">
                    <div class="notice-inner">
                        <p> <strong>JavaScript seems to be disabled in your browser.</strong>
                            <br /> You must have JavaScript enabled in your browser to utilize the functionality of this website.</p>
                    </div>
                </div>
            </noscript>

            <div class="page one-column">

                <div class="wrapper-breadcrums">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-24">
                                <div class="breadcrumbs">
                                    <ul>
                                        <li class="home"> <a href="index.html" title="Go to Home Page"><span >Home</span></a> <span class="separator">/ </span>
                                        </li>
                                        <li class="cms_page"> <strong>Checkout</strong>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- /.wrapper-breadcrums -->

                <div class="em-wrapper-main">
                    <div class="container container-main">
                        <div class="em-inner-main">
                            <div class="em-wrapper-area02"></div>
                            
                            <div class="em-main-container em-col2-left-layout">
                                <div class="row">
                                    <div class="col-sm-18 col-sm-push-6 em-col-main">
                                        <div class="em-wrapper-area03"></div>
                                        <div class="page-title">
                                            <h1>Checkout</h1>
                                        </div>
                                        <ol class="opc" id="checkoutSteps">
                                        	<li id="opc-payment" class="section">
                                                <div class="em-box-02 step-title collapsed" data-toggle="collapse">
                                                    <div class="title-box"> <span class="number">4</span>
                                                        <h2>Payment Information</h2> 
                                                    </div>
                                                </div>
                                                <div id="checkout-step-payment" class="step a-item collapse">
                                                    <form id="co-payment-form">
                                                        <fieldset>
                                                            <dl class="sp-methods" id="checkout-payment-method-load"></dl>
                                                        </fieldset>
                                                    </form>
                                                    <div class="tool-tip" id="payment-tool-tip" style="display:none;">
                                                        <div class="btn-close"><a href="#" id="payment-tool-tip-close" title="Close">Close</a>
                                                        </div>
                                                        <div class="tool-tip-content"><img src="images/cvv.gif" alt="Card Verification Number Visual Reference" title="Card Verification Number Visual Reference" />
                                                        </div>
                                                    </div>
                                                    <div class="buttons-set" id="payment-buttons-container">
                                                        <p class="required">* Required Fields</p>
                                                        <p class="back-link"><a href="#"><small>&laquo; </small>Back</a>
                                                        </p>
                                                        <button type="button" class="button"><span><span>Continue</span></span>
                                                        </button> <span class="please-wait" id="payment-please-wait" style="display:none;"> <img src="images/opc-ajax-loader.gif" alt="Loading next step..." title="Loading next step..." class="v-middle" /> Loading next step... </span>
                                                    </div>
                                                </div><!-- /#checkout-step-payment -->
                                            </li><!-- /#opc-payment -->
                                            <li id="opc-billing">
                                                <div class="em-box-02 step-title">
                                                    <div class="title-box"> <span class="number">1</span>
                                                        <h2>Billing Information</h2> 
                                                    </div>
                                                </div>
                                                <div id="checkout-step-billing" class="step a-item collapse in">
                                                    <form id="co-billing-form">
                                                        <fieldset>
                                                            <ul class="form-list">
                                                                <li id="billing-new-address-form">
                                                                    <fieldset>
                                                                        <input type="hidden" name="billing[address_id]" value="215" id="billing:address_id" />
                                                                        <ul>
                                                                            <li class="fields">
                                                                                <div class="customer-name-middlename">
                                                                                    <div class="field name-firstname">
                                                                                        <label for="user_realname" class="required">Name</label>
                                                                                        <div class="input-box">
                                                                                            <input type="text" id="user_realname" name="user_realname" value="${session_user['realname']}" title="Name" class="input-text" readonly/>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </li>
                                                                            <li class="wide">
                                                                                <label for="user_address" class="required">Address</label>
                                                                                <div class="input-box">
                                                                                    <input type="text" title="Address 1" name="user_addr1" id="user_addr1" value="${session_user['addr1']}" class="input-text" readonly/>
                                                                                </div>
                                                                            </li>
                                                                            <li class="wide">
                                                                                <div class="input-box">
                                                                                    <input type="text" title="Address 2" name="user_addr2" id="user_addr2" value="${session_user['addr2']}" class="input-text" readonly/>
                                                                                </div>
                                                                            </li>
                                                                            <li class="fields">
                                                                                <div class="field">
                                                                                    <label for="user_postcode" class="required">Postal Code</label>
                                                                                    <div class="input-box">
                                                                                        <input type="text" title="Postal Code" name="user_postcode" id="user_postcode" value="${session_user['postcode']}" class="input-text" readonly/>
                                                                                    </div>
                                                                                </div>
                                                                            </li>
                                                                            <li class="fields">
                                                                                <div class="field">
                                                                                    <label for="user_phone" class="required">Phone</label>
                                                                                    <div class="input-box">
                                                                                        <input type="text" name="user_phone" id="user_phone" value="${session_user['phone']}" title="Phone" class="input-text" readonly/>
                                                                                    </div>
                                                                                </div>
                                                                            </li>
                                                                            <li class="no-display">
                                                                                <input type="hidden" name="billing[save_in_address_book]" value="1" />
                                                                            </li>
                                                                        </ul>
                                                                        <div id="window-overlay" class="window-overlay" style="display:none;"></div>
                                                                        <div id="remember-me-popup" class="remember-me-popup" style="display:none;">
                                                                            <div class="remember-me-popup-head">
                                                                                <h3>What's this?</h3> <a href="#" class="remember-me-popup-close" title="Close">Close</a>
                                                                            </div>
                                                                            <div class="remember-me-popup-body">
                                                                                <p>Checking &quot;Remember Me&quot; will let you access your shopping cart on this computer when you are logged out</p>
                                                                                <div class="remember-me-popup-close-button a-right"> <a href="#" class="remember-me-popup-close button" title="Close"><span>Close</span></a>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </fieldset>
                                                                </li>
                                                                <li class="control">
                                                                    <input type="checkbox" name="billing[use_for_shipping]" id="use_for_shipping_yes" title="Ship to this address" class="checkbox" />
                                                                    <label for="use_for_shipping_yes">Ship to this address</label>
                                                                </li>
                                                                <!-- <li class="control">
                                                                    <input type="radio" name="billing[use_for_shipping]" id="billing:use_for_shipping_no" value="0" title="Ship to different address" class="radio" />
                                                                    <label for="billing:use_for_shipping_no">Ship to different address</label>
                                                                </li> -->
                                                            </ul>
                                                            <div class="buttons-set" id="billing-buttons-container">
                                                                <button type="button" title="Continue" class="button"><span><span>Continue</span></span>
                                                                </button> <span class="please-wait" id="billing-please-wait" style="display:none;"> <img src="images/opc-ajax-loader.gif" alt="Loading next step..." title="Loading next step..." class="v-middle" /> Loading next step... </span>
                                                            </div>
                                                        </fieldset>
                                                    </form>
                                                </div><!-- /#checkout-step-billing -->
                                            </li><!-- /#opc-billing -->
                                            <li id="opc-shipping" class="section">
                                                <div class="em-box-02 step-title" data-toggle="collapse" data-target="#checkout-step-shipping">
                                                    <div class="title-box"> <span class="number">2</span>
                                                        <h2>Shipping Information</h2> 
                                                    </div>
                                                </div>
                                                <div id="checkout-step-shipping" class="step a-item collapse in">
                                                    <form id="co-shipping-form">
                                                        <ul class="form-list">
                                                            <li id="shipping-new-address-form">
                                                                <fieldset>
                                                                    <input type="hidden" name="shipping[address_id]" value="216" id="shipping:address_id" />
                                                                    <ul>
                                                                        <li class="fields">
                                                                            <div class="customer-name-middlename">
                                                                                <div class="field name-firstname">
                                                                                    <label for="recipient" class="required">Recipient Name</label>
                                                                                    <div class="input-box">
                                                                                        <input type="text" id="recipient_name" name="recipient_name" value="" title="Recipient" class="input-text" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </li>
                                                                        <li class="wide">
                                                                             <label for="shipping_address" class="required">Shipping Address</label>
                                                                             <div class="input-box">
                                                                                 <input type="text" title="Address 1" name="shipping_addr1" id="shipping_addr1" value="" class="input-text" readonly/>
                                                                             </div>
                                                                         </li>
                                                                         <li class="wide">
                                                                             <div class="input-box">
                                                                                 <input type="text" title="Address 2" name="shipping_addr2" id="shipping_addr2" value="" class="input-text" readonly/>
                                                                             </div>
                                                                         </li>
                                                                        <li class="fields">
                                                                            <div class="field">
                                                                                <label for="user_postcode" class="required">Postal Code</label>
                                                                                <div class="input-box">
                                                                                    <input type="text" title="Postal Code" name="recipient_postcode" id="recipient_postcode" value="" class="input-text" readonly/>
                                                                                </div>
                                                                            </div>
                                                                        </li>
                                                                        <li class="fields">
                                                                            <div class="field">
                                                                                <label for="user_phone" class="required">Phone</label>
                                                                                <div class="input-box">
                                                                                    <input type="text" name="recipient_phone" id="recipient_phone" value="" title="Phone" class="input-text" readonly/>
                                                                                </div>
                                                                            </div>
                                                                        </li>
                                                                        <li class="no-display">
                                                                            <input type="hidden" name="shipping[save_in_address_book]" value="1" />
                                                                        </li>
                                                                    </ul>
                                                                </fieldset>
                                                            </li>
                                                            <li class="control">
                                                                <input type="checkbox" name="shipping[same_as_billing]" id="shipping:same_as_billing" value="1" checked="checked" title="Use Billing Address" class="checkbox" />
                                                                <label for="shipping:same_as_billing">Use Billing Address</label>
                                                            </li>
                                                        </ul>
                                                        <div class="buttons-set" id="shipping-buttons-container">
                                                            <p class="required">* Required Fields</p>
                                                            <p class="back-link"><a href="#"><small>&laquo; </small>Back</a>
                                                            </p>
                                                            <button type="button" class="button" title="Continue"><span><span>Continue</span></span>
                                                            </button> <span id="shipping-please-wait" class="please-wait" style="display:none;"> <img src="images/opc-ajax-loader.gif" alt="Loading next step..." title="Loading next step..." class="v-middle" /> Loading next step... </span>
                                                        </div>
                                                    </form>
                                                </div><!-- /#checkout-step-shipping -->
                                            </li><!-- /#opc-shipping -->
                                            <li id="opc-shipping_method" class="section">
                                                <div class="em-box-02 step-title collapsed" data-toggle="collapse">
                                                    <div class="title-box"> <span class="number">3</span>
                                                        <h2>Shipping Method</h2> 
                                                    </div>
                                                </div>
                                                <div id="checkout-step-shipping_method" class="step a-item collapse in">
                                                    <form id="co-shipping-method-form">
                                                        <div id="checkout-shipping-method-load"></div>
                                                        <div id="onepage-checkout-shipping-method-additional-load">
                                                        </div>
                                                        <div class="buttons-set" id="shipping-method-buttons-container">
                                                            <p class="back-link"><a href="#"><small>&laquo; </small>Back</a>
                                                            </p>
                                                            <button type="button" class="button"><span><span>Continue</span></span>
                                                            </button> <span id="shipping-method-please-wait" class="please-wait" style="display:none;"> <img src="images/opc-ajax-loader.gif" alt="Loading next step..." title="Loading next step..." class="v-middle" /> Loading next step... </span>
                                                        </div>
                                                    </form>
                                                </div>
                                            </li><!-- /#opc-shipping_method -->
                                            
                                            <li id="opc-review" class="section">
                                                <div class="em-box-02 step-title collapsed" data-toggle="collapse">
                                                    <div class="title-box"> <span class="number">5</span>
                                                        <h2>Order Review</h2> 
                                                    </div>
                                                </div>
                                                <div id="checkout-step-review" class="step a-item collapse">
                                                    <div class="order-review" id="checkout-review-load"></div>
                                                </div>
                                            </li><!-- /#opc-review -->
                                        </ol>
                                    </div>
                                    <div class="col-sm-6 col-sm-pull-18 em-col-left em-sidebar">
                                        <div class="em-wrapper-area02"></div>
                                        <div id="checkout-progress-wrapper">
                                            <div class="block block-progress opc-block-progress em-line-01">
                                                <div class="em-block-title block-title"> <strong><span>Your Checkout Progress</span></strong>
                                                </div>
                                                <div class="block-content">
                                                    <dl>
                                                        <div id="billing-progress-opcheckout"><dt> Billing Address</dt>
                                                        </div>
                                                        <div id="shipping-progress-opcheckout"><dt> Shipping Address</dt>
                                                        </div>
                                                        <div id="shipping_method-progress-opcheckout"><dt> Shipping Method</dt>
                                                        </div>
                                                        <div id="payment-progress-opcheckout"><dt> Payment Method</dt>
                                                        </div>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                    </div><!-- /.em-sidebar -->
                                </div>
                            </div><!-- /.em-main-container -->
                        </div>
                    </div>
                </div><!-- /.em-wrapper-main -->

                

                <div class="em-wrapper-footer">
                    <div class="em-footer-style07">
                        <div class="em-footer-top">
                            <div class="container">
                                <div class="row">
                                    <div class="col-sm-24">
                                        <div class="em-footer-info">
                                            <div class="row">
                                                <div class="col-sm-24">
                                                    <div class=" four-block-middle">
                                                        <div class="row">
                                                            <div class="col-sm-6">
                                                                <div class="em-block-title" data-collapse-target="#collapse01">
                                                                    <p class="h4 em-text-upercase"><span>About Us</span>
                                                                    </p>
                                                                </div>
                                                                <div id="collapse01" class="em-block-content block-info">
                                                                    <p class="em-info">Skort Maison Martin Margiela knot ponytail cami texture as tucked t-shirt. <em>Black skirt razor pleats plaited gold collar</em>. Crop 90s spearmint indigo seam luxe washed out.</p>
                                                                    <p class="em-social"><a class="em-social-icon em-facebook f-left" title="em-sample-title" href="#"><span class="fa fa-fw"></span></a> <a class="em-social-icon em-twitter f-left" title="em-sample-title" href="#"><span class="fa fa-fw"></span></a> <a class="em-social-icon em-pinterest  f-left" title="em-sample-title" href="#"><span class="fa fa-fw"></span></a> <a class="em-social-icon em-google f-left" title="em-sample-title" href="#"><span class="fa fa-fw"></span></a> <a class="em-social-icon em-rss  f-left" title="em-sample-title" href="#"><span class="fa fa-fw"></span></a>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <div class="em-block-title" data-collapse-target="#collapse02">
                                                                    <p class="h4 em-text-upercase"><span>Newsletter</span>
                                                                    </p>
                                                                </div>
                                                                <div id="collapse02" class="em-block-content">
                                                                    <div class="em-newsletter-style04 newsletter-clearbutton">
                                                                        <div class="block block-subscribe">
                                                                            <form method="post" id="em-newsletter-validate-detail-style02">
                                                                                <div class="block-content">
                                                                                    <div class="form-subscribe-content">
                                                                                        <div class="input-box">
                                                                                            <input type="text" name="email" id="em-newsletter-style02" title="Sign up for our newsletter" class="input-text required-entry validate-email" placeholder="Sign up for your email ..." />
                                                                                        </div>
                                                                                        <div class="actions">
                                                                                            <button type="submit" title="Subscribe" class="button"><span><span>Subscribe</span></span>
                                                                                            </button>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </form>
                                                                        </div>
                                                                    </div>
                                                                </div><!-- /#collapse02 -->
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <div class="em-block-title" data-collapse-target="#collapse03">
                                                                    <p class="h4 em-text-upercase"><span>Useful Links</span>
                                                                    </p>
                                                                </div>
                                                                <div id="collapse03" class="em-block-content">
                                                                    <div class="row">
                                                                        <div class="col-sm-12">
                                                                            <ul class="em-links">
                                                                                <li class="em-links-item"><a title="em-sample-title" href="#"><span>Contact Us</span></a>
                                                                                </li>
                                                                                <li class="em-links-item"><a title="em-sample-title" href="#"><span>About Us</span></a>
                                                                                </li>
                                                                                <li class="em-links-item"><a title="em-sample-title" href="#"><span>Sitemap</span></a>
                                                                                </li>
                                                                                <li class="em-links-item"><a title="em-sample-title" href="#"><span>Term &amp; Conditions</span></a>
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="col-sm-12">
                                                                            <ul class="em-links">
                                                                                <li class="em-links-item"><a title="em-sample-title" href="#"><span>My Orders</span></a>
                                                                                </li>
                                                                                <li class="em-links-item"><a title="em-sample-title" href="#"><span>My Credit Slips</span></a>
                                                                                </li>
                                                                                <li class="em-links-item"><a title="em-sample-title" href="#"><span>My Addresses</span></a>
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </div><!-- /#collapse03 -->
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <div class="em-block-title" data-collapse-target="#collapse04">
                                                                    <p class="h4 em-text-upercase"><span>Tags</span>
                                                                    </p>
                                                                </div>
                                                                <div id="collapse04" class="em-block-content">
                                                                    <ul class="em-tags-list">
                                                                        <li class="em-tags-item"><a title="em-sample-title" href="#"><span>awesome</span></a>
                                                                        </li>
                                                                        <li class="em-tags-item"><a title="em-sample-title" href="#"><span>nice</span></a>
                                                                        </li>
                                                                        <li class="em-tags-item"><a title="em-sample-title" href="#"><span>beautiful</span></a>
                                                                        </li>
                                                                        <li class="em-tags-item"><a title="em-sample-title" href="#"><span>love</span></a>
                                                                        </li>
                                                                        <li class="em-tags-item"><a title="em-sample-title" href="#"><span>like</span></a>
                                                                        </li>
                                                                        <li class="em-tags-item"><a title="em-sample-title" href="#"><span>emthemes</span></a>
                                                                        </li>
                                                                    </ul>
                                                                </div><!-- /#collapse04 -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><!-- /.em-footer-top -->
                        <div class="em-footer-bottom">
                            <div class="container">
                                <div class="row">
                                    <div class="col-sm-24">
                                        <div class="em-footer-address"> <address class="f-left">&copy; 2015 EM0131 Everything Demo Store. All Rights Reserved.<span>HTML Templates by <a href="http://www.emthemes.com/responsive-magento-themes.html" title="Responsive HTML Themes &amp; Responsive HTML Templates">htmlcooker.com</a></span></address>
                                        </div>
                                        <div class="em-payment-method f-right">
                                            <div class="em-payment f-right"><a class="em-payment-icon em-visa" title="em-sample-title" href="#">visa</a> <a class="em-payment-icon em-master" title="em-sample-title" href="#">master</a> <a class="em-payment-icon em-express " title="em-sample-title" href="#">express</a><a class="em-payment-icon em-paypal" title="em-sample-title" href="#">paypal</a> <a class="em-payment-icon em-other " title="em-sample-title" href="#">other</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-24">
                                        <ul class="links">
                                            <li class="first"><a href="#" title="Site Map">Site Map</a>
                                            </li>
                                            <li><a href="#" title="Search Terms">Search Terms</a>
                                            </li>
                                            <li><a href="#" title="Advanced Search">Advanced Search</a>
                                            </li>
                                            <li><a href="#" title="Orders and Returns">Orders and Returns</a>
                                            </li>
                                            <li class=" last"><a href="#" title="Contact Us">Contact Us</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div><!-- /.em-footer-bottom -->
                    </div>
                </div><!-- /.em-wrapper-footer -->
                
                <p id="back-top" style="display: none;"><a title="Top" href="#top">Top</a></p>

            </div><!-- /.page -->
            
        </div><!-- /.wrapper -->


        <script type="text/javascript">
	        $(document).ready(function(){
	        	$("#use_for_shipping_yes").change(function(){
	                if ( $("#use_for_shipping_yes").is(":checked") )
	                {
	                	var user_realname = $("#user_realname").val();
	                	alert(user_realname);
	                }
	            });
	        });
	        
            function qtyDown(id) {
                var qty_el = document.getElementById('cart[' + id + '][qty]');
                var qty = qty_el.value;
                if (!isNaN(qty) && qty > 1) {
                    qty_el.value--;
                }
                return false;
            }

            function qtyUp(id) {
                var qty_el = document.getElementById('cart[' + id + '][qty]');
                var qty = qty_el.value;
                if (!isNaN(qty)) {
                    qty_el.value++;
                }
                return false;
            }
        </script>

    </body>
</html>