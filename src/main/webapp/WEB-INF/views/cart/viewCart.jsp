<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        
	<body class=" checkout-cart-index ">
    	
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
                                        <li class="home"> <a href="/" title="Go to Home Page"><span >Home</span></a> <span class="separator">/ </span>
                                        </li>
                                        <li class="cms_page"> <strong>Shopping Cart</strong>
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
                            <div class="em-main-container em-col1-layout">
                                <div class="row">
                                    <div class="em-col-main col-sm-24">
                                        <div class="cart">
                                            <div class="page-title title-buttons">
                                                <h1>Shopping Cart</h1>
                                                <ul class="checkout-types">
                                                    <li>
                                                        <button type="button" title="Proceed to Checkout" class="button btn-proceed-checkout btn-checkout"><span><span>Proceed to Checkout</span></span>
                                                        </button>
                                                    </li>
                                                </ul>
                                            </div><!-- /.page-title -->
                                            <form action="/checkout/checkout.do" method="post">
                                           		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                <input type="hidden" id="cartCount" name="cartCount" value="${cartCount}" />
                                                <fieldset>
                                                    <table id="shopping-cart-table" class="data-table cart-table">
                                                        <thead>
                                                            <tr class="em-block-title">
                                                                <th><span class="nobr"></span>
                                                                </th>
                                                                <th class="a-center">Product Name</th>
                                                                <th class="a-center">Category</th>
                                                                <th class="a-center"><span class="nobr">Move to Wishlist</span>
                                                                </th>
                                                                <th class="a-center" colspan="1"><span class="nobr">Unit Price</span>
                                                                </th>
                                                                <th class="a-center">Qty</th>
                                                                <th class="a-center last" colspan="1">Subtotal</th>
                                                            </tr>
                                                        </thead>
                                                        <tfoot>
                                                            <tr>
                                                                <td colspan="7" class="a-right">
                                                                    <button type="button" title="Continue Shopping" class="button btn-continue" onclick="location.href='/index.do'"><span><span>Continue Shopping</span></span>
                                                                    </button>
                                                                    <button type="button" name="update_cart_action" id="update_cart_action" title="Update Shopping Cart" class="button btn-update" onclick="updateCart()"><span><span>Update Shopping Cart</span></span>
                                                                    </button>
                                                                    <button type="button" name="empty_cart_action" id="empty_cart_action" title="Clear Shopping Cart" class="button btn-empty" onclick="removeAllCart()"><span><span>Clear Shopping Cart</span></span>
                                                                    </button>
                                                                </td>
                                                            </tr>
                                                        </tfoot>
                                                        <tbody>
                                                       		<c:if test="${!empty userCartInfoList}">
	                                                       		<c:forEach var="userCartInfo" items="${userCartInfoList}" varStatus="status">
		                                                            <tr class="last even">
		                                                                <td>
		                                                                    <div class="cart-product"><span style="cursor:pointer;" title="Remove item" class="btn-remove btn-remove2" onclick="removeCart(${userCartInfo.cartno})">Remove item</span>
		                                                                        <a title="${userCartInfo.productname}" class="product-image"><img src="/displayFile?fileName=${userCartInfo.mainpictureurl}" width="100" alt="${userCartInfo.productname }" />
		                                                                        </a>
		                                                                    </div>
		                                                                    <input type="hidden" class="cartno" value="${userCartInfo.cartno}" />
		                                                                </td>
		                                                                <td>
		                                                                    <h2 class="product-name"> <a href="/product/productDetail.do?productid=${userCartInfo.productid}">${userCartInfo.productname }</a></h2>
		                                                                    <p class="sku">Brand : ${userCartInfo.brand} / Color : ${userCartInfo.color} / Size: ${userCartInfo.size}</p>
		                                                                </td>
		                                                                <td class="a-center"> <a href="/product/productList.do?subcategory=${userCartInfo.subcategory}" title="Edit item parameters">${userCartInfo.subcategory}</a>
		                                                                </td>
		                                                                <td class="a-center"> <a href="#" class="link-wishlist use-ajax" title="Move">Move</a>
		                                                                </td>
		                                                                <td class="a-center"> <span class="cart-price"> <span class="price"><fmt:formatNumber value="${userCartInfo.saleprice}" type="currency" currencySymbol="￦"/></span> </span>
		                                                                </td>
		                                                                <td class="a-center">
		                                                                    <div class="qty_cart">
		                                                                        <div class="qty-ctl">
		                                                                            <button title="Decrease Qty" onclick="qtyDown(${status.index}); return false;" class="decrease">decrease</button>
		                                                                        </div>
		                                                                        <input id="cart[${status.index}][qty]" name="cart[${status.index}][qty]" value="${userCartInfo.count}" size="4" title="Qty" class="input-text qty" maxlength="12" readonly/>
		                                                                        <div class="qty-ctl">
		                                                                            <button title="Increase Qty" onclick="qtyUp(${status.index}); return false;" class="increase">increase</button>
		                                                                        </div>
		                                                                    </div>
		                                                                </td>
		                                                                <td class="a-center last"> <span class="cart-price"> <span class="price"><fmt:formatNumber value="${userCartInfo.saleprice * userCartInfo.count}" type="currency" currencySymbol="￦"/></span> </span>
		                                                                </td>
		                                                            </tr>
		                                                    	</c:forEach>
	                                                    	</c:if>
	                                                    	<c:if test="${empty userCartInfoList}">
	                                                    		<tr class="last even">
	                                                                <td colspan="7" class="a-center last">
	                                                                	장바구니에 담겨있는 상품이 없습니다.
	                                                                </td>
	                                                            </tr>
	                                                    	</c:if>
                                                        </tbody>
                                                    </table>
                                                </fieldset>
                                                <div class="cart-collaterals row">
                                                <div class="first col-md-16 col-sm-24">
                                                    
                                                </div><!-- /first -->
                                                <div class="last totals col-md-8 col-sm-24">
                                                    <div class="em-box-cart">
                                                        <h2>Order Total(3만원 이상 무료배송)</h2>
                                                        <div class="em-box">
                                                            <table id="shopping-cart-totals-table">
                                                                <col />
                                                                <col style="width: 1%;" />
                                                                <tfoot>
                                                                    <tr>
                                                                        <td style="" class="a-right" colspan="1"> <strong>Grand Total</strong>
                                                                        </td>
                                                                        <td style="" class="a-right"> <strong><span class="price" id="totalPrice"><fmt:formatNumber value="${ totalPrice < 30000 ? totalPrice + 2500 : totalPrice }" type="currency" currencySymbol="￦"/></span></strong>
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
                                                                        	<span class="price"><fmt:formatNumber value="${ totalPrice < 30000 ? 2500 : 0 }" type="currency" currencySymbol="￦"/></span>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                            <ul class="checkout-types">
                                                                <li>
                                                                    <button type="submit" title="Proceed to Checkout" class="button btn-proceed-checkout btn-checkout"><span><span>Proceed to Checkout</span></span>
                                                                    </button>
                                                                </li>
                                                                <li><a href="checkout.html" title="Checkout with Multiple Addresses">Checkout with Multiple Addresses</a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div><!-- /.em-box-cart -->
                                                </div><!-- /.last -->
                                            </div><!-- /.cart-collaterals -->
                                            </form><!-- /form -->
                                            
                                            <div class="block block-sample em-line-01">
                                                <div class="em-block-title">
                                                    <h2><span>This is sample static block replacing crosssel products</span></h2>
                                                </div>
                                                <div class="block-content box">
                                                    <p>This is sample static block replacing crosssel products. Put your own content here: filter widget,text, html, images - whatever you want.</p>
                                                </div>
                                            </div><!-- /.block -->
                                        </div>
                                    </div>
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
	var header = $("meta[name='_csrf_header']").attr("content");
	var token  = $("meta[name='_csrf']").attr("content");
	
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
        if (!isNaN(qty) && qty < 10) {
            qty_el.value++;
        }
        return false;
    }
    
    function updateCart() {
    	var cartCount = $("#cartCount").val();
    	console.log(cartCount);
    	
    	for ( var i = 0; i < cartCount; i++ )
    	{
    		var count  = document.getElementsByClassName("input-text qty")[i].value;
        	var cartno = document.getElementsByClassName("cartno")[i].value;
        	
        	console.log(count);
        	console.log(cartno);
        	
        	$.ajax({
        		url: "/cart/updateCart.do",
        		data: JSON.stringify({cartno: cartno, count: count}),
        		dataType: 'text',
        		type: 'POST',    
        		headers : {
        			"Content-Type": "application/json; charset=utf-8",
        			"X-HTTP-Method-Override": "PUT"
        		},
        		beforeSend: function(xhr){
        			xhr.setRequestHeader(header, token);
        	    },
        		success: function(data) {
        			var result = JSON.parse(data);
        			console.log(result);
        		},
        		error: function(request, status, error) {
        		    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        	    }
        	});
    	}
    	
    	window.setTimeout(function(){document.location.reload(true)}, 1000);
    }
    
    function removeCart(cartno) {
		if ( confirm("선택한 상품을 삭제하시겠습니까?") == true )
		{
	    	$.ajax({
	    		url: "/cart/deleteCart.do",
	    		data: JSON.stringify({"cartno" : cartno}),
	    		dataType: 'text',
	    		type: 'POST',    
	    		headers : {
	    			"Content-Type": "application/json; charset=utf-8",
	    			"X-HTTP-Method-Override": "DELETE"
	    		},
	    		beforeSend: function(xhr){
	    			xhr.setRequestHeader(header, token);
	    	    },
	    		success: function(data) {
	    			console.log(data);
	    			//var result = JSON.parse(data);
	    			//console.log(result);
	    		},
	    		error: function(request, status, error) {
	    		    alert("code:" + request.status + "\n" + "message:" + request.responseText+"\n" + "error:" + error);
	    	    }
	    	});
	    	
	    	window.setTimeout(function(){document.location.reload(true)}, 1000);
		}
		else
		{
			return;
		}
    }
    
    function removeAllCart() {
    	if ( confirm("장바구니에 있는 상품을 모두 삭제하시겠습니까?") == true )
		{
    		$.ajax({
	    		url: "/cart/deleteAllCart.do",
	    		type: 'POST',    
	    		beforeSend: function(xhr){
	    			xhr.setRequestHeader(header, token);
	    	    },
	    		success: function(data) {
	    			console.log(data);
	    			//var result = JSON.parse(data);
	    			//console.log(result);
	    		},
	    		error: function(request, status, error) {
	    		    alert("code:" + request.status + "\n" + "message:" + request.responseText+"\n" + "error:" + error);
	    	    }
	    	});
	    	
	    	window.setTimeout(function(){document.location.reload(true)}, 1000);
    		
		}
    	else
    	{
    		return;
    	}
    }
</script>

    </body>
</html>