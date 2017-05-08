<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html class='no-js'>
<head>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/commonUser.js"></script>

</head>
<body class="cms-index-index">

	<div class="wrapper">
		<div class="page one-column">




			<!-- <div class="wrapper-breadcrums">
				<div class="container">
					<div class="row">
						<div class="col-sm-24">
							<div class="breadcrumbs">
								<ul>
									<li class="home"><a href="index.html"
										title="Go to Home Page"><span>Home</span></a> <span
										class="separator">/ </span></li>
									<li class="cms_page"><strong>Login</strong></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div> -->
			<!-- /.wrapper-breadcrums -->
			
			

			<div class="em-wrapper-main">
                    <div class="container container-main">
                        <div class="em-inner-main">
                            <div class="em-wrapper-area02"></div>
                            <div class="em-main-container em-col1-layout">
                                <div class="row">
                                    <div class="em-col-main col-sm-24">
                                        <div class="account-create">
                                            <div class="page-title">
                                                <h1>Create an Account</h1>
                                            </div>
                                            <form:form commandName="user" method="post" id="form_validate" name="form_validate" onsubmit="return verifyOK()">
                                                <div class="fieldset">
                                                	<spring:hasBindErrors name="user">
														<font color="red">
															<c:forEach items="${errors.globalErrors}" var="error">
																<spring:message code="${error.code}" />
															</c:forEach>
														</font>
													</spring:hasBindErrors>
                                                    <input type="hidden" name="success_url" value="" />
                                                    <input type="hidden" name="error_url" value="" />
                                                    <h2 class="legend">Login Information</h2>
                                                    <ul class="form-list">
                                                        <li class="fields">
                                                            <div class="customer-name-middlename">
                                                                <div class="field name-username">
                                                                    <label for="username" class="required"><em>*</em>User Name</label>
                                                                    <div class="input-box">
                                                                        <input type="text" id="username" name="username" value="${session_username}" title="UserName" maxlength="20" class="input-text required-entry" readonly/>
                                                                        <font color="red">
                                                                        	<span id="duplicateResult"></span><br>
                                                                        	<form:errors path="username"/>
                                                                        </font>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="field">
                                                                <label for="password" class="required"><em>*</em>Password</label>
                                                                <div class="input-box">
                                                                    <input type="password" name="password" id="password" title="Password" class="input-text required-entry validate-password" />
                                                                	<font color="red"><form:errors path="password"/></font>
                                                                </div>
                                                            </div>
                                                            <div class="field">
                                                                <label for="confirmation" class="required"><em>*</em>Confirm Password</label>
                                                                <div class="input-box">
                                                                    <input type="password" name="confirmation" title="Confirm Password" id="confirmation" class="input-text required-entry validate-cpassword" />
                                                                </div>
                                                            </div>
                                                        </li>
                                                        
                                                        <!-- <li class="control">
                                                            <div class="input-box">
                                                                <input type="checkbox" name="is_subscribed" title="Sign Up for Newsletter" value="1" id="is_subscribed" class="checkbox" />
                                                            </div>
                                                            <label for="is_subscribed">Sign Up for Newsletter</label>
                                                        </li> -->
                                                    </ul>
                                                </div>
                                                <div class="fieldset">
                                                    <h2 class="legend">Personal Information</h2>
                                                    <ul class="form-list">
                                                        <li class="fields">
                                                        	<div class="field name-username">
                                                                <label for="realname" class="required"><em>*</em>Real Name</label>
                                                                <div class="input-box">
                                                                    <input type="text" id="realname" name="realname" value="${session_user.realname}" title="RealName" maxlength="255" class="input-text required-entry" />
                                                                    <font color="red"><form:errors path="realname"/></font>
                                                                </div>
                                                            </div>
                                                            <div class="field name-username">
	                                                            <label for="email" class="required"><em>*</em>Email Address</label>
	                                                            <div class="input-box">
	                                                                <input type="text" name="email" id="email" value="${session_user.email}" title="Email Address" class="input-text validate-email required-entry" />
	                                                                <font color="red"><form:errors path="email"/></font>
	                                                            </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                        <div class="field">
	                                                            <label for="phone" class="required"><em>*</em>Phone</label>
	                                                            <div class="input-box">
	                                                                <input type="text" name="phone" id="phone" title="Phone" value="${session_user.phone}" class="input-text required-entry" maxlength="13" onkeyup="pressKey()"/>
	                                                                <font color="red"><form:errors path="phone"/></font>
	                                                            </div>
                                                            </div>
                                                        </li>
                                                        
                                                    	<li class="fields">
                                                    		<div class="field">
                                                                <label for="postcode" class="required"><em>*</em>Postcode</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <input type="button" onclick="execDaumPostcode()" value="Find Postcode" class="button">
                                                                <div class="input-box">
                                                                    <input type="text" name="postcode" value="${session_user.postcode}" onclick="execDaumPostcode()" title="Confirm postcode" id="postcode" class="input-text required-entry" readonly/>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    	<li class="fields">
                                                            <div class="field">
                                                                <label for="addr1" class="required"><em>*</em>Addr1</label>
                                                                <div class="input-box">
                                                                    <input type="text" name="addr1" id="addr1" value="${session_user.addr1}" onclick="execDaumPostcode()" title="addr1" class="input-text required-entry" readonly />
                                                                </div>
                                                            </div>
                                                            <div class="field">
                                                                <label for="addr2" class="required"><em>*</em>Addr2</label>
                                                                <div class="input-box">
                                                                    <input type="text" name="addr2" id="addr2" value="${session_user.addr2}" title="addr2" class="input-text required-entry" />
                                                                    <font color="red"><form:errors path="addr2"/></font>
                                                                </div>
                                                            </div>
                                                    	</li>
                                                    </ul>
                                                    <div id="window-overlay" class="window-overlay" style="display:none;"></div>
                                                    <!-- <div id="remember-me-popup" class="remember-me-popup" style="display:none;">
                                                        <div class="remember-me-popup-head">
                                                            <h3>What's this?</h3> <a href="#" class="remember-me-popup-close" title="Close">Close</a>
                                                        </div>
                                                        <div class="remember-me-popup-body">
                                                            <p>Checking &quot;Remember Me&quot; will let you access your shopping cart on this computer when you are logged out</p>
                                                            <div class="remember-me-popup-close-button a-right"> <a href="#" class="remember-me-popup-close button" title="Close"><span>Close</span></a>
                                                            </div>
                                                        </div>
                                                    </div> -->
                                                    <div class="buttons-set">
                                                        <p class="back-link"><a href="login.html" class="back-link"><small>&laquo; </small>Back</a>
                                                        </p>
                                                        <button type="submit" title="Submit" class="button"><span><span>Submit</span></span>
                                                        </button>
                                                        <p class="required">* Required Fields</p>
                                                    </div>
                                                </div>
                                            </form:form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- /.em-wrapper-main -->




			

		</div>
		<!-- /.page -->

	</div>
	<!-- /.wrapper -->

</body>
</html>