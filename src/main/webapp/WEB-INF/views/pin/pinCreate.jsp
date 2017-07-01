<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html class='no-js' lang='ko'>
<head>
<script>
function aa(){
	
test.submit();
}
</script>
</head>
<body class="cms-index-index">
	<div class="wrapper">
		<div class="page one-column">
		
		
		<h1>pinBoard 만들기</h1>
		<form action="createPinBoard.do" name="test" method="post">
		<input name="form_key" type="hidden" value="W2ZAZqxDCT2TpZYs" />
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="text" name="pinboardname">
		</form>
		
		<a href="javascript:aa();">입력</a>
		
		
		
		</div>
		<!-- /.page -->
	</div>
	<!-- /.wrapper -->
</body>
</html>