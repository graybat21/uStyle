<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                                        <li class="cms_page"> <strong>Purchase List</strong>
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
                                                <h1>Purchase List</h1>
                                            </div><!-- /.page-title -->
                                                <fieldset>
                                                    <table id="shopping-cart-table" class="data-table cart-table">
                                                        <thead>
                                                            <tr class="em-block-title">
                                                                <th><span class="nobr"></span>
                                                                </th>
                                                                <th class="a-center">Purchase Information</th>
                                                                <th class="a-center" colspan="1"><span class="nobr">Unit Price</span>
                                                                </th>
                                                                <th class="a-center">Qty</th>
                                                                <th class="a-center" colspan="1">Subtotal</th>
                                                                <th class="a-center last">Purchase Date</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                       		<c:if test="${!empty userPurchaseList}">
	                                                       		<c:forEach var="userPurchase" items="${userPurchaseList}" varStatus="status">
		                                                            <tr class="last even">
		                                                                <td>
		                                                                    <div class="cart-product">
		                                                                        <a title="${userPurchase.productname}" class="product-image"><img src="/displayFile?fileName=${userPurchase.mainpictureurl}" alt="${userPurchase.productname }" />
		                                                                        </a>
		                                                                    </div>
		                                                                </td>
		                                                                <td>
		                                                                    <h2 class="product-name"> <a href="/product/productDetail.do?productid=${userPurchase.productid}">${userPurchase.productname }</a></h2>
		                                                                    <p class="sku">Brand : ${userPurchase.brand} / Color : ${userPurchase.color} / Size: ${userPurchase.size}</p>
		                                                                    <p class="sku">Recipientname : ${userPurchase.recipientname}</p>
		                                                                    <p class="sku">Address : (${userPurchase.shippingpostcode}) ${userPurchase.shippingaddr1} ${userPurchase.shippingaddr2}</p>
		                                                                    <p class="sku">Recipientphone : ${userPurchase.recipientphone}</p>
		                                                                </td>
		                                                                <td class="a-center"> <span class="cart-price"> <span class="price"><fmt:formatNumber value="${userPurchase.saleprice}" type="currency" currencySymbol="￦"/></span> </span>
		                                                                </td>
		                                                                <td class="a-center">
		                                                                    <div class="qty_cart">
	                                                                        	<span class="price">${userPurchase.count}</span>
		                                                                    </div>
		                                                                </td>
		                                                                <td class="a-center"> <span class="cart-price"> <span class="price"><fmt:formatNumber value="${userPurchase.saleprice * userPurchase.count}" type="currency" currencySymbol="￦"/></span> </span>
		                                                                </td>
		                                                                <td class="a-center last">
		                                                                	<div class="qty_cart">
		                                                                		<span class="price"><fmt:formatDate value="${userPurchase.purchasedate}" pattern="yyyy-MM-dd" /></span>
	                                                                		</div>
		                                                                </td>
		                                                            </tr>
		                                                    	</c:forEach>
	                                                    	</c:if>
	                                                    	<c:if test="${empty userPurchaseList}">
	                                                    		<tr class="last even">
	                                                                <td colspan="7" class="a-center last">
	                                                                	최근 1년간 구매한 상품이 없습니다.
	                                                                </td>
	                                                            </tr>
	                                                    	</c:if>
                                                        </tbody>
                                                    </table>
                                                </fieldset>
                                                
                                                <div class="toolbar-bottom em-box-03">
                                                <div class="toolbar">
                                                    <div class="pager">
                                                        <p class="amount"> Items ${first} to ${last} of ${purchaseCount} total</p>
                                                        <div class="pages">
                                                            <ol>
                                                            	<c:if test="${pageMaker.prev }">
																    <c:url var="purchaseListP" value="purchaseList.do">
																        <c:param name="pageCount" value="${pageMaker.start - 1}" />
																    </c:url>
                                                            		<li><a class="fa fa-angle-left" href="${purchaseListP }" title="Prev"> </a></li>
                                                            	</c:if>
                                                            	
                                                            	<c:forEach begin="${pageMaker.start }" end="${pageMaker.end}" var="idx">
																    <c:url var="purchaseListP" value="purchaseList.do">
																        <c:param name="pageCount" value="${idx}" />
																    </c:url>
																    <li>
																        <a class='<c:out value="${idx == pageMaker.page ? 'current' : ''}"/>' href='${purchaseListP }'>${idx}</a>
																    </li>    
																</c:forEach>
																
																<c:if test="${pageMaker.next }">
																    <c:url var="purchaseList" value="purchaseList.do">
																        <c:param name="pageCount" value="${pageMaker.end + 1}" />
																        <c:param name="countPerPage" value="10" />
																    </c:url>
																    <li><a class="fa fa-angle-right" href="${purchaseList }" title="Next"></a></li>
																</c:if>
                                                            	
                                                            </ol>
                                                            
                                                        </div>
                                                    </div><!-- /.pager -->
                                                </div>
                                            </div><!-- /.toolbar-bottom -->
                                        </div>
                                    </div>
                                </div>
                            </div><!-- /.em-main-container -->
                        </div>
                    </div>
                </div><!-- /.em-wrapper-main -->

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
