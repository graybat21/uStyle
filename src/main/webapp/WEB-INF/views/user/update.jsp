<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/commonUser.js"></script>
<div class="wrapper">
	<div class="page one-column">
		<div class="em-wrapper-main">
			<div class="container container-main">
			     <div class="em-inner-main">
			         <div class="em-wrapper-area02"></div>
			         <div class="em-main-container em-col1-layout">
			             <div class="row">
			             	<div class="col-sm-18 col-sm-push-6 em-col-main">
			                     <div class="account-create">
			                         <div class="page-title">
			                             <h1>Update an Account</h1>
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
											                    <input type="text" id="username" name="username" value="${session_user.username}" title="UserName" maxlength="20" class="input-text required-entry" readonly/>
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
		                    <%@ include file="/WEB-INF/views/include/sidemenu.jspf" %>
		                </div>
		            </div>
		        </div>
	    	</div>
		</div><!-- /.em-wrapper-main -->
	</div>
	<!-- /.page -->
</div>
<!-- /.wrapper -->
