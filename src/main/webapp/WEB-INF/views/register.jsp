<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
<script>
	function pressKey() {
		var _val = document.getElementById('phone').value.trim();
		document.getElementById('phone').value = autoHypenPhone(_val);
	}
    function autoHypenPhone(str){
        str = str.replace(/[^0-9]/g, '');
        var tmp = '';
        if( str.length < 4){
            return str;
        }else if(str.length < 7){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3);
            return tmp;
        }else if(str.length < 11){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 3);
            tmp += '-';
            tmp += str.substr(6);
            return tmp;
        }else{              
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
<script>
/*function checkPwd()
{
	  var f1 = document.forms[0];
	  var pw1 = password.value;
	  var pw2 = confirmation.value;
	  alert(f1);
	  if ( pw1 != pw2 )
	  {
		document.getElementById('checkPwd').style.color = "red";
		document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요."; 
		password.value = "";
		confirmation.value = "";
	  }
	  else
	  {
	   document.getElementById('checkPwd').style.color = "black";
	   document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다."; 
	   
	  }
}*/
function verifynotify(field1, field2, result_id, match_html, nomatch_html) 
{
  this.field1 = field1;
  this.field2 = field2;
  this.result_id = result_id;
  this.match_html = match_html;
  this.nomatch_html = nomatch_html;

  this.check = function() {
    // Make sure we don't cause an error
    // for browsers that do not support getElementById
    if (!this.result_id) { return false; }
    if (!document.getElementById){ return false; }
    r = document.getElementById(this.result_id);
    if (!r){ return false; }

    if (this.field1.value != "" && this.field1.value == this.field2.value) {
      r.innerHTML = this.match_html;
    } else {
      r.innerHTML = this.nomatch_html;
    }
  }
}

function verifyInput() 
{
	verify = new verifynotify();
	verify.field1 = document.form_validate.password;
	verify.field2 = document.form_validate.confirmation;
	verify.result_id = "password_result";
	verify.match_html = "<span style=\"color:blue\">패스워드가 일치합니다!<\/span>";
	verify.nomatch_html = "<span style=\"color:red\">귀하의 비밀번호가 일치하는지 확인하십시오!<\/span>";
	
	// Update the result message
	verify.check();
}

function addLoadEvent(func) 
{
	var oldonload = window.onload;
	if (typeof window.onload != 'function') {
	  window.onload = func;
	} else {
	  window.onload = function() {
	    if (oldonload) {
	      oldonload();
	    }
	    func();
	  }
	}
}

addLoadEvent(function() {
  verifyInput();
});

function verifyOK()
{
	var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;		
	var pwReg = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/g;
	var mailReg = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/g;

	if ( document.form_validate.password.value != document.form_validate.confirmation.value )
	{
		alert("비밀번호와 비밀번호 확인이 서로 일치하지 않습니다. 다시 확인해주세요.");
		return false;	
	}
	else if ( !idReg.test(document.form_validate.username.value) ) 
	{
		alert("아이디는 영문 소문자로 시작하는 6~20자의 영문자 또는 숫자이어야 합니다.");
		return false;
	}
	else if ( $("#duplicateResult").text() != '사용 가능한 아이디입니다.' && $("#duplicateResult").text() != '') 
	{
		alert("이미 해당 아이디로 가입된 회원이 있습니다. 다른 아이디를 입력해주세요.");
		return false;
	}
	else if ( !pwReg.test(document.form_validate.password.value) ) 
	{
		alert("패스워드는 6~20자의 영문 대소문자, 숫자, 특수문자로 이루어져야 하며, 최소 한개의 숫자 혹은 특수문자가 포함되어야 합니다.");
		return false;
	}
	else if ( !mailReg.test(document.form_validate.email.value) ) 
	{
		alert("올바른 메일주소 형식이 아닙니다. 다시 확인해주세요.");
		return false;
	}
	else
		return true;
}

function isExistUser()
{
	var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;	
	
	$("#username").keyup(function() {
		  $.ajax({
		    url : "/duplicationCheck.do",
		    type : "post",
		    contentType : 'application/json; charset=utf-8',
		    //data : JSON.stringify({ username : $("#username").val() }),
		    data : $("#username").val(),
		    //dataType: "json",
		    success : function(data) {
		      if (data) {
		      	$("#duplicateResult").text("이미 해당 아이디로 가입된 회원이 있습니다. 다른 아이디를 입력해주세요."); 
		      } else {
		        if ($("#username").val().length < 6) {
		        $("#duplicateResult").text("아이디를 6자 이상 입력해주세요."); 
		        } else if (!idReg.test($("#username").val())) {
		        	$("#duplicateResult").text("아이디 형식이 올바르지 않습니다."); 
		        }
		        else {
		        	$("#duplicateResult").text("사용 가능한 아이디입니다."); 
		        }
		      }
		    },
		    error : function(error) {
		      alert(error.statusText);  
		    }
		  });

		  return false;
		});
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
                                                                        <input type="text" id="username" name="username" value="${user.username}" title="UserName" maxlength="20" class="input-text required-entry" onkeyup="isExistUser()"/>
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
                                                                    <input type="text" id="realname" name="realname" value="${user.realname}"title="RealName" maxlength="255" class="input-text required-entry" />
                                                                    <font color="red"><form:errors path="realname"/></font>
                                                                </div>
                                                            </div>
                                                            <div class="field name-username">
	                                                            <label for="email" class="required"><em>*</em>Email Address</label>
	                                                            <div class="input-box">
	                                                                <input type="text" name="email" id="email" value="${user.email}" title="Email Address" class="input-text validate-email required-entry" />
	                                                                <font color="red"><form:errors path="email"/></font>
	                                                            </div>
                                                            </div>
                                                        </li>
                                                        <li class="fields">
                                                        <div class="field">
	                                                            <label for="phone" class="required"><em>*</em>Phone</label>
	                                                            <div class="input-box">
	                                                                <input type="text" name="phone" id="phone" title="Phone" value="${user.phone}" class="input-text required-entry" maxlength="13" onkeyup="pressKey()"/>
	                                                                <font color="red"><form:errors path="phone"/></font>
	                                                            </div>
                                                            </div>
                                                        </li>
                                                        
                                                    	<li class="fields">
                                                    		<div class="field">
                                                                <label for="postcode" class="required"><em>*</em>Postcode</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <input type="button" onclick="execDaumPostcode()" value="Find Postcode" class="button">
                                                                <div class="input-box">
                                                                    <input type="text" name="postcode" value="${user.postcode}" onclick="execDaumPostcode()" title="Confirm postcode" id="postcode" class="input-text required-entry" readonly/>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    	<li class="fields">
                                                            <div class="field">
                                                                <label for="addr1" class="required"><em>*</em>Addr1</label>
                                                                <div class="input-box">
                                                                    <input type="text" name="addr1" id="addr1" value="${user.addr1}" onclick="execDaumPostcode()" title="addr1" class="input-text required-entry" readonly />
                                                                </div>
                                                            </div>
                                                            <div class="field">
                                                                <label for="addr2" class="required"><em>*</em>Addr2</label>
                                                                <div class="input-box">
                                                                    <input type="text" name="addr2" id="addr2" value="${user.addr2}" title="addr2" class="input-text required-entry" />
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
                                                
                                                <%--div class="fieldset">
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
                                                </div--%>
                                            </form:form>
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