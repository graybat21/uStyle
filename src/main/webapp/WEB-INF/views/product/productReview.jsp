<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html class='no-js' lang='ko'>
<head>
<script>
function writeReviewSuccess(productid){
	alert('리뷰가 작성되었습니다.');
	location.href= "/product/productDetail.do?productid=" + productid;
}
</script>
</head>
<body class="cms-index-index" onload="writeReviewSuccess(${productid})">
	<div class="wrapper">
		<div class="page one-column">
		</div>
		<!-- /.page -->
	</div>
	<!-- /.wrapper -->
</body>
</html>