<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="wrapper">
	<!-- 스크립트 비활성화할 경우에 나오는 부분 -->
	
	<div class="page one-column">

		<div class="em-wrapper-main">
			<div class="container container-main">
				<div class="em-inner-main">
					<div class="em-wrapper-area02"></div>
					<div class="em-main-container em-col1-layout">
						<div class="row">
							<div class="em-col-main col-sm-24">
								<div class="account-login">
									<div class="page-title em-box-02">
										<div class="title-box">
											<h1>Login or Create an Account</h1>
										</div>
									</div>
									<form action="/loginPost.do" method="post" id="login-form">
										<input name="form_key" type="hidden" value="W2ZAZqxDCT2TpZYs" />
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
										<div class="col2-set">
											<div class="col-1 new-users">
												<div class="content">
													<h2>New Customers</h2>
													<p>By creating an account with our store, you will be
														able to move through the checkout process faster, store
														multiple shipping addresses, view and track your orders
														in your account and more.</p>
												</div>
												<div class="buttons-set">
													<button type="button" title="Create an Account"
														class="button" onclick="location.href='register.do'">
														<span><span>Create an Account</span></span>
													</button>
												</div>
											</div>
											<div class="col-2 registered-users">
												<div class="content">
													<h2>Registered Customers</h2>
													<p>If you have an account with us, please log in.</p>
													<ul class="form-list">
														<li><label for="email" class="required"><em>*</em>UserName</label>
															<div class="input-box">
																<input type="text" name="username" value=""
																	id="username"
																	class="input-text required-entry validate-username"
																	title="UserName" />
															</div></li>
														<li><label for="pass" class="required"><em>*</em>Password</label>
															<div class="input-box">
																<input type="password" name="password"
																	class="input-text required-entry validate-password"
																	id="pass" title="Password" />
															</div></li>
													</ul>
													<div id="window-overlay" class="window-overlay"
														style="display: none;"></div>
													<div id="remember-me-popup" class="remember-me-popup"
														style="display: none;">
														<div class="remember-me-popup-head">
															<h3>What's this?</h3>
															<a href="#" class="remember-me-popup-close"
																title="Close">Close</a>
														</div>
														<div class="remember-me-popup-body">
															<p>Checking &quot;Remember Me&quot; will let you
																access your shopping cart on this computer when you are
																logged out</p>
															<div class="remember-me-popup-close-button a-right">
																<a href="#" class="remember-me-popup-close button"
																	title="Close"><span>Close</span></a>
															</div>
														</div>
													</div>
												</div>
												<div class="buttons-set">
													<button type="submit" class="button" title="Login"
														name="send" id="send2">
														<span><span>Login</span></span>
													</button>
													<a href="searchPassword.do" class="f-left">Forgot Your Password?</a>
													<p class="required">* Required Fields</p>
												</div>
											</div>
										</div>
									</form>
								</div>
								<!-- /.account-login -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.em-wrapper-main -->
	</div>
	<!-- /.page -->
</div>
<!-- /.wrapper -->
