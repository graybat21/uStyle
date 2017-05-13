<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class='no-js' lang='ko'>
<head>
<script type="text/javascript">
	function deleteCheck() {
		if (confirm("삭제 하시겠습니까?")) {
			document.getElementById('delete_form').submit();
		} else {
			alert("삭제 취소 되었습니다.");
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
												<h2>비밀번호를 입력하세요.</h2>
												<input type="password" id="password" name="password"> <input
													type="button" value="탈퇴" onclick="deleteCheck()">
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