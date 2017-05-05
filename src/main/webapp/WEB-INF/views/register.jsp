<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html class='no-js'>
<head>
<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addr2').focus();
            }
        }).open();
    }
</script>
<!-- 핸드폰번호 입력 관련 -->
<script>
	function pressKey() {
		var _val = document.getElementById('phone').value.trim();
		document.getElementById('phone').value = autoHypenPhone(_val);
	}
	function autoHypenPhone(str) {
		str = str.replace(/[^0-9]/g, '');
		var tmp = '';
		if (str.length < 4) {
			return str;
		} else if (str.length < 7) {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3);
			return tmp;
		} else if (str.length < 11) {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3, 3);
			tmp += '-';
			tmp += str.substr(6);
			return tmp;
		} else {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3, 4);
			tmp += '-';
			tmp += str.substr(7);
			return tmp;
		}
		return str;
	}
</script>

</head>
<body class="cms-index-index">

	<div class="wrapper">

		<div class="page one-column">

			<%@ include file="/WEB-INF/views/include/header.jsp" %>



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
                                            <form method="post" id="form-validate">
                                                <div class="fieldset">
                                                    <input type="hidden" name="success_url" value="" />
                                                    <input type="hidden" name="error_url" value="" />
                                                    <h2 class="legend">Login Information</h2>
                                                    <ul class="form-list">
                                                        <li class="fields">
                                                            <div class="customer-name-middlename">
                                                                <div class="field name-username">
                                                                    <label for="username" class="required"><em>*</em>User Name</label>
                                                                    <div class="input-box">
                                                                        <input type="text" id="username" name="username" title="UserName" maxlength="255" class="input-text required-entry" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                            <div class="field">
                                                                <label for="password" class="required"><em>*</em>Password</label>
                                                                <div class="input-box">
                                                                    <input type="password" name="password" id="password" title="Password" class="input-text required-entry validate-password" />
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
                                                                    <input type="text" id="realname" name="realname" title="RealName" maxlength="255" class="input-text required-entry" />
                                                                </div>
                                                            </div>
                                                            <div class="field name-username">
	                                                            <label for="email" class="required"><em>*</em>Email Address</label>
	                                                            <div class="input-box">
	                                                                <input type="text" name="email" id="email" value="" title="Email Address" class="input-text validate-email required-entry" />
	                                                            </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                        <div class="field">
	                                                            <label for="phone" class="required"><em>*</em>Phone</label>
	                                                            <div class="input-box">
	                                                                <input type="text" name="phone" id="phone" title="Phone" class="input-text required-entry" maxlength="13" onkeyup="pressKey()"/>
	                                                            </div>
                                                            </div>
                                                        </li>
                                                        
                                                    	<li class="fields">
                                                    		<div class="field">
                                                                <label for="postcode" class="required"><em>*</em>Postcode</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <input type="button" onclick="execDaumPostcode()" value="Find Postcode" class="button">
                                                                <div class="input-box">
                                                                    <input type="text" name="postcode" onclick="execDaumPostcode()" title="Confirm postcode" id="postcode" class="input-text required-entry" readonly/>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    	<li class="fields">
                                                            <div class="field">
                                                                <label for="addr1" class="required"><em>*</em>Addr1</label>
                                                                <div class="input-box">
                                                                    <input type="text" name="addr1" id="addr1" onclick="execDaumPostcode()" title="addr1" class="input-text required-entry" readonly />
                                                                </div>
                                                            </div>
                                                            <div class="field">
                                                                <label for="addr2" class="required"><em>*</em>Addr2</label>
                                                                <div class="input-box">
                                                                    <input type="text" name="addr2" id="addr2" title="addr2" class="input-text required-entry" />
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
                                                
                                                <!-- <div class="fieldset">
												    <p>
														<form:label path="address.zipcode">우편번호</form:label>
														<form:input path="address.zipcode" id="zip" disabled="true"/>
														<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
														<font color="red"><form:errors path="address.zipcode"/></font>
													</p>
													<p>
														<form:label path="address.address1">주소1</form:label>
														<form:input path="address.address1" id="addr1"/>
														<font color="red"><form:errors path="address.address1"/></font>
													</p>
													<p>
														<form:label path="address.address2">주소2</form:label>
														<form:input path="address.address2" id="addr2"/>
														<font color="red"><form:errors path="address.address2"/></font>
													</p>
                                                </div> -->
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- /.em-wrapper-main -->



			<%@ include file="/WEB-INF/views/include/footer.jspf"%>

			

		</div>
		<!-- /.page -->

	</div>
	<!-- /.wrapper -->

</body>
</html>