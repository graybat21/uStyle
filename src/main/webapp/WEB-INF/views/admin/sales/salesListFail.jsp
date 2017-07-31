<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class='no-js' lang='ko'>
<head>
<script>
function salesListFail() {
	alert("잘못된 접근입니다.");
	location.href = "/admin/salesList.do";
}
</script>
</head>
<body class="cms-index-index" onload="salesListFail()">
	<div class="wrapper">
		<div class="page one-column">
		</div>
		<!-- /.page -->
	</div>
	<!-- /.wrapper -->
</body>
</html>