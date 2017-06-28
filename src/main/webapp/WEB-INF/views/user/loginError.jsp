<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html class='no-js' lang='ko'>
<head>
<script>
function noMatch(){
	alert('아이디와 패스워드를 다시 확인하세요.');
	location.href= "/login.do";
}
</script>
</head>
<body class="cms-index-index" onload="noMatch()">
	<div class="wrapper">
		<div class="page one-column">
		</div>
		<!-- /.page -->
	</div>
	<!-- /.wrapper -->
</body>
</html>