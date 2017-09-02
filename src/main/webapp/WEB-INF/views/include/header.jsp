<%@ page pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="_csrf_header" content="X-CSRF-TOKEN" />
<meta name="${_csrf.parameterName}" content="${_csrf.token}" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/include/include-header.jspf" %>

<script type="text/javascript">
$(document).ready(function(){
	$('#search_mini_form').submit(function () {
	
	    var productname = $.trim($('#search').val());

	    if (productname  === '') {
	        alert('검색할 상품을 입력하세요.');
	        return false;
	    }
	});
	
	$('#search_mini_form_mobile').submit(function () {
	
	    var productname = $.trim($('#search-mobile').val());

	    if (productname  === '') {
	        alert('검색할 상품을 입력하세요.');
	        return false;
	    }
	});
});
</script>

<div class="em-wrapper-header">
	<div id="em-mheader" class="visible-xs container">
		<div id="em-mheader-top" class="row">

			<!-- in mobile, left 4/24 - logo -->
			<div id="em-mheader-logo" class="col-xs-4">
				<div class="em-logo">
					<a href="/index.do" title="uStyle" class="logo">
						<strong>uStyle</strong>
						<img src="${pageContext.request.contextPath}/resources/images/logo_small.png" alt="uStyle" />
					</a>
				</div>
			</div>

			<!-- in mobile, 20/24 - menu(search, shopping cart, more menu) -->
			<div class="col-xs-20">
				<div class="em-top-search">
					<div class="em-header-search-mobile">
						<form id="search_mini_form_mobile" method="get" action="/product/searchProductList.do">
							<div class="form-search no_cate_search">
								<div class="text-search">
									<input id="search-mobile" type="text" name="productname" value=""
										class="input-text" maxlength="128"
										placeholder="상품을 검색하세요." />
									<button type="submit" title="Search" class="button">
										<span><span>Search</span></span>
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- /.em-top-search -->

				<div class="em-top-cart">
					<div class="em-wrapper-topcart-mobile em-no-quickshop">
						<div class="em-container-topcart">
							<div class="em-summary-topcart">
								<a id="em-amount-cart-link" title="Shopping Cart"
									class="em-amount-topcart" href="/cart/viewCart.do"> <span
									class="em-topcart-text">My Cart:</span>
								</a>
							</div>
						</div>
					</div>
				</div>
				<!-- /.em-top-cart -->

				<div id="em-mheader-wrapper-menu">
					<span class="visible-xs fa fa-bars" id="em-mheader-menu-icon"></span>
					<div id="em-mheader-menu-content" style="display: none;">
						<div class="em-wrapper-top">
							<div class="em-top-links row">
								<div class="">
									<ul class="top-header-link links">
										<!-- ë¡ê·¸ì¸ ëììëì ìëììë ëì¤ëê² ë¤ë¦. -->
										<!-- 로그인 전 -->
										<c:if test="${session_user['username'] == null }">
											<li class="first col-xs-8"><a title="Login"
												class="login-link fa fa-user" href="/login.do"><span>Login</span></a></li>
											<li class="col-xs-8"><a title="Sign up"
												class='signup-link fa fa-sign-out' href="/register.do"><span>Sign Up</span></a></li>
										</c:if>
										<!-- 로그인 후 -->
										<c:if test="${session_user['username'] != null }">
											<li class="first col-xs-6"><a title="Logout"
															class="logout-link fa fa-user" href="/logout.do"><span>Logout</span></a></li>
											<li class="col-xs-6"><a title="Update"
												class='signup-link fa fa-sign-out' href="/userInfo.do"><span>${session_userpoint} point</span></a></li>
											<li class="col-xs-6"><a title="Purchase List"
												class='signup-link fa fa-sign-out' href="/purchaseList.do"><span>Purchase List</span></a></li>
											<li class="last col-xs-6"><a href="/cart/viewCart.do"
												class="checkout-link fa fa-shopping-cart"><span>Cart</span></a>
											</li>
										</c:if>
									</ul>
									<!-- /.top-header-link -->
								</div>
							</div>
							<!-- /.em-top-links -->
						</div>
						<!-- /.em-wrapper-top -->

						<div class="row mobile-block">
							<div class="col-sm-24">
								<ul class="em-mobile-help">
									<li>
										<a href="/"><span class="fa fa-home">&nbsp;</span>Home</a>
									</li>
									<li>
										<a href="/pin/pinBoardList.do"><span class="fa fa-star">&nbsp;</span>PinBoard List</a>
									</li>
								</ul>
							</div>
						</div>
						<div class="row mobile-main-menu toggle-menu">
							<div class="col-sm-24">
								<div class="em-top-menu">
									<div class="em-menu-mobile">
										<div class="megamenu-wrapper wrapper-7_8258">
											<div class="em_nav" id="toogle_menu_7_8258">
												<ul class="hnav em_menu_mobile">
													<!-- /.menu-item-link -->
													<li class="menu-item-link menu-item-depth-0 dd-menu-link fa fa-bars menu-item-parent">
														<a class="em-menu-link" href="#"> <span>Category</span></a>
														<ul class="menu-container">
															<li class="menu-item-text menu-item-depth-1  ">
																<ul class="em-catalog-navigation vertical">
																	<li class="level0 nav-1 first parent">
																		<a href="#"><span>Tops</span></a>
																		<ul class="level0">
																			<li class="level1 nav-1-1 first">
																				<a href="#"><span>Blouses</span></a>
																			</li>
																			<li class="level1 nav-1-2">
																				<a href="#"><span>Shirts</span></a>
																			</li>
																			<li class="level1 nav-1-3 last">
																				<a href="#"><span>Jackets</span></a>
																			</li>
																		</ul></li>
																	<!-- /.menu-item-vbox -->
																	<li class="level0 nav-2 parent">
																		<a href="#"> <span>Bottoms</span></a>
																		<ul class="level0">
																			<li class="level1 nav-2-1 first">
																				<a href="#"><span>Skirts</span></a>
																			</li>
																			<li class="level1 nav-2-2">
																				<a href="#"><span>Dresses</span></a>
																			</li>
																			<li class="level1 nav-2-3">
																				<a href="#"><span>Pants</span></a>
																			</li>
																			<li class="level1 nav-2-4">
																				<a href="#"><span>Jeans</span></a>
																			</li>
																			<li class="level1 nav-2-5 last"><a href="#">
																					<span>Shorts</span>
																			</a></li>
																		</ul></li>
																	<!-- /.menu-item-vbox -->
																	<li class="level0 nav-3 parent">
																		<a href="#"> <span>Bags</span></a>
																		<ul class="level0">
																			<li class="level1 nav-3-1 first">
																				<a href="#"><span>Totes</span></a>
																			</li>
																			<li class="level1 nav-3-2">
																				<a href="#"><span>Backpacks</span></a>
																			</li>
																			<li class="level1 nav-3-3 last">
																				<a href="#"><span>Satchels</span></a>
																			</li>
																		</ul></li>
																	<!-- /.menu-item-vbox -->
																	<li class="level0 nav-4 parent">
																		<a href="#"><span>Underwear</span></a>
																		<ul class="level0">
																			<li class="level1 nav-4-1 first">
																				<a href="#"><span>Bras</span></a>
																			</li>
																			<li class="level1 nav-4-2">
																				<a href="#"><span>Panties</span></a>
																			</li>
																			<li class="level1 nav-4-3 last">
																				<a href="#"><span>Pajamas</span></a>
																			</li>
																		</ul></li>
																	<!-- /.menu-item-vbox -->
																	<li class="level0 nav-5 parent">
																		<a href="#"><span>Shoes</span></a>
																		<ul class="level0">
																			<li class="level1 nav-5-1 first">
																				<a href="#"><span>Heels</span></a>
																			</li>
																			<li class="level1 nav-5-2">
																				<a href="#"><span>Sneakers</span></a>
																			</li>
																			<li class="level1 nav-5-3">
																				<a href="#"><span>Flats</span></a>
																			</li>
																			<li class="level1 nav-5-5 last">
																				<a href="#"><span>Boots</span></a>
																			</li>
																		</ul>
																	</li>
																	<!-- /.menu-item-vbox -->
																	<li class="level0 nav-6 parent last">
																		<a href="#"><span>Accessories</span></a>
																		<ul class="level0">
																			<li class="level1 nav-6-1 first">
																				<a href="#"><span>Jewelry</span></a>
																			</li>
																			<li class="level1 nav-6-2">
																				<a href="#"><span>Watches</span></a>
																			</li>
																			<li class="level1 nav-6-3">
																				<a href="#"><span>Hats</span></a>
																			</li>
																			<li class="level1 nav-6-4 last">
																				<a href="#"><span>Sunglasses</span></a>
																			</li>
																		</ul>
																	</li>
																</ul>
															</li>
														</ul>
													</li>
													<!-- /.menu-item-link -->
												</ul>
												<!-- /.hnav -->
											</div>
										</div>
										<!-- /.megamenu-wrapper -->
									</div>
								</div>
							</div>
						</div>
						<!-- /. mobile-main-menu -->
						<div class="row mobile-block">
							<div class="col-sm-24">
								<ul class="em-mobile-help">
									<li><a href="#"><span class="fa fa-question-circle">&nbsp;</span>Help
											Center</a></li>
									<li><a href="#"><span class="fa fa-star">&nbsp;</span>Feedback</a>
									</li>
								</ul>
							</div>
						</div>
						<!-- /.mobile-block -->

					</div>
					<!-- /.em-mheader-menu-content -->
				</div>
				<!-- /#em-mheader-wrapper-menu -->
			</div>
		</div>
		<!-- /#em-mheader-top -->
	</div>
	<!-- /#em-mheader -->
	<div class="hidden-xs em-header-style27">
		<div class="em-header-top">
			<div class="container">
				<div class="row">
					<div class="col-sm-24">
						<div class="">
							<div class="em-top-links">
								<div class="f-right"></div>
								<div class="f-right">
									<ul class="em-links-wishlist">
										<li class="first last">
											<a href="/pin/myPinBoardList.do" title="Wishlist">My PinBoard List</a>
										</li>
									</ul>
								</div>
								<!-- 로그인 전 -->
								<c:if test="${session_user['username'] == null }">
								<ul class="list-inline f-right">
									<li><a class="em-register-link" href="/register.do"
										title="Register">Register</a></li>
								</ul>
								<!-- header login -->
								<div id="em-login-link"
									class="account-link f-right em-non-login">
									<a href="/login.do" class="link-account" id="link-login"
										title="Login">Login</a>
									<div class="em-account" id="em-account-login-form"
										style="display: none;">
										<form method="post" id="top-login-form" action="/loginPost.do">
											<input name="form_key" type="hidden" value="W2ZAZqxDCT2TpZYs" />
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
												
											<div class="block-content">
												<p class="login-title h6 primary">Login</p>
												<p class="login-desc">If you have an account with us,
													please log in.</p>
												<ul class="form-list">
													<li><label for="mini-login">UserName<em>*</em>
													</label> <input type="text" name="username" id="mini-login"
														class="input-text required-entry validate-email" /></li>
													<li><label for="mini-password">Password<em>*</em>
													</label> <input type="password" name="password"
														id="mini-password"
														class="input-text required-entry validate-password" /></li>
													<li><span class="required">* Required Fields</span></li>
												</ul>
												<div class="action-forgot">
													<div class="login_forgotpassword">
														<p>
															<a href="/changePassword.do">Forgot Your Password?</a>
														</p>
														<p>
															<span>Don't have an account?</span><a
																class="create-account-link-wishlist" href="/register.do"
																title="Sign Up">Sign Up</a>
														</p>
													</div>
													<div class="actions">
														<button type="submit" class="button">
															<span><span>Login</span></span>
														</button>
													</div>
												</div>
											</div>
										</form>
										<!-- /.top-login-form -->
									</div>
									<!-- /.em-account -->
								</div>
								</c:if>
								<!-- 로그인 후 -->
								<c:if test="${session_user['username'] != null }">
								<ul class="list-inline f-right">
									<li><a class="em-register-link" href="/userInfo.do"
										title="point">${session_userpoint } point</a></li>
									<li><a href="/purchaseList.do"
										title="Purchase List">Purchase List</a></li>
								</ul>
								<div id="em-login-link"
									class="account-link f-right em-non-login">
									<a href="/logout.do" class="link-account" id="link-login"
										title="Logout">${session_user['username'] }님</a>
									<div class="em-account" id="em-account-login-form"
										style="display: none;">
										<form method="post" id="top-login-form" action="/loginPost.do">
											<input name="form_key" type="hidden" value="iMzNKKno559ogiTe" />
											<div class="block-content">
												<p class="login-title h6 primary">Login</p>
												<p class="login-desc">If you have an account with us,
													please log in.</p>
												<div class="action-forgot">
													<div class="login_forgotpassword">
														<p>
														</p>
														<p>
														</p>
													</div>
												</div>
											</div>
										</form>
										<!-- /.top-login-form -->
									</div>
									<!-- /.em-account -->
								</div>
								</c:if>
								<!-- /#em-login-link -->

							</div>
							<!-- /.em-top-links -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.em-header-top -->

		<div class="em-header-middle">
			<div class="container">
				<div class="row" style="display: flex;align-items: center;justify-content: center;">
					<div class="col-sm-6">
						<div class="em-logo">
							<a href="/index.do" title="uStyle" class="logo"><strong>uStyle</strong>
							<img class="retina-img" src="${pageContext.request.contextPath}/resources/images/logo.png" alt="uStyle" /></a>
						</div>
					</div>
					<!-- ë¡ê³  -->
					<div class="col-sm-2">
					
					</div>
					<div class="col-sm-10 text-center">
						<form id="search_mini_form" method="get" action="/product/searchProductList.do">
							<div class="form-search no_cate_search f-right">
								<div class="text-search">
									<label for="search">Search:</label> <input id="search"
										type="text" name="productname" value="" class="input-text"
										maxlength="128"
										placeholder="" />
									<button type="submit" title="Search" class="button">
										<span><span>Search</span></span>
									</button>
								</div>
							</div>
						</form>
					</div>

					<!-- ì¼íì¹´í¸ -->
					<div class="col-sm-6">
						<div class="em-top-cart f-right">
							<div
								class="em-wrapper-js-topcart em-wrapper-topcart em-no-quickshop">
								<div class="em-container-topcart">
									<div class="em-summary-topcart">
										<a class="em-amount-js-topcart em-amount-topcart"
											title="Shopping Cart" href="/cart/viewCart.do"> <span
											class="em-topcart-text">My Cart:</span>
										</a>
									</div>
								</div>
							</div>
							<!-- /.em-wrapper-js-topcart -->
						</div>
						<!-- /.em-top-cart -->
					</div>
				</div>
			</div>
		</div>
		<!-- /.em-header-middle -->

		<div id="em-fixed-top"></div>
		<div class="em-header-bottom em-fixed-top">
			<div class="container em-menu-fix-pos">
				<div class="row">
					<div class="col-sm-24">
						<div class="line-top text-center">
							<div class="em-logo-sticky f-left">
								<a href="/" title="Furniture Commerce" class="logo"><img
									src="${pageContext.request.contextPath}/resources/images/logo_small.png" alt="Furniture Commerce" /> </a>
							</div>
							<div class="em-menu-hoz">
								<div id="em-main-megamenu">
									<div class="em-menu">
										<div class="megamenu-wrapper wrapper-4_3366">
											<div class="em_nav" id="toogle_menu_4_3366">
												<ul class="hnav em_hoz_menu effect-menu">
													<li class="menu-item-link menu-item-depth-0  menu-item-parent">
														<a class="em-menu-link" href=""> <span>Tops</span></a>
														<ul class="menu-container">
															<li class="menu-item-hbox menu-item-depth-1 col-menu menu_col12 grid_12	menu-item-parent">
																<ul class="menu-container" style="padding: 0 10px">
																	<li class="menu-item-vbox menu-item-depth-2 col-sm-6 grid_6 alpha menu-item-parent">
																		<ul class="menu-container">
																			<li class="menu-item-text menu-item-depth-3  ">
																				<div class="em-line-01">
																					<h5 class="text-uppercase">Product Types</h5>
																					<div>
																						<ul class="menu-container">
																							<li class="menu-item-link menu-item-depth-1 first label-hot-menu">
																								<a class="em-menu-link" href="/product/productList.do?subcategory=Blouses">Blouses</a>
																							</li>
																							<li class="menu-item-link menu-item-depth-1">
																								<a class="em-menu-link" href="/product/productList.do?subcategory=Shirts">Shirts</a>
																							</li>
																							<li class="menu-item-link menu-item-depth-1">
																								<a class="em-menu-link" href="/product/productList.do?subcategory=Jackets">Jackets</a>
																							</li>
																						</ul>
																					</div>
																				</div>
																			</li>
																		</ul>
																	</li>
																	<li class="menu-item-vbox menu-item-depth-2 col-sm-18 grid_18 omega menu-item-parent">
																		<ul class="menu-container">
																			<li class="menu-item-text menu-item-depth-3  ">
																				<p class="img-banner-menu pull-right">
																					<img class="img-responsive" src="${pageContext.request.contextPath}/resources/images/product/tops.png" alt="menu_adv" />
																				</p>
																			</li>
																		</ul>
																	</li>
																</ul>
															</li>
															<!-- /.menu-item-hbox -->
														</ul>
													</li>
													<!-- /.menu-item-link -->
													<li class="menu-item-link menu-item-depth-0  menu-item-parent">
														<a class="em-menu-link" href="#"> <span>Bottoms</span></a>
														<ul class="menu-container">
															<li class="menu-item-hbox menu-item-depth-1 col-menu menu_col12 grid_12 menu-item-parent">
																<ul class="menu-container" style="padding: 0 10px">
																	<li class="menu-item-vbox menu-item-depth-2 col-sm-6 grid_6 alpha menu-item-parent">
																		<ul class="menu-container">
																			<li class="menu-item-text menu-item-depth-3  ">
																				<div class="em-line-01">
																					<h5 class="text-uppercase">Product Types</h5>
																					<div>
																						<ul class="menu-container">
																							<li class="menu-item-link menu-item-depth-1 first label-hot-menu">
																								<a class="em-menu-link" href="/product/productList.do?subcategory=Skirts">Skirts</a>
																							</li>
																							<li class="menu-item-link menu-item-depth-1">
																								<a class="em-menu-link" href="/product/productList.do?subcategory=Dresses">Dresses</a>
																							</li>
																							<li class="menu-item-link menu-item-depth-1">
																								<a class="em-menu-link" href="/product/productList.do?subcategory=Pants">Pants</a>
																							</li>
																							<li class="menu-item-link menu-item-depth-1">
																								<a class="em-menu-link" href="/product/productList.do?subcategory=Jeans">Jeans</a>
																							</li>
																							<li class="menu-item-link menu-item-depth-1">
																								<a class="em-menu-link" href="/product/productList.do?subcategory=Shorts">Shorts</a>
																							</li>
																						</ul>
																					</div>
																				</div>
																			</li>
																		</ul>
																	</li>
																	<li class="menu-item-vbox menu-item-depth-2 col-sm-18 grid_18 omega menu-item-parent">
																		<ul class="menu-container">
																			<li class="menu-item-text menu-item-depth-3  ">
																				<p class="img-banner-menu pull-right">
																					<img class="img-responsive" src="${pageContext.request.contextPath}/resources/images/product/bottoms.png" alt="menu_adv" />
																				</p>
																			</li>
																		</ul>
																	</li>
																</ul>
															</li>
															<!-- /.menu-item-hbox -->
														</ul>
													</li>
													<!-- /.menu-item-link -->
													<li class="menu-item-link menu-item-depth-0  menu-item-parent">
														<a class="em-menu-link" href="#"> <span>Bags</span></a>
														<ul class="menu-container">
															<li class="menu-item-hbox menu-item-depth-1 col-menu menu_col12 grid_12 menu-item-parent">
																<ul class="menu-container" style="padding: 0 10px">
																	<li class="menu-item-vbox menu-item-depth-2 col-sm-6 grid_6 alpha menu-item-parent">
																		<ul class="menu-container">
																			<li class="menu-item-text menu-item-depth-3  ">
																				<div class="em-line-01">
																					<h5 class="text-uppercase">Product Types</h5>
																					<div>
																						<ul class="menu-container">
																							<li class="menu-item-link menu-item-depth-1 first label-hot-menu">
																								<a class="em-menu-link" href="/product/productList.do?subcategory=Totes">Totes</a>
																							</li>
																							<li class="menu-item-link menu-item-depth-1">
																								<a class="em-menu-link" href="/product/productList.do?subcategory=Backpacks">Backpacks</a>
																							</li>
																							<li class="menu-item-link menu-item-depth-1">
																								<a class="em-menu-link" href="/product/productList.do?subcategory=Satchels">Satchels</a>
																							</li>
																						</ul>
																					</div>
																				</div>
																			</li>
																		</ul>
																	</li>
																	<li class="menu-item-vbox menu-item-depth-2 col-sm-18 grid_18 omega menu-item-parent">
																		<ul class="menu-container">
																			<li class="menu-item-text menu-item-depth-3  ">
																				<p class="img-banner-menu pull-right">
																					<img class="img-responsive" src="${pageContext.request.contextPath}/resources/images/product/bags.png" alt="menu_adv" />
																				</p>
																			</li>
																		</ul>
																	</li>
																</ul>
															</li>
															<!-- /.menu-item-hbox -->
														</ul>
													</li>
													<!-- /.menu-item-link -->
													<li class="menu-item-link menu-item-depth-0  menu-item-parent">
														<a class="em-menu-link" href="#"> <span>Underwear</span></a>
														<ul class="menu-container">
															<li class="menu-item-hbox menu-item-depth-1 col-menu menu_col12 grid_12 menu-item-parent">
																<ul class="menu-container" style="padding: 0 10px">
																	<li class="menu-item-vbox menu-item-depth-2 col-sm-6 grid_6 alpha menu-item-parent">
																		<ul class="menu-container">
																			<li class="menu-item-text menu-item-depth-3  ">
																				<div class="em-line-01">
																					<h5 class="text-uppercase">Product Types</h5>
																					<div>
																						<ul class="menu-container">
																							<li class="menu-item-link menu-item-depth-1 first label-hot-menu">
																								<a class="em-menu-link" href="/product/productList.do?subcategory=Bras">Bras</a>
																							</li>
																							<li class="menu-item-link menu-item-depth-1">
																								<a class="em-menu-link" href="/product/productList.do?subcategory=Panties">Panties</a>
																							</li>
																							<li class="menu-item-link menu-item-depth-1">
																								<a class="em-menu-link" href="/product/productList.do?subcategory=Pajamas">Pajamas</a>
																							</li>
																						</ul>
																					</div>
																				</div>
																			</li>
																		</ul>
																	</li>
																	<li class="menu-item-vbox menu-item-depth-2 col-sm-18 grid_18 omega menu-item-parent">
																		<ul class="menu-container">
																			<li class="menu-item-text menu-item-depth-3  ">
																				<p class="img-banner-menu pull-right">
																					<img class="img-responsive" src="${pageContext.request.contextPath}/resources/images/product/underwear.png" alt="menu_adv" />
																				</p>
																			</li>
																		</ul>
																	</li>
																</ul>
															</li>
															<!-- /.menu-item-hbox -->
														</ul>
													</li>
													<!-- /.menu-item-link -->
													<li class="menu-item-link menu-item-depth-0 menu-item-parent">
														<a class="em-menu-link" href="#"> <span>Shoes</span></a>
														<ul class="menu-container">
															<li class="menu-item-hbox menu-item-depth-1 col-menu menu_col12 grid_12 menu-item-parent">
																<ul class="menu-container" style="padding: 0 10px">
																	<li class="menu-item-vbox menu-item-depth-2 col-sm-6 grid_6 alpha menu-item-parent">
																		<ul class="menu-container">
																			<li class="menu-item-text menu-item-depth-3  ">
																				<div class="em-line-01">
																					<h5 class="text-uppercase">Product Types</h5>
																					<div>
																						<ul class="menu-container">
																							<li class="menu-item-link menu-item-depth-1 first label-hot-menu">
																								<a class="em-menu-link" href="/product/productList.do?subcategory=Heels">Heels</a>
																							</li>
																							<li class="menu-item-link menu-item-depth-1">
																								<a class="em-menu-link" href="/product/productList.do?subcategory=Sneakers">Sneakers</a>
																							</li>
																							<li class="menu-item-link menu-item-depth-1">
																								<a class="em-menu-link" href="/product/productList.do?subcategory=Flats">Flats</a>
																							</li>
																							<li class="menu-item-link menu-item-depth-1">
																								<a class="em-menu-link" href="/product/productList.do?subcategory=Boots">Boots</a>
																							</li>
																						</ul>
																					</div>
																				</div>
																			</li>
																		</ul>
																	</li>
																	<li class="menu-item-vbox menu-item-depth-2 col-sm-18 grid_18 omega menu-item-parent">
																		<ul class="menu-container">
																			<li class="menu-item-text menu-item-depth-3  ">
																				<p class="img-banner-menu pull-right">
																					<img class="img-responsive" src="${pageContext.request.contextPath}/resources/images/product/shoes.png" alt="menu_adv" />
																				</p>
																			</li>
																		</ul>
																	</li>
																</ul>
															</li>
															<!-- /.menu-item-hbox -->
														</ul>
													</li>
													<!-- /.menu-item-link -->
													<li class="menu-item-link menu-item-depth-0 menu-item-parent">
														<a class="em-menu-link" href="#"><span>Accessories</span></a>
														<ul class="menu-container">
															<li class="menu-item-hbox menu-item-depth-1 col-menu menu_col12 grid_12 menu-item-parent">
																<ul class="menu-container" style="padding: 0 10px">
																	<li class="menu-item-vbox menu-item-depth-2 col-sm-6 grid_6 alpha menu-item-parent">
																		<ul class="menu-container">
																			<li class="menu-item-text menu-item-depth-3  ">
																				<div class="em-line-01">
																					<h5 class="text-uppercase">Product Types</h5>
																					<div>
																						<ul class="menu-container">
																							<li class="menu-item-link menu-item-depth-1 first label-hot-menu">
																								<a class="em-menu-link" href="/product/productList.do?subcategory=Jewelry">Jewelry</a>
																							</li>
																							<li class="menu-item-link menu-item-depth-1">
																								<a class="em-menu-link" href="/product/productList.do?subcategory=Watches">Watches</a>
																							</li>
																							<li class="menu-item-link menu-item-depth-1">
																								<a class="em-menu-link" href="/product/productList.do?subcategory=Hats">Hats</a>
																							</li>
																							<li class="menu-item-link menu-item-depth-1">
																								<a class="em-menu-link" href="/product/productList.do?subcategory=Sunglasses">Sunglasses</a>
																							</li>
																						</ul>
																					</div>
																				</div>
																			</li>
																		</ul>
																	</li>
																	<li class="menu-item-vbox menu-item-depth-2 col-sm-18 grid_18 omega menu-item-parent">
																		<ul class="menu-container">
																			<li class="menu-item-text menu-item-depth-3  ">
																				<p class="img-banner-menu pull-right">
																					<img class="img-responsive" src="${pageContext.request.contextPath}/resources/images/product/accessories.png" alt="menu_adv" />
																				</p>
																			</li>
																		</ul>
																	</li>
																</ul>
															</li>
															<!-- /.menu-item-hbox -->
														</ul>
													</li>
													<!-- /.menu-item-link -->
													<li class="menu-teim-link menu-item-depth-0 menu-item-parent">
														<a class="em-menu-link" href="/pin/pinBoardList.do"><span>PinBoards</span></a>
													</li>
													<li class="menu-teim-link menu-item-depth-0 menu-item-parent">
														<a class="em-menu-link" href="/board/notice.do"><span>C/S</span></a>
													</li>
													 
												</ul>
												<!-- /.hnav -->
											</div>
										</div>
									</div>
								</div>
								<!-- /#em-main-megamenu -->
							</div>
							<!-- /.em-menu-hoz -->
							<div class="em-top-cart em-top-cart-sticky f-right">
								<div
									class="em-wrapper-js-topcart em-wrapper-topcart em-no-quickshop">
									<div class="em-container-topcart">
										<div class="em-summary-topcart">
											<a class="em-amount-js-topcart em-amount-topcart"
												title="Shopping Cart" href="/cart/viewCart.do"> <span 
												class="em-topcart-text">My Cart:</span>
											</a>
										</div>
										<div class="em-container-js-topcart topcart-popup"
											style="display: none">
											<div class="topcart-popup-content">
												<p class="em-block-subtitle">Shopping Cart</p>
												<div class="topcart-content">
													<p class="amount-content ">You have no items in your
														shopping cart.</p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- /.em-wrapper-js-topcart -->
							</div>
							<!-- /.em-top-cart -->
						</div>
						<!-- /.line-top -->
					</div>
				</div>
			</div>
		</div>
		<!-- /.em-header-bottom -->
	</div>
</div>
<!-- /.em-wrapper-header -->