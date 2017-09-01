<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
$(document).ready(function(){
	var mailReg = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/g;
	
	$('#search_password_form').submit(function () {
	
	    var username = $.trim($('#username').val());
	    var email = $.trim($('#email').val());
	    
	    if (username === '') {
	        alert('아이디를 입력하세요.');
	        return false;
	    }
	    else if (email  === '') {
	        alert('이메일을 입력하세요.');
	        return false;
	    }
	    else if ( !mailReg.test(email) ) 
		{
			alert("올바른 메일주소 형식이 아닙니다. 다시 확인해주세요.");
			return false;
		}
	});
});
</script>

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
											<h1>Search Password</h1>
										</div>
									</div>
									<form action="changeTemporaryPassword.do" method="post" id="search_password_form">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
										<div class="col2-set">
											<div class="col-1 registered-users">
												<div class="content">
													<h2>Search Password</h2>
													<ul class="form-list">
														<li><label for="email" class="required"><em>*</em>UserName</label>
															<div class="input-box">
																<input type="text" name="username" value=""
																	id="username"
																	class="input-text required-entry validate-username"
																	title="UserName" />
															</div></li>
														<li><label for="pass" class="required"><em>*</em>Email Address</label>
															<div class="input-box">
																<input type="text" name="email"
																	class="input-text required-entry validate-password"
																	id="email" title="Email Address" />
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
														<span><span>Search Password</span></span>
													</button>
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
