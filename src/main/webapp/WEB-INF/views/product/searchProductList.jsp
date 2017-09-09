<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.product-image-img {
	max-height: 300px;
}
</style>
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
                            <div class="col-sm-24 em-col-main">
                                <div class="page-title category-title">
                                    <h1>${subcategory} 
                                    	<c:if test="${brand != null || brand == '' }">
                                    		by ${brand}
                                    	</c:if>
                                    </h1>
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
                                                        <input type="hidden" name="pageCount" value="${pageCount}">
                                                        <input type="hidden" name="countPerPage" value="${countPerPage}">
                                                        <input type="hidden" name="subcategory" value="${subcategory}">
                                                        <input type="hidden" name="productname" value="${param.productname}">
                                                        <select class="sortby" name="sortby" id="sortby" onchange="javascript:sortForm.submit()">
                                                            <option value="create_time" <c:out value="${sortby == 'create_time' ? 'selected' : ''}" />>등록순</option>
                                                            <option value="productname" <c:out value="${sortby == 'productname' ? 'selected' : ''}" />>이름순</option>
                                                            <option value="saleprice_asc" <c:out value="${sortby == 'saleprice_asc' ? 'selected' : ''}" />>낮은가격순</option>
                                                            <option value="saleprice_desc" <c:out value="${sortby == 'saleprice_desc' ? 'selected' : ''}" />>높은가격순</option>
                                                        </select>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div><!-- /.sorter -->
                                        </div>
                                    </div><!-- /.toolbar-top -->
                                    <div id="em-grid-mode">
                                        <ul class="emcatalog-grid-mode products-grid emcatalog-disable-hover-below-mobile">
                                            <c:forEach var="product" items="${productList}" varStatus="status">
                                             <li class="item">
                                                 <div class="product-item">
                                                     <div class="product-shop-top">
                                                         <a href="/product/productDetail.do?productid=${product.productid}" title="${product.productname}" class="product-image"> 
                                                         <img id="product-collection-image-215" class="em-img-lazy img-responsive em-alt-org product-image-img" src="/displayMainPictureurl?productid=${product.productid}" width="150px" height="150px" alt="${product.productname}" /><span class="bkg-hover"></span> </a>
                                                     </div>
                                                     <div class="product-shop">
                                                         <div class="f-fix">
                                                             <h2 class="product-name text-center  "><a href="/product/productDetail.do?productid=${product.productid}" title="${product.productname}">${product.productname}</a></h2>
                                                             <div class="text-center ">
                                                                 <div class="price-box"> 
                                                                  <c:if test="${ product.originalprice > product.saleprice }">
                                                                     	<p class="old-price"><span class="price"><del><fmt:formatNumber value="${product.originalprice}" type="currency" currencySymbol="￦"/></del></span></p>
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
                                                <p class="amount"> Products ${first} to ${last} of ${totalCnt} total</p>
                                                <div class="pages">
                                                    <ol>
                                                    	<c:if test="${pageMaker.prev }">
								    <c:url var="productListP" value="searchProductList.do">
								        <c:param name="pageCount" value="${pageMaker.start - 1}" />
								        <c:param name="countPerPage" value="12" />
								        <c:param name="subcategory" value="${subcategory}" />
								        <c:param name="sortby" value="${sortby}" />
								        <c:param name="productname" value="${param.productname}" />
								    </c:url>
                                                    		<li><a class="fa fa-angle-left" href="${productListP }" title="Prev"> </a></li>
                                                    	</c:if>
                                                    	<c:forEach begin="${pageMaker.start }" end="${pageMaker.end}" var="idx">
								    <c:url var="productListP" value="searchProductList.do">
								        <c:param name="pageCount" value="${idx}" />
								        <c:param name="countPerPage" value="12" />
								        <c:param name="subcategory" value="${subcategory}" />
								        <c:param name="sortby" value="${sortby}" />
								        <c:param name="productname" value="${param.productname}" />
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
								        <c:param name="productname" value="${param.productname}" />
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
                                            </div><!-- /.sorter -->
                                        </div>
                                    </div><!-- /.toolbar-bottom -->
                                </div><!-- /.category-products -->
                            </div><!-- /.em-col-main -->
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
            setColumnCountGridMode();
        });
        $(window).resize($.throttle(300, function() {
            setColumnCountGridMode();
        }));
    })(jQuery);
</script>
