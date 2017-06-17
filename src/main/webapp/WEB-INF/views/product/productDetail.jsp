<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                                                <form method="post" id="product_addtocart_form">
                                                    <input name="form_key" type="hidden" value="N4DL2crX27DuHSDk" />
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
                                                                    <script>
                                                                    
                                                                    </script>
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
                                                                            <p class="availability in-stock"> Availability: <span class="value">In stock</span>
                                                                            </p>
                                                                        </div>
                                                                        <div class="short-description">
                                                                            <h2>Quick Overview</h2>
                                                                            <div class="std">${product.description}</div>
                                                                        </div>
                                                                        
                                                                        <div>
                                                                            
                                                                            <p class="availability in-stock">Availability: <span>In stock</span>
                                                                            </p>
                                                                            
                                                                            <div class="price-box"> 
                                                                            <c:if test="${ product.originalprice > product.saleprice }">
                                                                            	<span class="price"><del><fmt:formatNumber value="${product.originalprice}" type="currency" currencySymbol="￦"/></del></span>
                                                                            </c:if>
                                                                            	<span class="price" id="product-price-206"> <span class="price" style="font-color:red"><fmt:formatNumber value="${product.saleprice}" type="currency" currencySymbol="￦"/></span> </span>
                                                                            </div>
                                                                        </div>
                                                                    </div><!-- /.em-product-info-basic -->
                                                                    <div id="product-options-wrapper" class="product-options" style="overflow-y: hidden;">
                                                                        <dl class="last"><dt class="swatch-attr"> <label class="required" id="color_label"> <em>*</em>Color: <span class="select-label" id="select_label_color">Red</span> </label></dt>
                                                                            <dd class="clearfix swatch-attr">
                                                                                <div class="input-box">
                                                                                    <select class="required-entry super-attribute-select no-display swatch-select" id="attribute272" name="super_attribute[272]">
                                                                                        <option value="">Choose an Option...</option>
                                                                                        <option value="22" data-label="green">Green +$5.25</option>
                                                                                        <option value="26" data-label="red">Red</option>
                                                                                    </select>
                                                                                    <ul class="configurable-swatch-list clearfix" id="configurable_swatch_color">
                                                                                        <li id="option22" class="option-green wide-swatch">
                                                                                            <a style="height: 23px; min-width: 23px;" title="Green" class="swatch-link swatch-link-272" id="swatch22" name="green" href="javascript:void(0)"> <span style="height: 21px; min-width: 21px; line-height: 21px;" class="swatch-label"> Green </span> <span class="x">X</span> </a>
                                                                                        </li>
                                                                                        <li id="option26" class="option-red selected">
                                                                                            <a style="height: 23px; min-width: 23px;" title="Red" class="swatch-link swatch-link-272" id="swatch26" name="red" href="javascript:void(0)"> <span style="height: 21px; min-width: 21px; line-height: 21px;" class="swatch-label"> Red </span> <span class="x">X</span> </a>
                                                                                        </li>
                                                                                    </ul>
                                                                                </div>
                                                                            </dd><dt><label class="required"><em>*</em>Size</label></dt>
                                                                            <dd class="last">
                                                                                <div class="input-box">
                                                                                    <select class="required-entry super-attribute-select" id="attribute525" name="super_attribute[525]">
                                                                                        <option value="">Choose an Option...</option>
                                                                                        <option value="100" data-label="small" disabled="disabled">Small</option>
                                                                                        <option value="99" data-label="medium">Medium</option>
                                                                                        <option value="98" data-label="large">Large</option>
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
                                                                                <div class="qty-ctl">
                                                                                    <button title="decrease" onclick="changeQty(0); return false;" class="decrease">decrease</button>
                                                                                </div>
                                                                                <input type="text" name="qty" id="qty" maxlength="12" value="1" title="Qty" class="input-text qty" />
                                                                                <div class="qty-ctl">
                                                                                    <button title="increase" onclick="changeQty(1); return false;" class="increase">increase</button>
                                                                                </div>
                                                                            </div>
                                                                            <ul class="add-to-links">
                                                                                <li><a title="Add to Wishlist" href="#" class="link-wishlist">Add to Wishlist</a>
                                                                                </li>
                                                                                <li><span class="separator">|</span> <a href="#" title="Add to Compare" class="link-compare">Add to Compare</a>
                                                                                </li>
                                                                            </ul>
                                                                            <div class="button_addto">
                                                                                <button type="button" title="Buy Now" id="em-buy-now" class="button btn-em-buy-now"><span><span>Buy Now</span></span>
                                                                                </button>
                                                                                <button type="button" title="Add to Cart" id="product-addtocart-button" class="button btn-cart btn-cart-detail"><span><span>Add to Cart</span></span>
                                                                                </button>
                                                                            </div>
                                                                        </div><!-- /.add-to-cart -->
                                                                    </div>
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
                                                                    <div class="box-collateral  em-line-01">
                                                                        <div class="em-block-title">
                                                                            <h2>Custom Tab N</h2>
                                                                        </div>
                                                                        <div class="box">
                                                                            <p>Sample Block Here ...</p>
                                                                            <p>A sample of additional collateral tabs that you can insert in static the backend.</p>
                                                                        </div>
                                                                    </div><!-- /.box-collateral -->
                                                                    <div class="box-collateral em-line-01">
                                                                        <div class="em-block-title">
                                                                            <h2>Custom Tab 1</h2>
                                                                        </div>
                                                                        <div class="box">
                                                                            <p>Sample Block Here ...</p>
                                                                            <p>A sample of additional collateral tabs that you can insert in static the backend.</p>
                                                                        </div>
                                                                    </div><!-- /.box-collateral -->
                                                                </div><!-- /.em-details-tabs-content -->
                                                            </div><!-- /.em-details-tabs -->
                                                            <div class="box-collateral box-reviews em-line-01" id="customer-reviews">
                                                                <div class="form_review no_reviews">
                                                                    <div class="form-add" id="customer_review_form">
                                                                        <div class="em-block-title">
                                                                            <h2>Write Your Own Review</h2>
                                                                        </div>
                                                                        <form method="post" id="review-form">
                                                                            <fieldset>
                                                                                <h3>You're reviewing: <span>Configurable Product</span></h3>
                                                                                <ul class="form-list">
                                                                                    <li>
                                                                                        <label for="nickname_field" class="required"><em>*</em>Nickname</label>
                                                                                        <div class="input-box">
                                                                                            <input type="text" name="nickname" id="nickname_field" class="input-text required-entry" value="" />
                                                                                        </div>
                                                                                    </li>
                                                                                    <li>
                                                                                        <label for="summary_field" class="required"><em>*</em>Summary of Your Review</label>
                                                                                        <div class="input-box">
                                                                                            <input type="text" name="title" id="summary_field" class="input-text required-entry" value="" />
                                                                                        </div>
                                                                                    </li>
                                                                                    <li>
                                                                                        <label for="review_field" class="required"><em>*</em>Review</label>
                                                                                        <div class="input-box">
                                                                                            <textarea name="detail" id="review_field" cols="5" rows="3" class="required-entry"></textarea>
                                                                                        </div>
                                                                                    </li>
                                                                                </ul>
                                                                            </fieldset>
                                                                            <h4>How do you rate this product? <em class="required">*</em></h4> <span id="input-message-box"></span>
                                                                            <table class="data-table" id="product-review-table">
                                                                                <col style="width:1%;" />
                                                                                <col style="width:1%;" />
                                                                                <col style="width:1%;" />
                                                                                <col style="width:1%;" />
                                                                                <col style="width:1%;" />
                                                                                <col style="width:1%;" />
                                                                                <thead>
                                                                                    <tr>
                                                                                        <th>&nbsp;</th>
                                                                                        <th><span class="nobr">1 star</span>
                                                                                        </th>
                                                                                        <th><span class="nobr">2 stars</span>
                                                                                        </th>
                                                                                        <th><span class="nobr">3 stars</span>
                                                                                        </th>
                                                                                        <th><span class="nobr">4 stars</span>
                                                                                        </th>
                                                                                        <th><span class="nobr">5 stars</span>
                                                                                        </th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <th>Price</th>
                                                                                        <td class="value">
                                                                                            <input type="radio" name="ratings[3]" id="Price_1" value="11" class="radio" />
                                                                                        </td>
                                                                                        <td class="value">
                                                                                            <input type="radio" name="ratings[3]" id="Price_2" value="12" class="radio" />
                                                                                        </td>
                                                                                        <td class="value">
                                                                                            <input type="radio" name="ratings[3]" id="Price_3" value="13" class="radio" />
                                                                                        </td>
                                                                                        <td class="value">
                                                                                            <input type="radio" name="ratings[3]" id="Price_4" value="14" class="radio" />
                                                                                        </td>
                                                                                        <td class="value">
                                                                                            <input type="radio" name="ratings[3]" id="Price_5" value="15" class="radio" />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <th>Value</th>
                                                                                        <td class="value">
                                                                                            <input type="radio" name="ratings[2]" id="Value_1" value="6" class="radio" />
                                                                                        </td>
                                                                                        <td class="value">
                                                                                            <input type="radio" name="ratings[2]" id="Value_2" value="7" class="radio" />
                                                                                        </td>
                                                                                        <td class="value">
                                                                                            <input type="radio" name="ratings[2]" id="Value_3" value="8" class="radio" />
                                                                                        </td>
                                                                                        <td class="value">
                                                                                            <input type="radio" name="ratings[2]" id="Value_4" value="9" class="radio" />
                                                                                        </td>
                                                                                        <td class="value">
                                                                                            <input type="radio" name="ratings[2]" id="Value_5" value="10" class="radio" />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <th>Quality</th>
                                                                                        <td class="value">
                                                                                            <input type="radio" name="ratings[1]" id="Quality_1" value="1" class="radio" />
                                                                                        </td>
                                                                                        <td class="value">
                                                                                            <input type="radio" name="ratings[1]" id="Quality_2" value="2" class="radio" />
                                                                                        </td>
                                                                                        <td class="value">
                                                                                            <input type="radio" name="ratings[1]" id="Quality_3" value="3" class="radio" />
                                                                                        </td>
                                                                                        <td class="value">
                                                                                            <input type="radio" name="ratings[1]" id="Quality_4" value="4" class="radio" />
                                                                                        </td>
                                                                                        <td class="value">
                                                                                            <input type="radio" name="ratings[1]" id="Quality_5" value="5" class="radio" />
                                                                                        </td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                            <input type="hidden" name="validate_rating" class="validate-rating" value="" />
                                                                            <div class="buttons-set">
                                                                                <button type="submit" title="Submit Review" class="button"><span><span>Submit Review</span></span>
                                                                                </button>
                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                </div><!-- /.form_review -->
                                                            </div><!-- /.box-collateral -->
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
                                                                                                <button type="button" title="Add to Cart" class="button btn-cart"><span><span>Add to Cart</span></span>
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

        <!-- Page Configuration -->
        <script type="text/javascript">
            layout = '1column';
        </script>
        <!-- Product View Js -->
        <script type="text/javascript" src="/resources/js/em_product_view.js"></script>
        <!-- Lightbox Js -->
        <script type="text/javascript" src="/resources/js/lightbox.min.js"></script>
        <script type="text/javascript">
	        $( ".em-moreviews-slider li a" ).click(function() {
	            var address = $(this).children("img");
	            $(".product-image img").attr("src", address.attr("src").replace("/s_", "/"));
	            $(this).parent().addClass("on").siblings().removeClass("on");
	            return false;
	        });
        
            jQuery('.cloud-zoom-gallery').click(function() {
                jQuery('#zoom-btn').attr('href', this.href);
            });
            function doSliderMoreview() {
                var owl = $("ul.em-moreviews-slider");
                if (owl.length) {
                    owl.owlCarousel({
                        // Navigation
                        navigation: true,
                        navigationText: ["Previous", "Next"],
                        pagination: false,
                        paginationNumbers: false,
                        // Responsive
                        responsive: true,
                        items: 7,
                        /*items above 1200px browser width*/
                        itemsDesktop: [1200, 4],
                        /*//items between 1199px and 981px*/
                        itemsDesktopSmall: [992, 7],
                        itemsTablet: [768, 3],
                        itemsMobile: [480, 2],
                        // CSS Styles
                        baseClass: "owl-carousel",
                        theme: "owl-theme",
                        transitionStyle: false,
                        addClassActive: true,
                    });
                }
            }

            function changeQty(increase) {
                var qty = parseInt($('#qty').val());
                if (!isNaN(qty)) {
                    console.log(qty)
                    qty = increase ? qty + 1 : (qty > 1 ? qty - 1 : 1);
                    $('#qty').val(qty);
                }
            }

            (function($) {
                $(window).load(function() {
                    if (!isPhone) {
                    	$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
                    }
                    doSliderMoreview();

                    /* Up sell */
                    var owl = $("#em-upsell");
                    if (owl.length) {
                        owl.owlCarousel({
                            // Navigation
                            navigation: true,
                            navigationText: ["Previous", "Next"],
                            pagination: false,
                            paginationNumbers: false,
                            // Responsive
                            responsive: true,
                            items: 4,
                            /*items above 1200px browser width*/
                            itemsDesktop: [1200, 4],
                            /*//items between 1199px and 981px*/
                            itemsDesktopSmall: [992, 3],
                            itemsTablet: [768, 3],
                            itemsMobile: [480, 2],
                            // CSS Styles
                            baseClass: "owl-carousel",
                            theme: "owl-theme",
                            transitionStyle: false,
                            addClassActive: true,
                            afterMove: function() {
                                var $_img = owl.find('img.em-img-lazy');
                                if ($_img.length) {
                                    var timeout = setTimeout(function() {
                                        $_img.trigger("appear");
                                    }, 200);
                                }
                            },
                        });
                    }
                });
            })(jQuery);
        </script>

    </body>
</html>