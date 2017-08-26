<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class='no-js' lang='ko'>
<head>
</head>
<body class="cms-index-index">
	<div class="wrapper">
		<div class="page one-column">
		
<div class="em-wrapper-main">
	<div class="container-main">

             <div class="container">
                 <div class="em-inner-main">
                     
                     <div class="em-main-container em-col1-layout">
                         <div class="row">
                             <div class="em-col-main col-sm-24">
                                 <div class="std"></div>
                                 <div class="em-wrapper-new-arrivals-tabs">
                                     <div class="em-new-arrivals-tabs em-line-01">
                                         <div id="em_ajax_tabs_b668273696e898e5a96156eda83a18bb" class="emtabs-ajaxblock-loaded">
                                             <div class="em-tabs-widget tabs-widget ">
                                                 <div class="widget-title em-widget-title">
                                                     <h3><span>New Arrivals</span></h3>
                                                 </div>
                                                 
                                                 <div id="tab_emtabs_1ed890af40c7029de15bb975d5dd5a48_1" class="tab-pane tab-item content_tab_emtabs_1ed890af40c7029de15bb975d5dd5a48_1">
                                                     <div class="wrapper button-show01">
                                                         <div id="em_ajax_products_7136f8e6a3fad48b3fe97be9a1557b89" class="emfilter-ajaxblock-loaded">
                                                             <div id="em_fashionclean_new_arrivals_tab01" class="em-grid-20 ">
                                                                 <div class="widget em-filterproducts-grid">
                                                                     <div class="widget-products em-widget-products">
                                                                         <div id="em-grid-mode-em_fashionclean_new_arrivals_tab01">
                                                                             <div class="products-grid ">
                                                                             
																			 	 <c:forEach var="newArrivalProduct" items="${newArrivalProductList}" varStatus="status">																				
	                                                                                 <div class="item" style="  ">
	                                                                                     <div class="product-item">
	                                                                                         <div class="product-shop-top">
	                                                                                             <a href="/product/productDetail.do?productid=${newArrivalProduct.productid}" title="${newArrivalProduct.productname}" class="product-image" target="_blank">
	                                                                                                 <!--show label product - label extension is required-->
	                                                                                                 <img class="em-alt-hover img-responsive em-img-lazy" src="/displayMainPictureurl?productid=${newArrivalProduct.productid}" width="200px" height="250px" alt="${newArrivalProduct.productname}" />
	                                                                                                 <img class="img-responsive em-img-lazy em-alt-org" src="/displayMainPictureurl?productid=${newArrivalProduct.productid}" width="200px" height="250px" alt="${newArrivalProduct.productname}" />
	                                                                                             </a>
	                                                                                         </div><!-- /.product-shop-top -->
	                                                                                         <div class="product-shop">
	                                                                                             <div class="f-fix">
	                                                                                                 <!--product name-->
	                                                                                                 <h3 class="product-name"><a href="#" title="${newArrivalProduct.productname}">${newArrivalProduct.productname}</a></h3>
	                                                                                                 <!--product price-->
	
	                                                                                                 <div class="price-box">
	                                                                                                 	<c:if test="${ newArrivalProduct.originalprice > newArrivalProduct.saleprice }">
		                                                                                                 	 <p class="old-price">
		                                                                                                         <span class="price-label">Regular Price:</span>
		                                                                                                         <span class="price"><fmt:formatNumber value="${newArrivalProduct.originalprice}" type="currency" currencySymbol="￦"/></span>
		                                                                                                     </p>
		                                                                                                     <p class="special-price">
		                                                                                                         <span class="price-label">Special Price</span>
	                                                                                                          	 <span class="price"><fmt:formatNumber value="${newArrivalProduct.saleprice}" type="currency" currencySymbol="￦"/></span>
		                                                                                                     </p>
		                                                                                                 </c:if>
		                                                                                                 <c:if test="${ newArrivalProduct.originalprice == newArrivalProduct.saleprice }">
	                                                                                                     	<span class="regular-price"><span class="price"><fmt:formatNumber value="${newArrivalProduct.saleprice}" type="currency" currencySymbol="￦"/></span></span>
	                                                                                                     </c:if>
	                                                                                                 </div>
	                                                                                             </div>
	                                                                                         </div><!-- /.product-shop -->
	                                                                                     </div>
	                                                                                 </div>
																				 </c:forEach>
																				 
                                                                             </div>
                                                                         </div>
                                                                     </div><!-- /.widget -->
                                                                 </div>
                                                             </div>
                                                         </div>
                                                     </div>
                                                 </div><!-- /#tab_emtabs_1ed890af40c7029de15bb975d5dd5a48_1 -->
                                         </div>
                                     </div>
                                 </div><!-- /.em-wrapper-new-arrivals-tabs -->
                                 <div class="row hidden-xs">
                                     <div class="em-wrapper-banners">
                                         <div class="col-sm-12 img-banner text-center">
                                             <div class="em-effect06">
                                                 <a class="banner-img" title="em-sample-title" href="#"> <img class="img-responsive" alt="em-sample-alt" src="http://placehold.it/580x180" />시즌 이벤트 </a>
                                                 <div class="effect-line">&nbsp;</div>
                                             </div>
                                         </div>
                                         <div class="col-sm-12 img-banner text-center">
                                             <div class="em-effect06">
                                                 <a class="banner-img" title="em-sample-title" href="#"> <img class="img-responsive" alt="em-sample-alt" src="http://placehold.it/580x180" />블로그 리뷰 </a>
                                                 <div class="effect-line">&nbsp;</div>
                                             </div>
                                         </div>
                                     </div><!-- /.em-wrapper-banners -->
                                 </div>
                                 <div class="em-wrapper-new-arrivals-tabs">
                                     <div class="em-new-arrivals-tabs em-line-01">
                                         <div id="em_ajax_tabs_5de40bf47604862e9458a84dddf16d97" class="emtabs-ajaxblock-loaded">
                                             <div class="em-tabs-widget tabs-widget ">
                                                 <div class="widget-title em-widget-title">
                                                     <h3><span>Best Sellers</span></h3>
                                                 </div>
                                                 
                                                 <div id="tab_emtabs_43b23a29b0b77e18b41444a1bd362dcc_1" class="tab-pane tab-item content_tab_emtabs_43b23a29b0b77e18b41444a1bd362dcc_1">
                                                     <div class="wrapper button-show01">
                                                         <div id="em_ajax_products_37322578433c68c3b7b4b2f83fe54e1b" class="emfilter-ajaxblock-loaded">
                                                             <div id="em_fashionclean_bestseller_tab01" class="em-grid-20 ">
                                                                 <div class="widget em-filterproducts-grid">
                                                                     <div class="widget-products em-widget-products">
                                                                         <div id="em-grid-mode-em_fashionclean_bestseller_tab01">
                                                                             <div class="products-grid ">
                                                                             
                                                                                 <c:forEach var="bestProduct" items="${bestProductList}" varStatus="status">																				
		                                                                            <div class="item" style="  ">
		                                                                                <div class="product-item">
		                                                                                    <div class="product-shop-top">
		                                                                                        <a href="/product/productDetail.do?productid=${bestProduct.productid}" title="${bestProduct.productname}" class="product-image" target="_blank">
		                                                                                            <!--show label product - label extension is required-->
		                                                                                            <img class="em-alt-hover img-responsive em-img-lazy" src="/displayFile?fileName=${bestProduct.mainpictureurl}" width="200px" height="250px" alt="${newArrivalProduct.productname}" />
		                                                                                            <img class="img-responsive em-img-lazy em-alt-org" src="/displayFile?fileName=${bestProduct.mainpictureurl}" width="200px" height="250px" alt="${newArrivalProduct.productname}" />
		                                                                                        </a>
		                                                                                    </div><!-- /.product-shop-top -->
		                                                                                    <div class="product-shop">
		                                                                                        <div class="f-fix">
		                                                                                            <!--product name-->
		                                                                                            <h3 class="product-name"><a href="#" title="${bestProduct.productname}">${bestProduct.productname}</a></h3>
		                                                                                            <!--product price-->
		
		                                                                                            <div class="price-box">
		                                                                                            	<c:if test="${ bestProduct.originalprice > bestProduct.saleprice }">
		                                                                                             	 <p class="old-price">
		                                                                                                     <span class="price-label">Regular Price:</span>
		                                                                                                     <span class="price"><fmt:formatNumber value="${bestProduct.originalprice}" type="currency" currencySymbol="￦"/></span>
		                                                                                                 </p>
		                                                                                                 <p class="special-price">
		                                                                                                     <span class="price-label">Special Price</span>
		                                                                                                     	 <span class="price"><fmt:formatNumber value="${bestProduct.saleprice}" type="currency" currencySymbol="￦"/></span>
		                                                                                                 </p>
		                                                                                             </c:if>
		                                                                                             <c:if test="${ bestProduct.originalprice == bestProduct.saleprice }">
		                                                                                                	<span class="regular-price"><span class="price"><fmt:formatNumber value="${bestProduct.saleprice}" type="currency" currencySymbol="￦"/></span></span>
		                                                                                                </c:if>
		                                                                                            </div>
		                                                                                        </div>
		                                                                                    </div><!-- /.product-shop -->
		                                                                                </div>
		                                                                            </div>
															 					</c:forEach>
															 					
                                                                             </div>
                                                                         </div>
                                                                     </div>
                                                                 </div><!-- /.widget -->
                                                             </div>
                                                         </div>
                                                     </div>
                                                 </div><!-- /#tab_emtabs_43b23a29b0b77e18b41444a1bd362dcc_1 -->
				                             </div>
				                         </div>
				                     </div><!-- /.em-main-container -->
				
				                 </div><!-- /.em-inner-main -->
				             </div><!-- /.container -->
				
				             <div class="em-wrapper-area03">
				                 <div class="em-wrapper-ads-17 hidden-xs">
				                     <div class="em-wrapper-parallax">
				                         <div class="em-box-info">
				                             <h1 class="em-text-upercase" style="font: 700 4.2rem/1 Raleway,Helvetica Neue, Helvetica, Arial, sans-serif;">Already Loving emeverything? Rate Us Now!</h1>
				                             <h3 style="font: italic 2.5rem/1 Lora,Helvetica Neue, Helvetica, Arial, sans-serif; padding-bottom: 3.4rem; margin-bottom: 2.2rem;">We Make Your Dream Came True</h3> <a class="button-link first" href="#"><span>purchase now</span></a>
				                         </div>
				                     </div>
				                 </div>
				             </div><!-- /.em-wrapper-area03 -->
				
				                 <div class="em-wrapper-area05">
				                     <div class="row hidden-xs">
				                     <div class="col-sm-24">
				                      <div class="em-block-title" style="text-align:center;padding:10px;">
				                                     <h1><span>INSTAGRAM</span></h1>
				                                 </div>
				                         <div class="em-wrapper-banners">
				                             <div class="col-sm-6 first img-banner text-center">
				                                 <div class="effect-hover-text">
				                                     <a class="banner-img" title="em-sample-title" href="#"> <img class="img-responsive" alt="em-sample-alt" src="https://scontent-icn1-1.cdninstagram.com/t51.2885-15/e35/18380257_603878003144916_1684823272589361152_n.jpg" /> </a>
				                                    <!--  <a class="banner-text" title="em-sample-title" href="#"> <img class="img-responsive" alt="em-sample-alt" src="images/wysiwyg/em_ads_text_04.png" /> </a>  -->
				                                 </div>
				                             </div><!-- /.img-banner -->
				                             
				                               <div class="col-sm-6 first img-banner text-center">
				                                 <div class="effect-hover-text">
				                                     <a class="banner-img" title="em-sample-title" href="#"> <img class="img-responsive" alt="em-sample-alt" src="https://scontent-icn1-1.cdninstagram.com/t51.2885-15/sh0.08/e35/p750x750/18382044_296099627496725_5666808987400536064_n.jpg"  /> </a>
				                                     <!-- <a class="banner-text" title="em-sample-title" href="#"> <img class="img-responsive" alt="em-sample-alt" src="images/wysiwyg/em_ads_text_04.png" /> </a> -->
				                                 </div>
				                             </div><!-- /.img-banner -->
				                             
				                              <div class="col-sm-6 first img-banner text-center">
				                                 <div class="effect-hover-text">
				                                     <a class="banner-img" title="em-sample-title" href="#"> <img class="img-responsive" alt="em-sample-alt" src="https://scontent-icn1-1.cdninstagram.com/t51.2885-15/e35/17882593_840717742751807_3055276770430287872_n.jpg" /> </a>
				                                    <!--  <a class="banner-text" title="em-sample-title" href="#"> <img class="img-responsive" alt="em-sample-alt" src="images/wysiwyg/em_ads_text_04.png" /> </a> -->
				                                 </div>
				                             </div><!-- /.img-banner -->
				                             
				                             <div class="col-sm-6 first img-banner text-center">
				                                 <div class="effect-hover-text">
				                                     <a class="banner-img" title="em-sample-title" href="#"> <img class="img-responsive" alt="em-sample-alt" src="https://scontent-icn1-1.cdninstagram.com/t51.2885-15/e35/18160329_288825131568018_2993456334021591040_n.jpg" /> </a>
				                                   <!--   <a class="banner-text" title="em-sample-title" href="#"> <img class="img-responsive" alt="em-sample-alt" src="images/wysiwyg/em_ads_text_04.png" /> </a> -->
				                                 </div>
				                             </div><!-- /.img-banner -->
				                             </div>
				                        </div>
				                     </div>
				                 </div><!-- /.em-wrapper-area05 -->
				
				                 <div class="em-wrapper-area06">
				                     <div class="row hidden-xs">
				                         <div class="col-sm-24">
				                             <div class="em-wrapper-ads-10 em-line-01">
				                                 <div class="em-block-title" style="text-align:center;padding:10px;">
				                                     <h1><span>MAGAZINE</span></h1>
				                                 </div>
				                                 <div class="em-slider em-slider-from-our-blog" data-emslider-navigation="true" data-emslider-items="3" data-emslider-desktop="3" data-emslider-desktop-small="2" data-emslider-tablet="2" data-emslider-mobile="1">
				                                     <div class="em-blog-item em-effect-13 em-blog-style02">
				                                         <div class="em-blog-content bkg-top">
				                                             <a title="em-sample-title" class="img-banner-small" href="http://www.elle.co.kr/article/view.asp?MenuCode=en010102&intSno=18778"> <img alt="em_blog" class="img-responsive" src="http://image.elle.co.kr/upload/NEWS/2017/05/ncd_050806626/thumb/ncd_050806626_173034v_b.jpg" /> </a>
				                                             <div class="em-blog-time">
				                                                 <p class="em-blog-date">21</p>
				                                                 <p class="em-blog-month">Jul</p>
				                                             </div>
				                                             <div class="hov">&nbsp;</div>
				                                         </div>
				                                         <div class="em-box bkg-bottom">
				                                             <h4 class="em-blog-title"><a href="blog-detail.html">Pineapples, Mermaids and&hellip;</a></h4>
				                                             <p class="em-blog-des">Boutique festival Secret Garden went down in Sydney&rsquo;s&nbsp;Camden over the weekend, and all the free-spirited kids came out to&hellip;</p>
				                                             <p><a class="link-more" href="http://www.elle.co.kr/article/view.asp?MenuCode=en010102&intSno=18778">Read more</a>
				                                             </p>
				                                         </div>
				                                     </div>
				                                     
				                                     <div class="em-blog-item em-effect-13 em-blog-style02">
				                                         <div class="em-blog-content bkg-top">
				                                             <a title="em-sample-title" class="img-banner-small" href="http://www.elle.co.kr/article/view.asp?MenuCode=en010101&intSno=18443"> <img alt="em_blog" class="img-responsive" src="http://image.elle.co.kr/upload/NEWS/2017/03/ncd_032453261/thumb/ncd_032453261_155706v_b.jpg" /> </a>
				                                             <div class="em-blog-time">
				                                                 <p class="em-blog-date">13</p>
				                                                 <p class="em-blog-month">May</p>
				                                             </div>
				                                             <div class="hov">&nbsp;</div>
				                                         </div>
				                                         <div class="em-box bkg-bottom">
				                                             <h4 class="em-blog-title"><a href="blog-detail.html">11 Emerging Jewelry&hellip;</a></h4>
				                                             <p class="em-blog-des">Jewelry&nbsp;designers are a little like the stepchild of the fashion industry. They&rsquo;re adored, but tend to play second fiddle to&hellip;</p>
				                                             <p><a class="link-more" href="blog-detail.html">Read more</a>
				                                             </p>
				                                         </div>
				                                     </div>
				                                     
				                                     <div class="em-blog-item em-effect-13 em-blog-style02">
				                                         <div class="em-blog-content bkg-top">
				                                             <a title="em-sample-title" class="img-banner-small" href="http://www.elle.co.kr/article/view.asp?MenuCode=en010101&intSno=18666"> <img alt="em_blog" class="img-responsive" src="http://image.elle.co.kr/upload/NEWS/2017/04/ncd_041948343/thumb/ncd_041948343_120725v_b.jpg" /> </a>
				                                             <div class="em-blog-time">
				                                                 <p class="em-blog-date">9</p>
				                                                 <p class="em-blog-month">April</p>
				                                             </div>
				                                             <div class="hov">&nbsp;</div>
				                                         </div>
				                                         
				                                         <div class="em-box bkg-bottom">
				                                             <h4 class="em-blog-title"><a href="blog-detail.html">Target’s Lilly&hellip;</a></h4>
				                                             <p class="em-blog-des">A few weeks after announcing that&nbsp;Lilly Pulitzer&nbsp;would be its next design collaboration, which will include&hellip;</p>
				                                             <p><a class="link-more" href="blog-detail.html">Read more</a>
				                                             </p>
				                                         </div>
				                                     </div>
				                                    
				                                 </div><!-- /.em-slider -->
				                             </div>
				                         </div>
				                     </div>
				                 </div><!-- /.em-wrapper-area06 -->
				
				             </div><!-- /.container -->
						</div>
					</div>
				</div>
			</div>
         </div><!-- /.container-main -->
     </div><!-- /.em-wrapper-main -->		

</div>
<!-- /.page -->
</div>
<!-- /.wrapper -->
</body>
</html>