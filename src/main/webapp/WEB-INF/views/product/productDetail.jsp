<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<body class="contacts-index-index ">
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
                                        <li class="home"> <a href="/" title="Home"><span>Home</span></a> <span class="separator">/ </span>
                                        </li>
                                        <li class="product"><span>${product.category}</span><span class="separator">/ </span></li>
                                        <li class="product"> <strong>${product.subcategory}</strong>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- /.wrapper-breadcrums -->
                <div class="em-wrapper-main">
                    <div class="container-fluid container-main">
                        <div class="em-inner-main">
                            <div class="em-wrapper-area02"></div>
                            <div class="em-wrapper-area03"></div>
                            <div class="em-wrapper-area04"></div>
                            <div class="em-main-container em-col1-layout">
                                <div class="row">
                                    <div class="em-col-main col-sm-22 col-sm-offset-1">
                                        <div id="messages_product_view"></div>
                                        <div class="product-view">
                                            <div class="product-essential">
                                                <form action="/cart/addCart.do" method="post" id="product_addtocart_form" name="product_addtocart_form">
                                                   	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                    <input type="hidden" id="selectedItemColor" name="color" value="" />
                                                    <input type="hidden" id="selectedItemSize" name="size" value="" />
                                                    <input type="hidden" id="productid" name="productid" value="${product.productid}" />
                                                    <input type="hidden" id="itemid" name="itemid" value="" />
                                                    <input type="hidden" id="count" name="count" value="1" />
                                                    
                                                    <div class="product-view-detail">
                                                        <div class="em-product-view row">
                                                            <div class="em-product-view-primary em-product-img-box col-sm-16 first">
                                                                <div id="em-product-shop-pos-top"></div>
                                                                <div class="product-img-box">
                                                                    <div class="media-left">
                                                                        <p class="product-image">
                                                                            <img class="em-product-main-img" src="/displayFile?fileName=${product.mainpictureurl}" alt='' title="${product.productname}" /> 
                                                                        </p>
                                                                    </div><!-- /.media-left -->
                                                                    <div class="more-views">
	                                                                    <ul class="em-moreviews-slider">
	                                                                   		<c:forEach var="picture" items="${pictureList}" varStatus="status">
	                                                                            <li class="item">
	                                                                                <a class="cloud-zoom-gallery" rel="useZoom:'image_zoom', smallImage:'http://placehold.it/800x800', adjustX:5, adjustY:-5, position:'inside'" onclick="return false" href="http://placehold.it/1000x1000"> <img src="/displayFile?fileName=${picture}" alt="" /> </a> <a class="no-display" href="http://placehold.it/1000x1000" rel="lightbox[em_lightbox]">lightbox moreview</a>
	                                                                            </li>
	                                                                        </c:forEach>
                                                                        </ul>
                                                                    </div><!-- /.more-views -->
                                                                </div>
                                                            </div><!-- /.em-product-view-primary -->
                                                            <div class="em-product-view-secondary em-product-shop col-sm-8">
                                                                <div class="product-shop  em-has-options fix_menu">
                                                                    <div id="em-product-info-basic">
                                                                        <div class="product-name">
                                                                            <h1>${product.productname}</h1>
                                                                        </div>
                                                                        <div class="em-review-email">
                                                                            <p class="no-rating"><a href="#" class="r-lnk link_review_form">Be the first to review this product</a>
                                                                            </p>
                                                                        </div>
                                                                        <div class="em-sku-availability">
                                                                            <p class="sku">SKU: ${product.productid}</p>
                                                                            <p class="availability in-stock"> Availability: 
	                                                                            <c:if test="${totalItemNum > 0}">
	                                                                            	<span class="value">In stock</span>
	                                                                            </c:if>
	                                                                            <c:if test="${totalItemNum == 0}">
	                                                                            	<span class="value">Out of stock</span>
	                                                                            </c:if>
                                                                            </p>
                                                                        </div>
                                                                        <div class="short-description">
                                                                            <h2>Quick Overview</h2>
                                                                            <div class="std">${product.description}</div>
                                                                            <div class="std">가격은 색상 혹은 사이즈에 따라 다를 수 있습니다.</div>
                                                                        </div>
                                                                        <div>
                                                                            <p class="availability in-stock">Availability: <span>In stock</span>
                                                                            </p>
                                                                            <div id="price-box-wrapper" class="price-box"> 
	                                                                            <c:if test="${ product.originalprice > product.saleprice }">
	                                                                            	<span id="price-original" class="price"><del><fmt:formatNumber value="${product.originalprice}" type="currency" currencySymbol="￦"/></del></span>
	                                                                            </c:if>
                                                                            	<span id="price-sale" class="price"><fmt:formatNumber value="${product.saleprice}" type="currency" currencySymbol="￦"/></span>
                                                                            </div>
                                                                        </div>
                                                                    </div><!-- /.em-product-info-basic -->
                                                                    <c:if test="${totalItemNum > 0}">
                                                                    <div id="product-options-wrapper" class="product-options" style="overflow-y: hidden;">
                                                                        <dl class="last"><dt class="swatch-attr"> <label class="required" id="color_label"> <em>*</em>Color: <span class="select-label" id="select_label_color">Please Select Color</span> </label></dt>
                                                                            <dd class="clearfix swatch-attr">
                                                                                <div class="input-box">
                                                                                    <ul class="configurable-swatch-list clearfix" id="configurable_swatch_color">
	                                                                                    <c:forEach var="itemColor" items="${itemColorList}">
	                                                                                        <li id="option22" class="option-green wide-swatch">
	                                                                                            <a style="height: 23px; min-width: 23px;" title="${itemColor}" class="swatch-link swatch-link-272" id="swatch22" name="${itemColor}" value="${itemColor}"> <span style="height: 21px; min-width: 21px; line-height: 21px;" class="swatch-label">${itemColor}</span> <span class="x">X</span> </a>
	                                                                                        </li>
	                                                                                    </c:forEach>
                                                                                    </ul>
                                                                                </div>
                                                                            </dd><dt><label class="required"><em>*</em>Size</label></dt>
                                                                            <dd class="last">
                                                                                <div class="input-box">
                                                                                    <select class="required-entry super-attribute-select" id="attribute-size">
                                                                                        <option value="" selected="true" disabled>Choose an Option...</option>
                                                                                    </select>
                                                                                </div>
                                                                            </dd>
                                                                        </dl>
                                                                        <p class="required">* Required Fields</p>
                                                                    </div>
                                                                    <div class="product-options-bottom">
                                                                        <div class="add-to-cart">
                                                                            <label for="qty">Qty:</label>
                                                                            <div class="qty_cart">
                                                                            	<select class="required-entry super-attribute-select" id="attribute-qty">
                                                                                	<option value="1">1</option>
                                                                                	<c:forEach var="qty" begin="2" end="10" step="1">
                                                                                		<option value="${qty}">${qty}</option>
                                                                                	</c:forEach>
                                                                                </select>
                                                                            </div>
                                                                            <ul class="add-to-links">
                                                                                <li><a title="Add to Wishlist" href="#" class="link-wishlist">Add to Wishlist</a>
                                                                                </li>
                                                                                <li><span class="separator">|</span> <a href="#" title="Add to Compare" class="link-compare">Add to Compare</a>
                                                                                </li>
                                                                            </ul>
                                                                            <div class="button_addto">
                                                                                <button type="submit" title="Add to Cart" id="product-addtocart-button" class="button btn-cart btn-cart-detail"><span><span>Add to Cart</span></span>
                                                                                </button>
                                                                            </div>
                                                                        </div><!-- /.add-to-cart -->
                                                                    </div>
                                                                    </c:if>
                                                                </div>
                                                            </div><!-- /.em-product-view-secondary -->
                                                        </div>
                                                        <div class="clearer"></div>
                                                    </div><!-- /.product-view-detail -->
                                                </form>
                                            </div><!-- /.product-essential -->
                                            <div class="row">
                                                <div class="em-product-view-primary col-sm-16 first"></div>
                                            </div>
                                            <div class="row">
                                                <div class="em-product-view-primary col-sm-16 first">
                                                    <div class="em-product-info ">
                                                        <div class="em-product-details ">
                                                            <div class="em-details-tabs product-collateral">
                                                                <div class="em-details-tabs-content">
                                                                    <div class="box-collateral em-line-01 box-description">
                                                                        <div class="em-block-title">
                                                                            <h2>Details</h2>
                                                                        </div>
                                                                        <div class="box-collateral-content">
                                                                            <div class="std"> Morbi at ex at arcu posuere luctus. Maecenas eu nulla libero. Duis vulputate blandit hendrerit. Vestibulum mollis mattis justo nec auctor. Morbi non libero felis. Praesent porttitor blandit dui, nec mollis risus tempus ut. Fusce tincidunt</div>
                                                                        </div>
                                                                    </div><!-- /.box-collateral -->
                                                                    <div class="box-collateral box-tags em-line-01">
                                                                        <div class="em-block-title">
                                                                            <h2>Product Tags</h2>
                                                                        </div>
                                                                        <div class="box-collateral-content">
                                                                            <form id="addTagForm" method="get">
                                                                                <div class="form-add">
                                                                                    <label for="productTagName">Add Your Tags:</label>
                                                                                    <div class="input-box">
                                                                                        <input type="text" class="input-text required-entry" name="productTagName" id="productTagName" />
                                                                                    </div>
                                                                                    <button type="button" title="Add Tags" class="button"> <span> <span>Add Tags</span> </span>
                                                                                    </button>
                                                                                </div>
                                                                            </form>
                                                                            <p class="note">Use spaces to separate tags. Use single quotes (') for phrases.</p>
                                                                        </div><!-- /.box-collateral-content -->
                                                                    </div><!-- /.box-collateral -->
                                                                </div><!-- /.em-details-tabs-content -->
                                                            </div><!-- /.em-details-tabs -->
                                                            <div class="box-collateral box-reviews em-line-01" id="customer-reviews">
                                                                <div class="form_review no_reviews">
                                                                    <div class="form-add" id="customer_review_form">
                                                                        <div class="em-block-title">
                                                                            <h2>Write Your Own Review</h2>
                                                                        </div>
                                                                            <fieldset>
                                                                                <h3>150자 이내로 작성 가능합니다. 한번 작성한 리뷰는 수정, 삭제가 불가능하니 신중하게 작성해주세요.</h3>
                                                                                <ul class="form-list">
                                                                                    <li>
                                                                                        <label for="username_field" class="required"><em>*</em>Username</label>
                                                                                        <div class="input-box">
                                                                                            <input type="text" name="username" id="username" class="input-text required-entry" value="${session_user['username']}" readonly/>
                                                                                        </div>
                                                                                    </li>
                                                                                    <li>
                                                                                        <label for="review_field" class="required"><em>*</em>Review</label>
                                                                                        <div class="input-box">
                                                                                            <textarea name="contents" id="contents" cols="5" rows="3" class="required-entry"></textarea>
                                                                                        </div>
                                                                                    </li>
                                                                                </ul>
                                                                            </fieldset>
	                                                                    <div class="buttons-set">
	                                                                        <button type="button" id="submit_Review" name="submit_Review" title="Submit Review" class="button"><span><span>Submit Review</span></span>
	                                                                        </button>
	                                                                    </div>
                                                                    </div>
                                                                </div><!-- /.form_review -->
                                                            </div><!-- /.box-collateral -->
                                                            <div class="block block-sample">
                                                                <div class="em-line-01">
                                                                    <div class="em-block-title">
                                                                        <h2><span>Product Reviews</span></h2>
                                                                    </div>
                                                                    <div id="block-reviewlist">
                                                                	</div>
                                                                </div>
                                                            </div><!-- /.block -->
                                                            <div class="toolbar-bottom em-box-03">
				                                                <div class="toolbar">
				                                                    <div class="pager">
				                                                    </div><!-- /.pager -->
				                                                </div>
				                                            </div><!-- /.toolbar-bottom -->
                                                            <div class="box-collateral box-up-sell em-line-01" id="em-wrapper-upsell">
                                                                <div>
                                                                    <div class="em-block-title">
                                                                        <h2><span>You may also be interested</span></h2>
                                                                    </div>
                                                                    <div id="upsell-product-table">
                                                                        <ul id="em-upsell" class="products-grid em-upsell-slider">
                                                                            <li class="item">
                                                                                <div class="product-item">
                                                                                    <a href="#" title="Ink Eater: Destroyed Tee" class="product-image">
                                                                                        <ul class="productlabels_icons">
                                                                                            <li class="label new">
                                                                                                <p> New</p>
                                                                                            </li>
                                                                                        </ul> <img class="em-img-lazy img-responsive" src="http://placehold.it/180x180" width="180" height="180" alt="Ink Eater: Destroyed Tee" /> </a>
                                                                                    <div class="product-shop">
                                                                                        <div class="f-fix">
                                                                                            <h3 class="product-name"><a href="#" title="Ink Eater: Destroyed Tee">Ink Eater: Destroyed Tee</a></h3>
                                                                                            <div class="ratings">
                                                                                                <div class="rating-box">
                                                                                                    <div class="rating" style="width:%"></div>
                                                                                                </div> <span class="amount"><a href="#">(0)</a></span>
                                                                                            </div>
                                                                                            <div class="price-box" itemscope itemtype="http://schema.org/Product"> <span class="regular-price" id="product-price-120-upsell"> <span class="price">$22.00</span> </span>
                                                                                                <a href="#" class="minimal-price-link"> <span class="label">As low as:</span> <span class="price" id="product-minimal-price-120-upsell"> $18.00 </span> </a>
                                                                                            </div>
                                                                                            <div class="em-btn-addto">
                                                                                                <button type="submit" title="Add to Cart" class="button btn-cart"><span><span>Add to Cart</span></span>
                                                                                                </button>
                                                                                                <ul class="add-to-links">
                                                                                                    <li><a href="#" class="link-wishlist" title="Add to Wishlist">Add to Wishlist</a>
                                                                                                    </li>
                                                                                                    <li><span class="separator">|</span> <a href="#" class="link-compare" title="Add to Compare">Add to Compare</a>
                                                                                                    </li>
                                                                                                </ul>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div><!-- /.product-shop -->
                                                                                </div><!-- /.product-item -->
                                                                            </li>
                                                                        </ul>
                                                                    </div><!-- /#upsell-product-table -->
                                                                </div><!-- /#em-wrapper-upsell -->
                                                            </div><!-- /.box-collateral -->
                                                        </div><!-- /.em-product-details -->
                                                    </div><!-- /.em-product-info -->
                                                    <div id="em-product-shop-pos-bottom" style="display:inline-block;"></div>
                                                </div>
                                            </div>
                                        </div><!-- /.product-view -->
                                    </div>
                                </div>
                            </div><!-- /.em-main-container -->
                        </div>
                    </div>
                </div><!-- /.em-wrapper-main -->
                <p id="back-top" style="display: none;"><a title="Top" href="#top">Top</a></p>
            </div><!-- /.page -->
        </div><!-- /.wrapper -->
        
        <script id="template" type="text/x-handlebars-template">
		{{#each this}}
		<div class="block-content box">
			<p style="text-align:left">{{this.contents}}</p>
			<p style="text-align:right">작성자 : {{this.username}}</p>
			<p style="text-align:right">작성일 : {{prettifyDate this.regdate}}</p>
		</div>
		{{else}}
		<div class="block-content box">
			<p style="text-align:center">작성된 리뷰가 없습니다.</p>
		</div>
		{{/each}}
		</script>
		
        <!-- Page Configuration -->
        <script type="text/javascript">
            layout = '1column';
            var header = $("meta[name='_csrf_header']").attr("content");
        	var token  = $("meta[name='_csrf']").attr("content");
        	var productid =  $("#productid").val();
        	
        	function getPage(pageInfo) {
        		$.getJSON(pageInfo, function(data) {
        			printData(data.reviewList, $("#block-reviewlist"), $("#template"));
        			
        			if ( data.reviewList != '' )
        				printPaging(data.pageMaker, data.totalReviewCnt, $(".pager"));
        		});
        	}
        	
        	Handlebars.registerHelper("prettifyDate", function(timeValue) {
        		var dateObj = new Date(timeValue);
        		var year = dateObj.getFullYear();
      			var month = dateObj.getMonth() + 1;
      			var date = dateObj.getDate();
      			
      			return year + "-" + month + "-" + date;
        	});
        	
        	var printData = function (reviewArr, target, templateObject) {
        		var template = Handlebars.compile(templateObject.html());
        		
        		var html = template(reviewArr);
        		$(".block-content").remove();
        		
        		target.after(html);
        	};
        	
        	var printPaging = function(pageMaker, totalReviewCnt, target) {
        		if ( totalReviewCnt > 1 )
        			var str = "<p class='amount'> Total " + totalReviewCnt + " reviews</p>";
       			else
        			var str = "<p class='amount'> Total " + totalReviewCnt + " review</p>";
        			
        		str += "<div class='pages pagination'>";
        		str += "<ol>";

        		if ( pageMaker.prev )
        			str += "<li><a class='fa fa-angle-left' href='" + (pageMaker.start - 1) + "' title='Prev'></a></li>";
        		
        		for ( var i = pageMaker.start, len = pageMaker.end; i <= len; i++ ) {
        			var strClass = ( pageMaker.page == i ) ? "current" : "";
        			str += "<li><a class='" + strClass +"' href='" + i + "'>" + i + "</a></li>";
        		}
        			
        		if ( pageMaker.next )
        			str += "<li><a class='fa fa-angle-right' href='" + (pageMaker.end + 1) + "' title='Next'></a></li>";
        		
        		str += "</ol>";
        		str += "</div>";
        		
        		target.html(str);
        	};
        	
            $(document).ready(function() { 
            	getPage("/reviews/" + productid + "/1"); 
            });
            
            $(".pagination").on("click", "li a", function(event) {
            	event.preventDefault();
            	replyPage = $(this).attr("href");
            	getPage("/reviews/" + productid + "/" + replyPage);
            });
            
            $("#submit_Review").on("click", function() {
            	var username =  $("#username").val();
            	var contents = $("#contents").val().trim();
            	
            	if ( username == '' )
            	{
            		alert("로그인 후 작성하실 수 있습니다.");
            		return false;
            	}
            	else if ( contents == '' )
            	{
            		alert("내용을 입력해주세요.");
            		return false;
            	}
            	else if ( contents.length > 150 )
            	{
            		alert("리뷰 내용은 띄어쓰기를 포함하여 최대 150자로 제한됩니다.");
            		return false;
            	}
            	
            	$.ajax({
            		type: 'post',
            		url: '/reviews/',
            		beforeSend: function(xhr){
        				xhr.setRequestHeader(header, token);
        		    },
            		headers: {
            			"Content-Type" : "application/json",
            			"X-HTTP-Method-Override" : "POST"
            		},
            		dataType: "text",
            		data: JSON.stringify({username: username, contents: contents, productid: productid}),
            		success: function(result) {
            			console.log("result: " + result);
            			if ( result == 'SUCCESS' ) {
            				alert("상품에 대한 리뷰가 추가되었습니다.");
            				location.href = "/product/productDetail.do?productid=" + productid;
            			}
            		}
            	});
            });
        </script>
        <!-- Product View Js -->
        <script type="text/javascript" src="/resources/js/em_product_view.js"></script>
        <!-- Lightbox Js -->
        <script type="text/javascript" src="/resources/js/lightbox.min.js"></script>
        <!-- 상품의 상세페이지 관련 스크립트 함수들이 선언된 Js 파일 -->
        <script type="text/javascript" src="/resources/js/commonProductDetail.js"></script>
    </body>
</html>