<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/commonCheckout.js"></script>
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
                    <form action="/checkout/checkoutSuccess.do" id="co-shipping-form" method="post" onsubmit="return verifyOK()">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <input type="hidden" id="maxpoint" name="maxpoint" value="${point}" />
                    <input type="hidden" id="usedpoint" name="usedpoint" value="0" />
                    <input type="hidden" id="totalprice" name="totalprice" value="${totalPrice}" />
                    <input type="hidden" id="shippingprice" name="shippingprice" value="${shippingPrice}" />
                    <input type="hidden" id="finalprice" name="finalprice" value="${finalPrice}" />
                    <input type="hidden" id="checkoutprice" name="checkoutprice" value="${finalPrice}" />
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
                                        <div id="checkout-step-payment" class="step a-item collapse in">
                                        	<table id="checkout-table" class="data-table cart-table">
                                                <thead>
                                                    <tr class="em-block-title">
                                                        <th class="a-center">Product Name</th>
                                                        <th class="a-center">Brand</th>
                                                        <th class="a-center">Color</th>
                                                        <th class="a-center">Size</th>
                                                        <th class="a-center" colspan="1"><span class="nobr">Unit Price</span></th>
                                                        <th class="a-center">Qty</th>
                                                        <th class="a-center last" colspan="1">Subtotal</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                	<c:forEach var="userSelectedItemid" items="${userSelectedItemidList}" varStatus="status">
                                                		<tr class="last even">
                          						<td><p class="a-center">${userSelectedItemid.productname}</p></td>
                          						<td><p class="a-center">${userSelectedItemid.brand}</p></td>
                          						<td><p class="a-center">${userSelectedItemid.color}</p></td>
                          						<td><p class="a-center">${userSelectedItemid.size}</p></td>
                                                         <td><p class="a-center"><span class="price"><fmt:formatNumber value="${userSelectedItemid.saleprice}" type="currency" currencySymbol="￦"/></span></td>
                                                         <td><p class="a-center">${userSelectedItemid.totalcount}</p></td>
                                                         <td><p class="a-center last"><span class="price"><fmt:formatNumber value="${userSelectedItemid.saleprice * userSelectedItemid.totalcount}" type="currency" currencySymbol="￦"/></span></p></td>
                                                     </tr>
                                                	</c:forEach>
                                                </tbody>
                                        	</table>
                                        	<div class="cart-collaterals row">
                                        		<div class="first totals col-md-12 col-sm-24">
                                        			<div class="em-box">
                                        				<table id="shopping-cart-totals-table">
                                        					<col />
                                                         <col style="width: 1%;" />
                                        					<tbody>
                                                             <tr>
                                                                 <td style="" class="a-right" colspan="1"> Point</td>
                                                                 <td style="" class="a-right"> <span class="price">${point}</span>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                             	<td style="" class="a-right" colspan="1"><input type="text" dir="rtl" id="pointrange" name="pointrange" value="0" title="Point" class="input-text" size="5"/>&nbsp;Point 사용
                                                             	</td>
                                                             	<td style="" class="a-right"><button type="button" name="update_point" id="update_point" class="button" onclick="updatePoint()"><span>적용</span></button></td>
                                                            	</tr>
                                                         </tbody>
                                        				</table>
                                        				<div class="input-box field">
                                        					
                                        				</div>
                                        			</div>
                                        		</div>
                                        		<div class="last totals col-md-12 col-sm-24">
                                        			<div class="em-box">
                                                     <table id="shopping-cart-totals-table">
                                                         <col />
                                                         <col style="width: 1%;" />
                                                         <tfoot>
                                                             <tr>
                                                                 <td style="" class="a-right" colspan="1"> <strong>Grand Total</strong>
                                                                 </td>
                                                                 <td style="" class="a-right"> <strong><span class="price" id="finalPrice_span"><fmt:formatNumber value="${finalPrice}" type="currency" currencySymbol="￦"/></span></strong>
                                                                 </td>
                                                             </tr>
                                                         </tfoot>
                                                         <tbody>
                                                             <tr>
                                                                 <td style="" class="a-right" colspan="1"> Subtotal</td>
                                                                 <td style="" class="a-right"> <span class="price"><fmt:formatNumber value="${totalPrice}" type="currency" currencySymbol="￦"/></span>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td style="" class="a-right" colspan="1"> Delivery Fee</td>
                                                                 <td style="" class="a-right"> 
                                                                 	<span class="price"><fmt:formatNumber value="${shippingPrice}" type="currency" currencySymbol="￦"/></span>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td style="" class="a-right" colspan="1"> <strong>Total</strong>
                                                                 </td>
                                                                 <td style="" class="a-right"> <strong><span class="price" id="totalPrice_span"><fmt:formatNumber value="${finalPrice}" type="currency" currencySymbol="￦"/></span></strong>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td style="" class="a-right" colspan="1"> Use Point</td>
                                                                 <td style="" class="a-right"> 
                                                                 	<span class="price" id="usepoint"></span>
                                                                 </td>
                                                             </tr>
                                                         </tbody>
                                                     </table>
                                                	</div>
                                        		</div>
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
                                         <fieldset>
                                             <ul class="form-list">
                                                 <li id="billing-new-address-form">
                                                     <fieldset>
                                                         <input type="hidden" name="billing[address_id]" value="215" id="billing:address_id" />
                                                         <ul>
                                                             <li class="fields">
                                                                 <div class="customer-name-middlename">
                                                                     <div class="field name-firstname">
                                                                         <label for="userrealname" class="required">Name</label>
                                                                         <div class="input-box">
                                                                             <input type="text" id="userrealname" name="userrealname" value="${session_user['realname']}" title="Name" class="input-text" readonly/>
                                                                         </div>
                                                                     </div>
                                                                 </div>
                                                             </li>
                                                             <li class="wide">
                                                                 <label for="user_address" class="required">Address</label>
                                                                 <div class="input-box">
                                                                     <input type="text" title="Address 1" name="useraddr1" id="useraddr1" value="${session_user['addr1']}" class="input-text" readonly/>
                                                                 </div>
                                                             </li>
                                                             <li class="wide">
                                                                 <div class="input-box">
                                                                     <input type="text" title="Address 2" name="useraddr2" id="useraddr2" value="${session_user['addr2']}" class="input-text" readonly/>
                                                                 </div>
                                                             </li>
                                                             <li class="fields">
                                                                 <div class="field">
                                                                     <label for="userpostcode" class="required">Postcode</label>
                                                                     <div class="input-box">
                                                                         <input type="text" title="Postcode" name="userpostcode" id="userpostcode" value="${session_user['postcode']}" class="input-text" readonly/>
                                                                     </div>
                                                                 </div>
                                                             </li>
                                                             <li class="fields">
                                                                 <div class="field">
                                                                     <label for="userphone" class="required">Phone</label>
                                                                     <div class="input-box">
                                                                         <input type="text" name="userphone" id="userphone" value="${session_user['phone']}" title="Phone" class="input-text" readonly/>
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
                                             </ul>
                                         </fieldset>
                                        </div><!-- /#checkout-step-billing -->
                                    </li><!-- /#opc-billing -->
                                    <li id="opc-shipping" class="section">
                                        <div class="em-box-02 step-title" data-toggle="collapse">
                                            <div class="title-box"> <span class="number">2</span>
                                                <h2>Shipping Information</h2> 
                                            </div>
                                        </div>
                                        <div id="checkout-step-shipping" class="step a-item collapse in">
                                         <ul class="form-list">
                                             <li id="shipping-new-address-form">
                                                 <fieldset>
                                                     <input type="hidden" name="shipping[address_id]" value="216" id="shipping:address_id" />
                                                     <ul>
                                                         <li class="fields">
                                                             <div class="customer-name-middlename">
                                                                 <div class="field name-firstname">
                                                                     <label for="recipient" class="required"><em>*</em>Recipient Name</label>
                                                                     <div class="input-box">
                                                                         <input type="text" id="recipientname" name="recipientname" value="" title="Recipient" class="input-text" />
                                                                     </div>
                                                                 </div>
                                                             </div>
                                                         </li>
                                                         <li class="fields">
                                                             <div class="field">
                                                                 <label for="userpostcode" class="required"><em>*</em>Postcode</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                 <input type="button" onclick="execDaumPostcode()" value="Find Postcode" class="button">
                                                                 <div class="input-box">
                                                                     <input type="text" title="Postcode" name="shippingpostcode" id="shippingpostcode" onclick="execDaumPostcode()" value="" class="input-text" />
                                                                 </div>
                                                             </div>
                                                         </li>
                                                         <li class="wide">
                                                              <label for="shipping_address" class="required"><em>*</em>Shipping Address</label>
                                                              <div class="input-box">
                                                                  <input type="text" title="Address 1" name="shippingaddr1" id="shippingaddr1" onclick="execDaumPostcode()" value="" class="input-text" />
                                                              </div>
                                                          </li>
                                                          <li class="wide">
                                                              <div class="input-box">
                                                                  <input type="text" title="Address 2" name="shippingaddr2" id="shippingaddr2" onclick="execDaumPostcode()" value="" class="input-text" />
                                                              </div>
                                                          </li>
                                                         <li class="fields">
                                                             <div class="field">
                                                                 <label for="userphone" class="required"><em>*</em>Phone</label>
                                                                 <div class="input-box">
                                                                     <input type="text" name="recipientphone" id="recipientphone" value="" title="Phone" class="input-text" maxlength="13" onkeyup="pressKey()"/>
                                                                 </div>
                                                             </div>
                                                         </li>
                                                         <li class="no-display">
                                                             <input type="hidden" name="shipping[save_in_address_book]" value="1" />
                                                         </li>
                                                     </ul>
                                                 </fieldset>
                                             </li>
                                         </ul>
                                         <div class="buttons-set" id="shipping-buttons-container">
                                             <p class="required">* Required Fields</p>
                                             <p class="back-link"><a href="#"><small>&laquo; </small>Back</a>
                                             </p>
                                             <button type="submit" class="button" title="Checkout"><span><span>Checkout</span></span>
                                             </button> <span id="shipping-please-wait" class="please-wait" style="display:none;"> <img src="images/opc-ajax-loader.gif" alt="Loading next step..." title="Loading next step..." class="v-middle" /> Loading next step... </span>
                                         </div>
                                        </div><!-- /#checkout-step-shipping -->
                                    </li><!-- /#opc-shipping -->
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
                    </form>
                </div>
            </div>
        </div><!-- /.em-wrapper-main -->
        <p id="back-top" style="display: none;"><a title="Top" href="#top">Top</a></p>
    </div><!-- /.page -->
</div><!-- /.wrapper -->


<script type="text/javascript">
$(document).ready(function() {
	$("#use_for_shipping_yes").change(function() {
        if ( $("#use_for_shipping_yes").is(":checked") ) {
        	$('#recipientname').val($("#userrealname").val());
        	$('#shippingaddr1').val($("#useraddr1").val());
        	$('#shippingaddr2').val($("#useraddr2").val());
        	$('#shippingpostcode').val($("#userpostcode").val());
        	$('#recipientphone').val($("#userphone").val());
        }
    });
});
 
function updatePoint() {
 	var maxPoint = $('#maxpoint').val();
 	var usePoint = $('#pointrange').val();
 	var finalPrice = $('#finalprice').val();
 	console.log(maxPoint);
 	console.log(usePoint);
 	
 	if ( parseInt(maxPoint) < parseInt(usePoint) )
		{
 		alert('입력하신 포인트가 가지고 있는 포인트보다 많습니다. 다시 확인 후 입력해주세요.');
 		return;
		}
 	else if ( parseInt(usePoint) > parseInt(finalPrice) )
		{
 		alert('입력하신 포인트가 결제금액보다 많습니다. 다시 확인 후 입력해주세요.');
 		return;
		}
 	
 	$('#usedpoint').val(usePoint);
 	document.getElementById("usepoint").innerHTML = usePoint;
 	
 	finalPrice -= parseInt(usePoint);
 	console.log(finalPrice);
 	$('#checkoutprice').val(finalPrice);
	document.getElementById("finalPrice_span").innerHTML = "￦" + set_comma(finalPrice);
}
 
function verifyOK()
{
 	if ( $('#recipientname').val() == '' || $('#shippingaddr1').val() == '' || $('#shippingaddr2').val() == '' || 
 			$('#shippingpostcode').val() == '' || $('#recipientphone').val() == '' ) 
 	{
 		alert("배송 정보를 올바르게 입력하세요.");
 		return false;
 	}
 	else
 		return true;
}
 
function set_comma(n) { 
 	var reg = /(^[+-]?\d+)(\d{3})/; 
 	
 	n += ''; 
 	
 	while (reg.test(n)) 
 		n = n.replace(reg, '$1' + ',' + '$2'); 
 	
 	return n; 
}
 
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
