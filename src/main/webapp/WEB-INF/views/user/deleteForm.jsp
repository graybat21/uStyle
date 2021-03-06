<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class='no-js' lang='ko'>
<head>
<script type="text/javascript">
	function deleteCheck() {
		if (confirm("탈퇴하시겠습니까? 탈퇴하면 이 사이트에 있는 모든 내용이 삭제됩니다.")) {
			document.getElementById('delete_form').submit();
		} else {
			alert("탈퇴 취소되었습니다.");
			return false;
		}
	}
</script>
</head>
<body class="cms-index-index">
	<div class="wrapper">
		<div class="page one-column">
			<div class="em-wrapper-main">
                    <div class="container container-main">
                        <div class="em-inner-main">
                            <div class="em-wrapper-area02"></div>
                            <div class="em-wrapper-area03"></div>
                            <div class="em-wrapper-area04"></div>
                            <div class="em-main-container em-col2-left-layout">
                                <div class="row">
                                
                                	<!-- 본문내용 -->
                                    <div class="col-sm-18 col-sm-push-6 em-col-main">
                                        <div class="page-title category-title">
                                            <h1>회원 탈퇴</h1>
                                        </div>
                                        
                                        <div class="category-products">
                                            <form method="post" id="delete_form" name="delete_form">
                                            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
												<h2>비밀번호를 입력하세요.</h2>
												<input type="hidden" id="username" name="username" value="${session_user.username}"> 
												<input type="password" id="password" name="password" onkeypress="if (event.keyCode == 13) {return false;}"> 
												<input type="button" value="탈퇴" onclick="deleteCheck()">
											</form>
                                        </div><!-- /.category-products -->
                                    </div><!-- /.em-col-main -->
                                    
                                    <%@ include file="/WEB-INF/views/include/sidemenu.jspf" %>
                                    
                                </div>
                            </div><!-- /.em-main-container -->
                        </div>
                    </div>
                </div><!-- /.em-wrapper-main -->
			






		</div>
		<!-- /.page -->
	</div>
	<!-- /.wrapper -->
</body>
</html>