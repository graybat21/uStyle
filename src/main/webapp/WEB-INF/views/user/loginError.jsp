<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html class='no-js' lang='ko'>
<head>
<script>
function noMatch(){
	alert('아이디와 패스워드를 다시 확인하세요.');
	location.href="/login.do";
}
</script>
</head>
<<<<<<< HEAD
<script>
function noMatch()
{
	alert('아이디와 패스워드를 다시 확인하세요.');
	location.href= '/login.do';
}
</script>
<body class="cms-index-index" onload="noMatch()">
=======
<body class="cms-index-index" onload="noMatch();">
>>>>>>> bcb00023a6095f265165ca080d383198256be356
	<div class="wrapper">
		<div class="page one-column">
		
		
		<h1>로그인 실패</h1>
		
		
		
		</div>
		<!-- /.page -->
	</div>
	<!-- /.wrapper -->
</body>
</html>