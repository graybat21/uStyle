<%@ page pageEncoding="UTF-8"%>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/include/include-header.jspf" %>
<div class="em-wrapper-header">
	<div id="em-mheader" class="visible-xs container">
		<div id="em-mheader-top" class="row">

			<!-- in mobile, left 4/24 - logo -->
			<div id="em-mheader-logo" class="col-xs-4">
				<div class="em-logo">
					<a href="#" title="Furniture Commerce" class="logo"><strong>Furniture
							Commerce</strong><img src="images/logo_small.png" alt="Furniture Commerce" /></a>
				</div>
			</div>

			<!-- in mobile, 20/24 - menu(search, shopping cart, more menu) -->
			<div class="col-xs-20">
				<div class="em-top-search">
					<div class="em-header-search-mobile">
						<form id="search_mini_form_mobile" method="get">
							<div class="form-search no_cate_search">
								<div class="text-search">
									<input id="search-mobile" type="text" name="q" value=""
										class="input-text" maxlength="128"
										placeholder="Search entire store here..." />
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
									class="em-amount-topcart" href="#"> <span
									class="em-topcart-text">My Cart:</span> <span
									class="em-topcart-qty">0</span>
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
										<li class="first col-xs-8"><a title="Log In"
											class="login-link fa fa-user" href="login.do"><span>Log
													In</span></a></li>
										<!-- <li class="first col-xs-8"><a title="Log Out"
														class="logout-link fa fa-user" href="#"><span>Log
																Out</span></a></li>
													 -->
										<li class="col-xs-8"><a title="Sign up"
											class='signup-link fa fa-sign-out' href="register.do"><span>Sign
													up</span></a></li>
										<li class="last col-xs-8"><a href="#"
											class="checkout-link fa fa-shopping-cart"><span>Cart</span></a>
										</li>
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
									<li><a href="/"><span class="fa fa-home">&nbsp;</span>Home
									</a></li>
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
													<li
														class="menu-item-link menu-item-depth-0 dd-menu-link fa fa-bars menu-item-parent">
														<a class="em-menu-link" href="#"> <span>
																Category </span>
													</a>
														<ul class="menu-container">
															<li class="menu-item-text menu-item-depth-1  ">
																<ul class="em-catalog-navigation vertical">
																	<li class="level0 nav-1 first parent"><a href="#">
																			<span>Women Tops</span>
																	</a>
																		<ul class="level0">
																			<li class="level1 nav-1-1 first"><a href="#">
																					<span>Blouses</span>
																			</a></li>
																			<li class="level1 nav-1-2"><a href="#"> <span>Tops</span>
																			</a></li>
																			<li class="level1 nav-1-3 last"><a href="#">
																					<span>Jackets</span>
																			</a></li>
																		</ul></li>
																	<!-- /.menu-item-vbox -->
																	<li class="level0 nav-2 parent"><a href="#"> <span>Women
																				Bottoms</span>
																	</a>
																		<ul class="level0">
																			<li class="level1 nav-2-1 first"><a href="#">
																					<span>Skirts</span>
																			</a></li>
																			<li class="level1 nav-2-2 parent"><a href="#">
																					<span>Pants</span>
																			</a>
																				<ul class="level1">
																					<li class="level2 nav-2-2-1 first"><a href="#">
																							<span>Jeans</span>
																					</a></li>
																					<li class="level2 nav-2-2-2 last"><a href="#">
																							<span>Cottons</span>
																					</a></li>
																				</ul></li>
																			<li class="level1 nav-2-3 last"><a href="#">
																					<span>Shorts</span>
																			</a></li>



																		</ul></li>
																	<!-- /.menu-item-vbox -->
																	<li class="level0 nav-3 parent"><a href="#"> <span>Women
																				Bags</span>
																	</a>
																		<ul class="level0">
																			<li class="level1 nav-3-1 first"><a href="#">
																					<span>Totes</span>
																			</a></li>
																			<li class="level1 nav-3-2"><a href="#"> <span>Backpacks</span>
																			</a></li>
																			<li class="level1 nav-3-3 last"><a href="#">
																					<span>Satchels</span>
																			</a></li>
																		</ul></li>
																	<!-- /.menu-item-vbox -->
																	<li class="level0 nav-4 parent"><a href="#"> <span>Underwear</span>
																	</a>
																		<ul class="level0">
																			<li class="level1 nav-4-1 first"><a href="#">
																					<span>Bras</span>
																			</a></li>
																			<li class="level1 nav-4-2"><a href="#"> <span>Panties</span>
																			</a></li>
																			<li class="level1 nav-4-3 last"><a href="#">
																					<span>Pajamas</span>
																			</a></li>
																		</ul></li>
																	<!-- /.menu-item-vbox -->
																	<li class="level0 nav-5 parent"><a href="#"> <span>Shoes</span>
																	</a>
																		<ul class="level0">
																			<li class="level1 nav-5-1 first"><a href="#">
																					<span>Heels</span>
																			</a></li>
																			<li class="level1 nav-5-2"><a href="#"> <span>Sneakers</span>
																			</a></li>
																			<li class="level1 nav-5-3"><a href="#"> <span>Flats</span>
																			</a></li>
																			<li class="level1 nav-5-4"><a href="#"> <span>Loafers</span>
																			</a></li>
																			<li class="level1 nav-5-5 last"><a href="#">
																					<span>Boots</span>
																			</a></li>
																		</ul></li>

																	<!-- /.menu-item-vbox -->
																	<li class="level0 nav-6 parent last"><a href="#">
																			<span>Accessories</span>
																	</a>
																		<ul class="level0">
																			<li class="level1 nav-6-1 first"><a href="#">
																					<span>Jewelry</span>
																			</a></li>
																			<li class="level1 nav-6-2"><a href="#"> <span>Watches</span>
																			</a></li>
																			<li class="level1 nav-6-3"><a href="#"> <span>Hats</span>
																			</a></li>
																			<li class="level1 nav-6-4 last"><a href="#">
																					<span>Sunglasses</span>
																			</a></li>
																		</ul></li>
																</ul>
															</li>
														</ul>
													</li>
													<!-- /.menu-item-link -->
													<li
														class="menu-item-link menu-item-depth-0 dd-menu-link fa fa-bars menu-item-parent">
														<a class="em-menu-link" href="#"> <span> Brands
														</span>
													</a>
														<ul class="menu-container">
															<li class="menu-item-text menu-item-depth-1  ">
																<ul class="em-catalog-navigation vertical">
																	<li class="level0 nav-1 first parent"><a href="#">
																			<span>A ~ G</span>
																	</a>
																		<ul class="level0">
																			<li class="level1 nav-1-1 first"><a href="#">
																					<span>Blouses</span>
																			</a></li>
																			<li class="level1 nav-1-2"><a href="#"> <span>Tops</span>
																			</a></li>
																			<li class="level1 nav-1-3 last"><a href="#">
																					<span>Jackets</span>
																			</a></li>
																		</ul></li>
																	<!-- /.menu-item-vbox -->
																	<li class="level0 nav-2 parent"><a href="#"> <span>H
																				~ P</span>
																	</a>
																		<ul class="level0">
																			<li class="level1 nav-2-1 first"><a href="#">
																					<span>Skirts</span>
																			</a></li>
																			<li class="level1 nav-2-2"><a href="#"> <span>Pants</span>
																			</a></li>
																			<li class="level1 nav-2-3 last"><a href="#">
																					<span>Shorts</span>
																			</a></li>



																		</ul></li>


																	<!-- /.menu-item-vbox -->
																	<li class="level0 nav-3 parent last"><a href="#">
																			<span>Q ~ Z</span>
																	</a>
																		<ul class="level0">
																			<li class="level1 nav-3-1 first"><a href="#">
																					<span>Jewelry</span>
																			</a></li>
																			<li class="level1 nav-3-2"><a href="#"> <span>Watches</span>
																			</a></li>
																			<li class="level1 nav-3-3"><a href="#"> <span>Hats</span>
																			</a></li>
																			<li class="level1 nav-3-4 last"><a href="#">
																					<span>Sunglasses</span>
																			</a></li>
																		</ul></li>
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
										<li class="first last"><a href="wishlist.do"
											title="Wishlist">Wishlist</a></li>
									</ul>
								</div>
								
								<!-- 로그인전 -->
								<c:if test="${session_username == null }">
								<ul class="list-inline f-right">
									<li><a class="em-register-link" href="register.do"
										title="Register">Register</a></li>
								</ul>

								<!-- header login -->
								<div id="em-login-link"
									class="account-link f-right em-non-login">
									<a href="login.do" class="link-account" id="link-login"
										title="Login">Login</a>
									<div class="em-account" id="em-account-login-form"
										style="display: none;">
										<form method="post" id="top-login-form">
											<input name="form_key" type="hidden" value="iMzNKKno559ogiTe" />
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
															<a href="#">Forgot Your Password?</a>
														</p>
														<p>
															<span>Don't have an account?</span><a
																class="create-account-link-wishlist" href="#"
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
								
								<!-- 로그인후 -->
								<c:if test="${session_username != null }">
								<ul class="list-inline f-right">
									<li><a class="em-register-link" href="register.do"
										title="point">${session_point } point</a></li>
								</ul>
								<div id="em-login-link"
									class="account-link f-right em-non-login">
									<a href="logout.do" class="link-account" id="link-login"
										title="Logout">${session_username }님</a>
									<div class="em-account" id="em-account-login-form"
										style="display: none;">
										<form method="post" id="top-login-form">
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
				<div class="row">

					<div class="col-sm-6">
						<!-- <p class="em-phone">
										<i class="fa fa-fw">ï</i><span>012345678xxx</span>
									</p> -->
					</div>

					<!-- ë¡ê³  -->
					<div class="col-sm-12 text-center">
						<div class="em-logo">
							<a href="#" title="uStyle" class="logo"><strong>uStyle</strong><img
								class="retina-img" src="images/logo.png" alt="uStyle" /></a>
						</div>
					</div>

					<!-- ì¼íì¹´í¸ -->
					<div class="col-sm-6">
						<div class="em-top-cart f-right">
							<div
								class="em-wrapper-js-topcart em-wrapper-topcart em-no-quickshop">
								<div class="em-container-topcart">
									<div class="em-summary-topcart">
										<a class="em-amount-js-topcart em-amount-topcart"
											title="Shopping Cart" href="cart.do"> <span
											class="em-topcart-text">My Cart:</span> <span
											class="em-topcart-qty">0</span>
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
								<a href="#" title="Furniture Commerce" class="logo"><img
									src="images/logo_small.png" alt="Furniture Commerce" /> </a>
							</div>
							<div class="em-menu-hoz">
								<div id="em-main-megamenu">
									<div class="em-menu">
										<div class="megamenu-wrapper wrapper-4_3366">
											<div class="em_nav" id="toogle_menu_4_3366">
												<ul class="hnav em_hoz_menu effect-menu">
													<li
														class="menu-item-link menu-item-depth-0  menu-item-parent">
														<a class="em-menu-link" href=""> <span> Tops </span>
													</a>
														<ul class="menu-container">
															<li
																class="menu-item-hbox menu-item-depth-1 col-menu menu_col24 grid_24 menu-item-parent"
																style="">
																<ul class="menu-container" style="padding: 0 10px">
																	<li
																		class="menu-item-vbox menu-item-depth-2 col-sm-6 grid_6 alpha menu-item-parent"
																		style="">
																		<ul class="menu-container">
																			<li class="menu-item-text menu-item-depth-3  ">
																				<div class="em-line-01">
																					<h5 class="text-uppercase">Product Types</h5>
																					<div>
																						<ul class="menu-container">
																							<li
																								class="menu-item-link menu-item-depth-1 first label-hot-menu"><a
																								class="em-menu-link" href="product-simple.do">Simple
																									product</a></li>
																							<li class="menu-item-link menu-item-depth-1"><a
																								class="em-menu-link" href="product-virtual.html">Virtual
																									Product</a></li>
																							<li class="menu-item-link menu-item-depth-1"><a
																								class="em-menu-link"
																								href="product-downloadable.html">Downloadable
																									Product</a></li>
																							<li class="menu-item-link menu-item-depth-1"><a
																								class="em-menu-link"
																								href="product-configurable.html">Configurable
																									Product</a></li>
																							<li class="menu-item-link menu-item-depth-1"><a
																								class="em-menu-link" href="product-grouped.html">Grouped
																									Product</a></li>
																							<li class="menu-item-link menu-item-depth-1 last"><a
																								class="em-menu-link" href="product-bundle.html">Bundle
																									Product</a></li>
																						</ul>
																					</div>
																				</div>
																			</li>
																		</ul>
																	</li>
																	<!-- <li
																					class="menu-item-vbox menu-item-depth-2 col-sm-6 grid_6  menu-item-parent"
																					style="">
																					<ul class="menu-container">
																						<li class="menu-item-text menu-item-depth-3  ">
																							<div class="em-line-01">
																								<h5 class="text-uppercase">PRODUCT COLUMNS</h5>
																								<div>
																									<ul class="menu-container">
																										<li
																											class="menu-item-link menu-item-depth-1 first"><a
																											class="em-menu-link"
																											href="product-1-column.html">1 Column</a></li>
																										<li class="menu-item-link menu-item-depth-1 "><a
																											class="em-menu-link"
																											href="product-2-columns-left.html">2
																												Columns Left</a></li>
																										<li class="menu-item-link menu-item-depth-1 "><a
																											class="em-menu-link"
																											href="product-2-columns-right.html">2
																												Columns Right</a></li>
																										<li class="menu-item-link menu-item-depth-1 "><a
																											class="em-menu-link"
																											href="product-3-columns.html">3 Columns</a></li>
																										<li class="menu-item-link menu-item-depth-1 "><a
																											class="em-menu-link"
																											href="product-upsell.html">Upsell</a></li>
																										<li
																											class="menu-item-link menu-item-depth-1 last"><a
																											class="em-menu-link"
																											href="product-related.html">Related
																												Product</a></li>
																									</ul>
																								</div>
																							</div>
																						</li>
																					</ul>
																				</li> -->
																	<li
																		class="menu-item-vbox menu-item-depth-2 col-sm-18 grid_18 omega menu-item-parent"
																		style="">
																		<ul class="menu-container">
																			<li class="menu-item-text menu-item-depth-3  ">
																				<p class="img-banner-menu pull-right">
																					<img class="img-responsive"
																						src="http://placehold.it/560x374" alt="menu_adv" />
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
													<li
														class="menu-item-link menu-item-depth-0  menu-item-parent">
														<a class="em-menu-link" href="#"> <span>
																Bottoms </span>
													</a>
														<ul class="menu-container">
															<li
																class="menu-item-hbox menu-item-depth-1 col-menu menu_col24 grid_24 menu-item-parent"
																style="">
																<ul class="menu-container" style="padding: 0 10px">
																	<li
																		class="menu-item-vbox menu-item-depth-2 col-sm-6 grid_6 alpha menu-item-parent"
																		style="">
																		<ul class="menu-container">
																			<li class="menu-item-text menu-item-depth-3  ">
																				<div class="em-line-01">
																					<h5 class="text-uppercase">Product Types</h5>
																					<div>
																						<ul class="menu-container">
																							<li
																								class="menu-item-link menu-item-depth-1 first label-hot-menu"><a
																								class="em-menu-link" href="product-simple.html">Simple
																									product</a></li>
																							<li class="menu-item-link menu-item-depth-1"><a
																								class="em-menu-link" href="product-virtual.html">Virtual
																									Product</a></li>
																							<li class="menu-item-link menu-item-depth-1"><a
																								class="em-menu-link"
																								href="product-downloadable.html">Downloadable
																									Product</a></li>
																							<li class="menu-item-link menu-item-depth-1"><a
																								class="em-menu-link"
																								href="product-configurable.html">Configurable
																									Product</a></li>
																							<li class="menu-item-link menu-item-depth-1"><a
																								class="em-menu-link" href="product-grouped.html">Grouped
																									Product</a></li>
																							<li class="menu-item-link menu-item-depth-1 last"><a
																								class="em-menu-link" href="product-bundle.html">Bundle
																									Product</a></li>
																						</ul>
																					</div>
																				</div>
																			</li>
																		</ul>
																	</li>
																	<!-- <li
																					class="menu-item-vbox menu-item-depth-2 col-sm-6 grid_6  menu-item-parent"
																					style="">
																					<ul class="menu-container">
																						<li class="menu-item-text menu-item-depth-3  ">
																							<div class="em-line-01">
																								<h5 class="text-uppercase">PRODUCT COLUMNS</h5>
																								<div>
																									<ul class="menu-container">
																										<li
																											class="menu-item-link menu-item-depth-1 first"><a
																											class="em-menu-link"
																											href="product-1-column.html">1 Column</a></li>
																										<li class="menu-item-link menu-item-depth-1 "><a
																											class="em-menu-link"
																											href="product-2-columns-left.html">2
																												Columns Left</a></li>
																										<li class="menu-item-link menu-item-depth-1 "><a
																											class="em-menu-link"
																											href="product-2-columns-right.html">2
																												Columns Right</a></li>
																										<li class="menu-item-link menu-item-depth-1 "><a
																											class="em-menu-link"
																											href="product-3-columns.html">3 Columns</a></li>
																										<li class="menu-item-link menu-item-depth-1 "><a
																											class="em-menu-link"
																											href="product-upsell.html">Upsell</a></li>
																										<li
																											class="menu-item-link menu-item-depth-1 last"><a
																											class="em-menu-link"
																											href="product-related.html">Related
																												Product</a></li>
																									</ul>
																								</div>
																							</div>
																						</li>
																					</ul>
																				</li> -->
																	<li
																		class="menu-item-vbox menu-item-depth-2 col-sm-18 grid_18 omega menu-item-parent"
																		style="">
																		<ul class="menu-container">
																			<li class="menu-item-text menu-item-depth-3  ">
																				<p class="img-banner-menu pull-right">
																					<img class="img-responsive"
																						src="http://placehold.it/560x374" alt="menu_adv" />
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
													<li
														class="menu-item-link menu-item-depth-0  menu-item-parent">
														<a class="em-menu-link" href="#"> <span> Bags </span>
													</a>
														<ul class="menu-container">
															<li
																class="menu-item-hbox menu-item-depth-1 col-menu menu_col24 grid_24 menu-item-parent"
																style="">
																<ul class="menu-container" style="padding: 0 10px">
																	<li
																		class="menu-item-vbox menu-item-depth-2 col-sm-6 grid_6 alpha menu-item-parent"
																		style="">
																		<ul class="menu-container">
																			<li class="menu-item-text menu-item-depth-3  ">
																				<div class="em-line-01">
																					<h5 class="text-uppercase">Product Types</h5>
																					<div>
																						<ul class="menu-container">
																							<li
																								class="menu-item-link menu-item-depth-1 first label-hot-menu"><a
																								class="em-menu-link" href="product-simple.html">Simple
																									product</a></li>
																							<li class="menu-item-link menu-item-depth-1"><a
																								class="em-menu-link" href="product-virtual.html">Virtual
																									Product</a></li>
																							<li class="menu-item-link menu-item-depth-1"><a
																								class="em-menu-link"
																								href="product-downloadable.html">Downloadable
																									Product</a></li>
																							<li class="menu-item-link menu-item-depth-1"><a
																								class="em-menu-link"
																								href="product-configurable.html">Configurable
																									Product</a></li>
																							<li class="menu-item-link menu-item-depth-1"><a
																								class="em-menu-link" href="product-grouped.html">Grouped
																									Product</a></li>
																							<li class="menu-item-link menu-item-depth-1 last"><a
																								class="em-menu-link" href="product-bundle.html">Bundle
																									Product</a></li>
																						</ul>
																					</div>
																				</div>
																			</li>
																		</ul>
																	</li>
																	<!-- <li
																					class="menu-item-vbox menu-item-depth-2 col-sm-6 grid_6  menu-item-parent"
																					style="">
																					<ul class="menu-container">
																						<li class="menu-item-text menu-item-depth-3  ">
																							<div class="em-line-01">
																								<h5 class="text-uppercase">PRODUCT COLUMNS</h5>
																								<div>
																									<ul class="menu-container">
																										<li
																											class="menu-item-link menu-item-depth-1 first"><a
																											class="em-menu-link"
																											href="product-1-column.html">1 Column</a></li>
																										<li class="menu-item-link menu-item-depth-1 "><a
																											class="em-menu-link"
																											href="product-2-columns-left.html">2
																												Columns Left</a></li>
																										<li class="menu-item-link menu-item-depth-1 "><a
																											class="em-menu-link"
																											href="product-2-columns-right.html">2
																												Columns Right</a></li>
																										<li class="menu-item-link menu-item-depth-1 "><a
																											class="em-menu-link"
																											href="product-3-columns.html">3 Columns</a></li>
																										<li class="menu-item-link menu-item-depth-1 "><a
																											class="em-menu-link"
																											href="product-upsell.html">Upsell</a></li>
																										<li
																											class="menu-item-link menu-item-depth-1 last"><a
																											class="em-menu-link"
																											href="product-related.html">Related
																												Product</a></li>
																									</ul>
																								</div>
																							</div>
																						</li>
																					</ul>
																				</li> -->
																	<li
																		class="menu-item-vbox menu-item-depth-2 col-sm-18 grid_18 omega menu-item-parent"
																		style="">
																		<ul class="menu-container">
																			<li class="menu-item-text menu-item-depth-3  ">
																				<p class="img-banner-menu pull-right">
																					<img class="img-responsive"
																						src="http://placehold.it/560x374" alt="menu_adv" />
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
													<li
														class="menu-item-link menu-item-depth-0  menu-item-parent">
														<a class="em-menu-link" href="#"> <span> Shoes
														</span>
													</a>
														<ul class="menu-container">
															<li
																class="menu-item-hbox menu-item-depth-1 col-menu menu_col24 grid_24 menu-item-parent"
																style="">
																<ul class="menu-container" style="padding: 0 10px">
																	<li
																		class="menu-item-vbox menu-item-depth-2 col-sm-6 grid_6 alpha menu-item-parent"
																		style="">
																		<ul class="menu-container">
																			<li class="menu-item-text menu-item-depth-3  ">
																				<div class="em-line-01">
																					<h5 class="text-uppercase">Product Types</h5>
																					<div>
																						<ul class="menu-container">
																							<li
																								class="menu-item-link menu-item-depth-1 first label-hot-menu"><a
																								class="em-menu-link" href="product-simple.html">Simple
																									product</a></li>
																							<li class="menu-item-link menu-item-depth-1"><a
																								class="em-menu-link" href="product-virtual.html">Virtual
																									Product</a></li>
																							<li class="menu-item-link menu-item-depth-1"><a
																								class="em-menu-link"
																								href="product-downloadable.html">Downloadable
																									Product</a></li>
																							<li class="menu-item-link menu-item-depth-1"><a
																								class="em-menu-link"
																								href="product-configurable.html">Configurable
																									Product</a></li>
																							<li class="menu-item-link menu-item-depth-1"><a
																								class="em-menu-link" href="product-grouped.html">Grouped
																									Product</a></li>
																							<li class="menu-item-link menu-item-depth-1 last"><a
																								class="em-menu-link" href="product-bundle.html">Bundle
																									Product</a></li>
																						</ul>
																					</div>
																				</div>
																			</li>
																		</ul>
																	</li>
																	<!-- <li
																					class="menu-item-vbox menu-item-depth-2 col-sm-6 grid_6  menu-item-parent"
																					style="">
																					<ul class="menu-container">
																						<li class="menu-item-text menu-item-depth-3  ">
																							<div class="em-line-01">
																								<h5 class="text-uppercase">PRODUCT COLUMNS</h5>
																								<div>
																									<ul class="menu-container">
																										<li
																											class="menu-item-link menu-item-depth-1 first"><a
																											class="em-menu-link"
																											href="product-1-column.html">1 Column</a></li>
																										<li class="menu-item-link menu-item-depth-1 "><a
																											class="em-menu-link"
																											href="product-2-columns-left.html">2
																												Columns Left</a></li>
																										<li class="menu-item-link menu-item-depth-1 "><a
																											class="em-menu-link"
																											href="product-2-columns-right.html">2
																												Columns Right</a></li>
																										<li class="menu-item-link menu-item-depth-1 "><a
																											class="em-menu-link"
																											href="product-3-columns.html">3 Columns</a></li>
																										<li class="menu-item-link menu-item-depth-1 "><a
																											class="em-menu-link"
																											href="product-upsell.html">Upsell</a></li>
																										<li
																											class="menu-item-link menu-item-depth-1 last"><a
																											class="em-menu-link"
																											href="product-related.html">Related
																												Product</a></li>
																									</ul>
																								</div>
																							</div>
																						</li>
																					</ul>
																				</li> -->
																	<li
																		class="menu-item-vbox menu-item-depth-2 col-sm-18 grid_18 omega menu-item-parent"
																		style="">
																		<ul class="menu-container">
																			<li class="menu-item-text menu-item-depth-3  ">
																				<p class="img-banner-menu pull-right">
																					<img class="img-responsive"
																						src="http://placehold.it/560x374" alt="menu_adv" />
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
													<li
														class="menu-item-link menu-item-depth-0 hidden-sm hidden-md menu-item-parent">
														<a class="em-menu-link" href="#"> <span>
																Accessories </span>
													</a>
														<ul class="menu-container">
															<li
																class="menu-item-hbox menu-item-depth-1 col-menu menu_col24 grid_24 menu-item-parent"
																style="">
																<ul class="menu-container" style="padding: 0 10px">
																	<li
																		class="menu-item-vbox menu-item-depth-2 col-sm-6 grid_6 alpha menu-item-parent"
																		style="">
																		<ul class="menu-container">
																			<li class="menu-item-text menu-item-depth-3  ">
																				<div class="em-line-01">
																					<h5 class="text-uppercase">Product Types</h5>
																					<div>
																						<ul class="menu-container">
																							<li
																								class="menu-item-link menu-item-depth-1 first label-hot-menu"><a
																								class="em-menu-link" href="product-simple.html">Simple
																									product</a></li>
																							<li class="menu-item-link menu-item-depth-1"><a
																								class="em-menu-link" href="product-virtual.html">Virtual
																									Product</a></li>
																							<li class="menu-item-link menu-item-depth-1"><a
																								class="em-menu-link"
																								href="product-downloadable.html">Downloadable
																									Product</a></li>
																							<li class="menu-item-link menu-item-depth-1"><a
																								class="em-menu-link"
																								href="product-configurable.html">Configurable
																									Product</a></li>
																							<li class="menu-item-link menu-item-depth-1"><a
																								class="em-menu-link" href="product-grouped.html">Grouped
																									Product</a></li>
																							<li class="menu-item-link menu-item-depth-1 last"><a
																								class="em-menu-link" href="product-bundle.html">Bundle
																									Product</a></li>
																						</ul>
																					</div>
																				</div>
																			</li>
																		</ul>
																	</li>
																	<!-- <li
																					class="menu-item-vbox menu-item-depth-2 col-sm-6 grid_6  menu-item-parent"
																					style="">
																					<ul class="menu-container">
																						<li class="menu-item-text menu-item-depth-3  ">
																							<div class="em-line-01">
																								<h5 class="text-uppercase">PRODUCT COLUMNS</h5>
																								<div>
																									<ul class="menu-container">
																										<li
																											class="menu-item-link menu-item-depth-1 first"><a
																											class="em-menu-link"
																											href="product-1-column.html">1 Column</a></li>
																										<li class="menu-item-link menu-item-depth-1 "><a
																											class="em-menu-link"
																											href="product-2-columns-left.html">2
																												Columns Left</a></li>
																										<li class="menu-item-link menu-item-depth-1 "><a
																											class="em-menu-link"
																											href="product-2-columns-right.html">2
																												Columns Right</a></li>
																										<li class="menu-item-link menu-item-depth-1 "><a
																											class="em-menu-link"
																											href="product-3-columns.html">3 Columns</a></li>
																										<li class="menu-item-link menu-item-depth-1 "><a
																											class="em-menu-link"
																											href="product-upsell.html">Upsell</a></li>
																										<li
																											class="menu-item-link menu-item-depth-1 last"><a
																											class="em-menu-link"
																											href="product-related.html">Related
																												Product</a></li>
																									</ul>
																								</div>
																							</div>
																						</li>
																					</ul>
																				</li> -->
																	<li
																		class="menu-item-vbox menu-item-depth-2 col-sm-18 grid_18 omega menu-item-parent"
																		style="">
																		<ul class="menu-container">
																			<li class="menu-item-text menu-item-depth-3  ">
																				<p class="img-banner-menu pull-right">
																					<img class="img-responsive"
																						src="http://placehold.it/560x374" alt="menu_adv" />
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
													<!-- <li
																	class="menu-item-link menu-item-depth-0  menu-item-parent">
																	<a class="em-menu-link" href="#"> <span>
																			Shoes </span>
																</a> -->
													<!-- <ul class="menu-container"
																		style="background-image: url(images/menu/bkg-menu.jpg); background-repeat: no-repeat; background-position: right bottom">
																		<li
																			class="menu-item-hbox menu-item-depth-1 col-menu menu_col24 grid_24 menu-item-parent"
																			style="">
																			<ul class="menu-container" style="padding: 0 10px">
																				<li
																					class="menu-item-vbox menu-item-depth-2 col-sm-8 menu-item-parent"
																					style="">
																					<ul class="menu-container">
																						<li class="menu-item-text menu-item-depth-3  ">
																							<p class="img-center">
																								<a href="#" title="em-sample-title"><img
																									class="img-responsive"
																									src="images/menu/em_menu11.png"
																									alt="em-sample-alt" /> </a>
																							</p>
																							<p>This theme looks great not only on
																								desktops but also on devices. What means that
																								there are no special requirements for your
																								clients to browse your website. With EM Oswad,
																								you can easily change the overall appearance of
																								your site by editing your siteâs layout, themes,
																								colors, and fonts. Make your webstore look
																								special! You can create as many custom color
																								schemes as you need and easily apply to your
																								webstore</p>
																							<p>EM Oswad is optimized for all screen
																								resolutions. If you resize web browser window,
																								theme elements will be transformed smoothly on
																								each breakpoint (from 320 to 1280 pixels) in
																								order to adapt to the current screen size.</p>
																						</li>
																					</ul>
																				</li>
																				<li
																					class="menu-item-vbox menu-item-depth-2 col-sm-4 menu-item-parent"
																					style="">
																					<ul class="menu-container">
																						<li class="menu-item-text menu-item-depth-3  ">
																							<div class="em-line-01">
																								<h5 class="text-uppercase">Unlimited Colors</h5>
																								<div>
																									<ul class="em-catalog-navigation ">
																										<li class="level0 nav-1 first"><a
																											href="#"> <span>Build Your Own</span>
																										</a></li>
																										<li class="level0 nav-2"><a href="#">
																												<span>Laptops</span>
																										</a></li>
																										<li class="level0 nav-3"><a href="#">
																												<span>Hard Drives</span>
																										</a></li>
																										<li class="level0 nav-4"><a href="#">
																												<span>Monitors</span>
																										</a></li>
																										<li class="level0 nav-5"><a href="#">
																												<span>RAM / Memory</span>
																										</a></li>
																										<li class="level0 nav-6"><a href="#">
																												<span>Cases</span>
																										</a></li>
																										<li class="level0 nav-7"><a href="#">
																												<span>Processors</span>
																										</a></li>
																										<li class="level0 nav-8 last"><a href="#">
																												<span>Peripherals</span>
																										</a></li>
																									</ul>
																								</div>
																							</div>
																						</li>
																					</ul>
																				</li>
																				<li
																					class="menu-item-vbox menu-item-depth-2 col-sm-4 menu-item-parent"
																					style="">
																					<ul class="menu-container">
																						<li class="menu-item-text menu-item-depth-3  ">
																							<div class="em-line-01">
																								<h5 class="text-uppercase">Custom widgets</h5>
																								<div>
																									<ul class="em-catalog-navigation ">
																										<li class="level0 nav-1 first"><a
																											href="#"> <span>Build Your Own</span>
																										</a></li>
																										<li class="level0 nav-2"><a href="#">
																												<span>Laptops</span>
																										</a></li>
																										<li class="level0 nav-3"><a href="#">
																												<span>Hard Drives</span>
																										</a></li>
																										<li class="level0 nav-4"><a href="#">
																												<span>Monitors</span>
																										</a></li>
																										<li class="level0 nav-5"><a href="#">
																												<span>RAM / Memory</span>
																										</a></li>
																										<li class="level0 nav-6"><a href="#">
																												<span>Cases</span>
																										</a></li>
																										<li class="level0 nav-7"><a href="#">
																												<span>Processors</span>
																										</a></li>
																										<li class="level0 nav-8 last"><a href="#">
																												<span>Peripherals</span>
																										</a></li>
																									</ul>
																								</div>
																							</div>
																						</li>
																					</ul>
																				</li>
																				<li
																					class="menu-item-vbox menu-item-depth-2 col-sm-4 menu-item-parent"
																					style="">
																					<ul class="menu-container">
																						<li class="menu-item-text menu-item-depth-3  ">
																							<div class="em-line-01">
																								<h5 class="text-uppercase">Powerful admin</h5>
																								<div>
																									<ul class="em-catalog-navigation ">
																										<li class="level0 nav-1 first"><a
																											href="#"> <span>Build Your Own</span>
																										</a></li>
																										<li class="level0 nav-2"><a href="#">
																												<span>Laptops</span>
																										</a></li>
																										<li class="level0 nav-3"><a href="#">
																												<span>Hard Drives</span>
																										</a></li>
																										<li class="level0 nav-4"><a href="#">
																												<span>Monitors</span>
																										</a></li>
																										<li class="level0 nav-5"><a href="#">
																												<span>RAM / Memory</span>
																										</a></li>
																										<li class="level0 nav-6"><a href="#">
																												<span>Cases</span>
																										</a></li>
																										<li class="level0 nav-7"><a href="#">
																												<span>Processors</span>
																										</a></li>
																										<li class="level0 nav-8 last"><a href="#">
																												<span>Peripherals</span>
																										</a></li>
																									</ul>
																								</div>
																							</div>
																						</li>
																					</ul>
																				</li>
																			</ul>
																		</li>
																		/.menu-item-hbox
																	</ul> 
																</li>-->
													<!-- /.menu-item-link -->
													<li
														class="menu-item-link menu-item-depth-0  menu-item-parent">
														<a class="em-menu-link" href="blog.html"> <span>
																Brands </span>
													</a>
														<ul class="menu-container"
															style="background-image: url(images/menu/banner-menu01.jpg); background-repeat: no-repeat; background-position: right bottom">
															<li
																class="menu-item-hbox menu-item-depth-1 col-menu menu_col24 grid_24 menu-item-parent"
																style="">
																<ul class="menu-container" style="padding: 0 10px">
																	<li
																		class="menu-item-vbox menu-item-depth-2 col-sm-4 grid_4 alpha menu-item-parent"
																		style="">
																		<ul class="menu-container">
																			<li class="menu-item-text menu-item-depth-3  ">
																				<div class="em-line-01">
																					<h5 class="text-uppercase">A ~ G</h5>
																					<div>
																						<ul class="em-catalog-navigation ">
																							<li class="level0 nav-1 first"><a href="#">
																									<span>Build Your Own</span>
																							</a></li>
																							<li class="level0 nav-2"><a href="#"> <span>Laptops</span>
																							</a></li>
																							<li class="level0 nav-3"><a href="#"> <span>Hard
																										Drives</span>
																							</a></li>
																							<li class="level0 nav-4"><a href="#"> <span>Monitors</span>
																							</a></li>
																							<li class="level0 nav-5"><a href="#"> <span>RAM
																										/ Memory</span>
																							</a></li>
																							<li class="level0 nav-6"><a href="#"> <span>Cases</span>
																							</a></li>
																							<li class="level0 nav-7"><a href="#"> <span>Processors</span>
																							</a></li>
																							<li class="level0 nav-8 last"><a href="#">
																									<span>Peripherals</span>
																							</a></li>
																						</ul>
																					</div>
																				</div>
																			</li>
																		</ul>
																	</li>
																	<li
																		class="menu-item-vbox menu-item-depth-2 col-sm-4 grid_4 menu-item-parent"
																		style="">
																		<ul class="menu-container">
																			<li class="menu-item-text menu-item-depth-3  ">
																				<div class="em-line-01">
																					<h5 class="text-uppercase">H ~ P</h5>
																					<div>
																						<ul class="em-catalog-navigation vertical">
																							<li class="level0 nav-1 first"><a href="#">
																									<span>Build Your Own</span>
																							</a></li>
																							<li class="level0 nav-2"><a href="#"> <span>Laptops</span>
																							</a></li>
																							<li class="level0 nav-3"><a href="#"> <span>Hard
																										Drives</span>
																							</a></li>
																							<li class="level0 nav-4"><a href="#"> <span>Monitors</span>
																							</a></li>
																							<li class="level0 nav-5"><a href="#"> <span>RAM
																										/ Memory</span>
																							</a></li>
																							<li class="level0 nav-6"><a href="#"> <span>Cases</span>
																							</a></li>
																							<li class="level0 nav-7"><a href="#"> <span>Processors</span>
																							</a></li>
																							<li class="level0 nav-8 last"><a href="#">
																									<span>Peripherals</span>
																							</a></li>
																						</ul>
																					</div>
																				</div>
																			</li>
																		</ul>
																	</li>
																	<li
																		class="menu-item-vbox menu-item-depth-2 col-sm-4 grid_4 menu-item-parent"
																		style="">
																		<ul class="menu-container">
																			<li class="menu-item-text menu-item-depth-3  ">
																				<div class="em-line-01">
																					<h5 class="text-uppercase">Q ~ Z</h5>
																					<div>
																						<ul class="em-catalog-navigation ">
																							<li class="level0 nav-1 first"><a href="#">
																									<span>Build Your Own</span>
																							</a></li>
																							<li class="level0 nav-2"><a href="#"> <span>Laptops</span>
																							</a></li>
																							<li class="level0 nav-3"><a href="#"> <span>Hard
																										Drives</span>
																							</a></li>
																							<li class="level0 nav-4"><a href="#"> <span>Monitors</span>
																							</a></li>
																							<li class="level0 nav-5"><a href="#"> <span>RAM
																										/ Memory</span>
																							</a></li>
																							<li class="level0 nav-6"><a href="#"> <span>Cases</span>
																							</a></li>
																							<li class="level0 nav-7"><a href="#"> <span>Processors</span>
																							</a></li>
																							<li class="level0 nav-8 last"><a href="#">
																									<span>Peripherals</span>
																							</a></li>
																						</ul>
																					</div>
																				</div>
																			</li>
																		</ul>
																	</li>
																	<!-- <li
																					class="menu-item-vbox menu-item-depth-2 col-sm-4 grid_4 omega menu-item-parent"
																					style="">
																					<ul class="menu-container">
																						<li class="menu-item-text menu-item-depth-3  ">
																							<div class="em-line-01">
																								<h5 class="text-uppercase">Custom widgets</h5>
																								<div>
																									<ul class="em-catalog-navigation ">
																										<li class="level0 nav-1 first"><a
																											href="#"> <span>Build Your Own</span>
																										</a></li>
																										<li class="level0 nav-2"><a href="#">
																												<span>Laptops</span>
																										</a></li>
																										<li class="level0 nav-3"><a href="#">
																												<span>Hard Drives</span>
																										</a></li>
																										<li class="level0 nav-4"><a href="#">
																												<span>Monitors</span>
																										</a></li>
																										<li class="level0 nav-5"><a href="#">
																												<span>RAM / Memory</span>
																										</a></li>
																										<li class="level0 nav-6"><a href="#">
																												<span>Cases</span>
																										</a></li>
																										<li class="level0 nav-7"><a href="#">
																												<span>Processors</span>
																										</a></li>
																										<li class="level0 nav-8 last"><a href="#">
																												<span>Peripherals</span>
																										</a></li>
																									</ul>
																								</div>
																							</div>
																						</li>
																					</ul>
																				</li> -->
																	<li class="menu-item-vbox menu-item-depth-2 col-sm-24 "
																		style=""></li>
																</ul>
															</li>
															<!-- /.menu-item-hbox -->
														</ul>
													</li>
													<!-- /.menu-item-link -->
												</ul>
												<!-- /.hnav -->
											</div>
										</div>
									</div>
								</div>
								<!-- /#em-main-megamenu -->
							</div>
							<!-- /.em-menu-hoz -->
							<div class="em-search">
								<div class="em-top-search">
									<div class="em-wrapper-js-search em-search-style01">
										<div class="em-wrapper-search em-no-category-search">
											<a class="em-search-icon" title="Search"
												href="javascript:void(0);"><span>Search</span></a>
											<div class="em-container-js-search" style="display: none;">
												<form id="search_mini_form" method="get">
													<div class="form-search no_cate_search">
														<div class="text-search">
															<label for="search">Search:</label> <input id="search"
																type="text" name="q" value="" class="input-text"
																maxlength="128"
																placeholder="Search entire store here..." />
															<button type="submit" title="Search" class="button">
																<span><span>Search</span></span>
															</button>
														</div>
													</div>
												</form>
												<!-- /#search_mini_form -->
											</div>
										</div>
									</div>
								</div>
								<!-- /.em-top-search -->
							</div>
							<!-- /.em-search -->
							<div class="em-search em-search-sticky f-right">
								<div class="em-top-search">
									<div class="em-wrapper-js-search em-search-style01">
										<div class="em-wrapper-search">
											<a class="em-search-icon" title="Search"
												href="javascript:void(0);"><span>Search</span></a>
											<div class="em-container-js-search" style="display: none;">
												<form id="search_mini_form_fixed_top" method="get">
													<div class="form-search">
														<label for="search">Search:</label> <input
															id="search-fixed-top" type="text" name="q" value=""
															class="input-text" maxlength="128"
															placeholder="Search entire store here..." />
														<button type="submit" title="Search" class="button">
															<span><span>Search</span></span>
														</button>
													</div>
												</form>
											</div>
										</div>
									</div>
									<!-- /.em-wrapper-js-search -->
								</div>
							</div>
							<!-- /.em-search-sticky -->
							<div class="em-top-cart em-top-cart-sticky f-right">
								<div
									class="em-wrapper-js-topcart em-wrapper-topcart em-no-quickshop">
									<div class="em-container-topcart">
										<div class="em-summary-topcart">
											<a class="em-amount-js-topcart em-amount-topcart"
												title="Shopping Cart" href="cart.do"> <span
												class="em-topcart-text">My Cart:</span> <span
												class="em-topcart-qty">0</span>
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