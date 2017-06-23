<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<body class="catalog-category-view">
    	
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
                                        <li class="home"> <a href="/" title="Home"><span>Home</span></a> 
                                        <span class="separator">/ </span>
                                        </li>
                                        <li class="contact"> <!--a href="/"-->
                                        <span>${productList[0].category }</span>
                                        <!--/a-->
                                        <span class="separator">/ </span>
                                        </li>
                                        <li class="contact"> <strong> ${subcategory }</strong>
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
                            <div class="em-wrapper-area03"></div>
                            <div class="em-wrapper-area04"></div>
                            <div class="em-main-container em-col2-left-layout">
                                <div class="row">
                                    <div class="col-sm-18 col-sm-push-6 em-col-main">
                                        <div class="page-title category-title">
                                            <h1>${subcategory}</h1>
                                        </div>
                                        
                                        <div class="category-products">
                                            <div class="toolbar-top">
                                                <div class="toolbar">
                                                    <div class="pager">
                                                        <p class="amount"> Items ${first} to ${last} of ${totalCnt} total</p>
                                                        <div class="pages">
                                                            <ol>
                                                                <li class="current">1</li>
                                                                <li><a href="#">2</a>
                                                                </li>
                                                                <li>
                                                                    <a class="fa fa-angle-right" href="#" title="Next">  </a>
                                                                    <a class="fa fa-angle-double-right" href="#" title="Double Next">  </a>
                                                                </li>
                                                            </ol>
                                                        </div>
                                                    </div><!-- /.pager -->
                                                    
                                                    
                                                    <div class="sorter">
                                                        <div class="sort-by toolbar-switch">
                                                            <div class="toolbar-title">
                                                                <label>Sort By</label>
                                                                <form name="sortForm">
                                                                <input type="hidden" name="pageCount" value="${pageCount }">
                                                                <input type="hidden" name="countPerPage" value="${countPerPage }">
                                                                <input type="hidden" name="subcategory" value="${subcategory}">
                                                                <select class="sortby" name="sortby" id="sortby" onchange="javascript:sortForm.submit()">
                                                                    <option value="create_time" selected="selected"> 등록순</option>
                                                                    <option value="productname"> 이름순</option>
                                                                    <option value="originalprice"> 가격순</option>
                                                                </select>
                                                                </form>
                                                            </div>
                                                        </div>
                                                        <!-- <div class="limiter toolbar-switch">
                                                            <div class="toolbar-title">
                                                                <label>Show</label>
                                                                <select class="toolbar-show">
                                                                    <option value="12" selected="selected"> 12</option>
                                                                    <option value="24"> 24</option>
                                                                    <option value="36"> 36</option>
                                                                </select>
                                                            </div>
                                                        </div> -->
                                                    </div><!-- /.sorter -->
                                                    
                                                    
                                                </div>
                                            </div><!-- /.toolbar-top -->
                                            <div id="em-grid-mode">
                                                <ul class="emcatalog-grid-mode products-grid emcatalog-disable-hover-below-mobile">
                                                    <c:forEach var="product" items="${productList}" varStatus="status">
	                                                    <li class="item">
	                                                        <div class="product-item">
	                                                            <div class="product-shop-top">
	                                                                <a href="/product/productDetail.do?productid=${product.productid}" title="${product.productname}" class="product-image"> <img id="product-collection-image-215" class="em-img-lazy img-responsive em-alt-org" src="/displayFile?fileName=${product.mainpictureurl}" width="150px" height="150px" alt="${product.productname}" /><span class="bkg-hover"></span> </a>
	                                                            </div>
	                                                            <div class="product-shop">
	                                                                <div class="f-fix">
	                                                                    <h2 class="product-name text-center  "><a href="product-detail.html" title="${product.productname}">${product.productname}</a></h2>
	                                                                    <div class=" text-center">
	                                                                        <div class="ratings">
	                                                                            <div class="rating-box">
	                                                                                <div class="rating" style="width:%"></div>
	                                                                            </div> <span class="amount"><a href="#" onclick="215">(0)</a></span>
	                                                                        </div>
	                                                                    </div>
	                                                                    <div class="text-center ">
	                                                                        <div class="price-box"> 
		                                                                        <c:if test="${ product.originalprice > product.saleprice }">
	                                                                            	<span class="price"><del><fmt:formatNumber value="${product.originalprice}" type="currency" currencySymbol="￦"/></del></span><br>
	                                                                            </c:if>
		                                                                        <span class="price" id="product-price-206"> <span class="price" style="font-color:red"><fmt:formatNumber value="${product.saleprice}" type="currency" currencySymbol="￦"/></span> </span>
	                                                                        </div>
	                                                                    </div>
	                                                                </div>
	                                                            </div>
	                                                        </div><!-- /.product-item -->
	                                                    </li>
                                                    </c:forEach>
                                                </ul>
                                            </div><!-- /.em-grid-mode -->
                                            
                                            <div class="toolbar-bottom em-box-03">
                                                <div class="toolbar">
                                                    <div class="pager">
                                                        <p class="amount"> Items ${first} to ${last} of ${totalCnt} total</p>
                                                        <div class="pages">
                                                            <ol>
                                                            	<c:if test="${pageMaker.prev }">
																    <c:url var="productListP" value="productList.do">
																        <c:param name="pageCount" value="${pageMaker.start - 1}" />
																        <c:param name="countPerPage" value="12" />
																        <c:param name="subcategory" value="${subcategory}" />
																        <c:param name="sortby" value="${sortby}" />
																        <c:if test="${brand != null || brand == '' }">
																        <c:param name="brand" value="${brand}" />
																        </c:if>
																    </c:url>
                                                            		<li><a class="fa fa-angle-left" href="${productListP }" title="Prev"> </a></li>
                                                            	</c:if>
                                                            	
                                                            	<c:forEach begin="${pageMaker.start }" end="${pageMaker.end}" var="idx">
																    <c:url var="productListP" value="productList.do">
																        <c:param name="pageCount" value="${idx}" />
																        <c:param name="countPerPage" value="12" />
																        <c:param name="subcategory" value="${subcategory}" />
																        <c:param name="sortby" value="${sortby}" />
																        <c:if test="${brand != null || brand == '' }">
																        <c:param name="brand" value="${brand}" />
																        </c:if>
																    </c:url>
																    <li>
																        <a class='<c:out value="${idx == pageMaker.page ? 'current' : ''}"/>' href='${productListP }'>${idx}</a>
																    </li>    
																</c:forEach>
																
																<c:if test="${pageMaker.next }">
																    <c:url var="productListP" value="productList.do">
																        <c:param name="pageCount" value="${pageMaker.end + 1}" />
																        <c:param name="countPerPage" value="12" />
																        <c:param name="subcategory" value="${subcategory}" />
																        <c:param name="sortby" value="${sortby}" />
																        <c:if test="${brand != null || brand == '' }">
																        <c:param name="brand" value="${brand}" />
																        </c:if>
																    </c:url>
																    <li><a class="fa fa-angle-right" href="${productListP }" title="Next"></a></li>
																</c:if>
                                                            	
                                                            </ol>
                                                            
                                                        </div>
                                                    </div><!-- /.pager -->
                                                    <div class="sorter">
                                                        <div class="sort-by toolbar-switch">
                                                            <div class="toolbar-title">
                                                                <label>Sort By</label>
                                                                <select class="sortby" name="sortby">
                                                                    <option value="position" selected="selected"> Position</option>
                                                                    <option value="name"> Name</option>
                                                                    <option value="price"> Price</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <!-- <div class="limiter toolbar-switch">
                                                            <div class="toolbar-title">
                                                                <label>Show</label>
                                                                <select class="toolbar-show">
                                                                    <option value="12" selected="selected"> 12</option>
                                                                    <option value="24"> 24</option>
                                                                    <option value="36"> 36</option>
                                                                </select>
                                                            </div>
                                                        </div> -->
                                                    </div><!-- /.sorter -->
                                                </div>
                                            </div><!-- /.toolbar-bottom -->
                                        </div><!-- /.category-products -->
                                    </div><!-- /.em-col-main -->
                                    
                                    
									<!-- left sidemenu -->
                                    <div class="col-sm-6 col-sm-pull-18 em-col-left em-sidebar">
                                        <div class="em-wrapper-area02"></div>
                                        <div class="em-line-01 block block-layered-nav">
                                            <div class="em-block-title block-title"> <strong><span>Shop By</span></strong>
                                            </div>
                                            <div class="block-content">
                                                <p class="block-subtitle">Shopping Options</p>
                                                <dl id="narrow-by-list"><dt> ${productList[0].category }</dt>
                                                    <dd>
                                                        <ol class="filter tree-filter">
                                                            <li>
                                                                <!-- <div class="label-icon">
                                                                    <div class="label"> <a class="tree-item" href="#">All Categories</a> (273)</div>
                                                                </div> -->
                                                                <ol>
                                                                	<c:forEach var="item" items="${subcategoryList }">
                                                                    <li class="selected">
                                                                        <div class="label-icon">
                                                                        	<a href="/product/productList.do?subcategory=${item.subcategory }">
                                                                            <div class="label">
                                                                             ${item.subcategory } (${item.count })
                                                                             </div></a>
                                                                        </div>
                                                                    </li>
                                                                	</c:forEach>
                                                                </ol>
                                                            </li>
                                                        </ol>
                                                    </dd><dt> Price</dt>
                                                    <dd>
                                                        <div class="rslider">
                                                            <div id="slider-range"></div>
                                                            <div class="values">
                                                            <!-- priceList 이용할까 말까? -->
                                                                <span id="from-val"><span class="price">88</span></span>
                                                                <span id="to-val"><span class="price">721</span></span>
                                                            </div>
                                                        </div>
                                                    </dd><dt> Brand</dt>
                                                    <dd>
                                                        <ol>
                                                        	<c:forEach var="brand" items="${brandList }">
                                                            	<li> <a href="/product/productList.do?subcategory=${subcategory }&brand=${brand.brand }">${brand.brand }</a> (${brand.count })</li>
                                                            </c:forEach>
                                                        </ol>
                                                    </dd>
                                                </dl>
                                            </div>
                                        </div><!-- /.block-layered-nav -->
                                        <div class="em-line-01 block block-list block-compare ">
                                            <div class="em-block-title block-title"> <strong><span>Compare Products (0)</span></strong>
                                            </div>
                                            <div class="block-content">
                                                <p class="empty">You have no items to compare.</p>
                                            </div>
                                        </div><!-- /.block-compare -->
                                        <div class="em-wrapper-banners">
                                            <div class="img-banner">
                                                <div class="em-effect06">
                                                    <a class="em-eff06-04" href="#"><img class="img-responsive retina-img" alt="em_ads_01.jpg" src="http://placehold.it/280x210" />
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="img-banner">
                                                <div class="effect-hover-text2">
                                                    <a class="banner-img" title="em-sample-title" href="#"> <img class="img-responsive retina-img" alt="em-sample-alt" src="images/wysiwyg/em_ads_05.jpg" /> </a>
                                                    <a class="banner-text" title="em-sample-title" href="#"> <img class="img-responsive" alt="em-sample-alt" src="http://placehold.it/280x210" /> </a>
                                                </div>
                                            </div>
                                        </div><!-- /.em-wrapper-banners -->
                                    </div><!-- /.em-sidebar -->
                                </div>
                            </div><!-- /.em-main-container -->
                        </div>
                    </div>
                </div><!-- /.em-wrapper-main -->

                <p id="back-top" style="display: none;"><a title="Top" href="#top">Top</a></p>

            </div><!-- /.page -->
            
        </div><!-- /.wrapper -->


        <script type="text/javascript">
            (function($) {
                if (typeof EM == 'undefined') EM = {};
                if (typeof EM.SETTING == 'undefined') EM.SETTING = {};

                function setColumnCountGridMode() {
                    var wWin = $(window).width();
                    if (EM.SETTING.DISABLE_RESPONSIVE == 1) {
                        var sDesktop = 'emcatalog-desktop-';
                        var sDesktopSmall = 'emcatalog-desktop-small-';
                        var sTablet = 'emcatalog-tablet-';
                        var sMobile = 'emcatalog-mobile-';
                        var sGrid = $('#em-grid-mode');
                        if (wWin > 1200) {
                            sGrid.removeClass().addClass(sDesktop + '4');
                        } else {
                            if (wWin <= 1200 && wWin > 768) {
                                sGrid.removeClass().addClass(sDesktopSmall + '3');
                            } else {
                                if (wWin <= 768 && wWin > 480) {
                                    sGrid.removeClass().addClass(sTablet + '3');
                                } else {
                                    sGrid.removeClass().addClass(sMobile + '2');
                                }
                            }
                        }
                    } else {
                        var sDesktop = 'emcatalog-desktop-';
                        var sGrid = $('#em-grid-mode');
                        sGrid.removeClass().addClass(sDesktop + '4');
                    }
                };


                //Ready Function
                $(document).ready(function() {

                    /* Price slider Activation */
                    var currencies = "$";
                    var toolbar_status = "1";
                    var rate = "1";
                    var min = "88"
                    min = Number(min);
                    var max = "721"
                    max = Number(max);
                    var currentMinPrice = "88"
                    currentMinPrice = Number(currentMinPrice);
                    var currentMaxPrice = "721"
                        //alert('min: '+min+'--max: '+ max+ 'currentMin: '+currentMinPrice);
                    currentMaxPrice = Number(currentMaxPrice);
                    var params = "";
                    var tax_min = "0";
                    var tax_max = "0";
                    params = $.trim(params);
                    //slider
                    $("#slider-range").slider({
                        range: true,
                        min: min,
                        max: max,
                        values: [currentMinPrice, currentMaxPrice],
                        slide: function(event, ui) {
                            console.log(ui.values[0])
                            $('#from-val > span').text('$' + ui.values[0].toFixed(2));
                            $('#to-val > span').text('$' + ui.values[1].toFixed(2));
                        },
                        stop: function(event, ui) {

                        }
                    });

                    $('#from-val > span').text('$' + $("#slider-range").slider("values", 0).toFixed(2));
                    $('#to-val > span').text('$' + $("#slider-range").slider("values", 1).toFixed(2));

                    $('#slider-range a:first').addClass('first_item');
                    $('#slider-range a:last').addClass('last_item');

                    setColumnCountGridMode();
                });
                $(window).resize($.throttle(300, function() {
                    setColumnCountGridMode();
                }));
            })(jQuery);
        </script>

    </body>
