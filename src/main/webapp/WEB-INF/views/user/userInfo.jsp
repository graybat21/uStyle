<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			                             <h1>Your Information</h1>
			                         </div>
										<div class="fieldset">
										    <h2 class="legend">Personal Information</h2>
										    <ul class="form-list">
										        <li class="fields">
										        	<div class="field name-username">
										                <label for="realname" class="required">Real Name</label>
										                <div class="input-box">
										                    <input type="text" id="realname" name="realname" value="${userMap.realname}" title="RealName" maxlength="255" class="input-text required-entry" readonly />
										            </div>
										        </div>
										        <div class="field name-username">
										         <label for="email" class="required">Email Address</label>
										         <div class="input-box">
										             <input type="text" name="email" id="email" value="${userMap.email}" title="Email Address" class="input-text validate-email required-entry" readonly />
										         </div>
										        </div>
										    </li>
										    <li class="fields">
										    	<div class="field">
											         <label for="phone" class="required">Phone</label>
											         <div class="input-box">
											             <input type="text" name="phone" id="phone" title="Phone" value="${userMap.phone}" class="input-text required-entry" readonly maxlength="13"/>
											         </div>
										        </div>
										        <div class="field">
											         <label for="grade" class="required">Grade</label>
											         <div class="input-box">
											             <input type="text" name="grade" id="grade" title="Phone" value="${userMap.grade}" class="input-text required-entry" readonly />
											         </div>
										        </div>
										    </li>
										    
											<li class="fields">
												<div class="field">
										            <label for="postcode" class="required"><em>*</em>Postcode</label>
										            <div class="input-box">
										                <input type="text" name="postcode" value="${userMap.postcode}" onclick="execDaumPostcode()" title="Confirm postcode" id="postcode" class="input-text required-entry" readonly readonly/>
										            </div>
										        </div>
										    </li>
											<li class="fields">
										        <div class="field">
										            <label for="addr1" class="required">Addr1</label>
										            <div class="input-box">
										                <input type="text" name="addr1" id="addr1" value="${userMap.addr1}" onclick="execDaumPostcode()" title="addr1" class="input-text required-entry" readonly />
										            </div>
										        </div>
										        <div class="field">
										            <label for="addr2" class="required">Addr2</label>
										            <div class="input-box">
										                <input type="text" name="addr2" id="addr2" value="${userMap.addr2}" title="addr2" class="input-text required-entry" readonly />
										            </div>
										        </div>
											</li>
										</ul>
               						</div>
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
