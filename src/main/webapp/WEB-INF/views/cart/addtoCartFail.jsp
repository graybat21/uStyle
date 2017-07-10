<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class='no-js' lang='ko'>
<head>
<script>
function addtoCartFail() {
	alert("장바구니에 담을 수 있는 상품은 최대 10개입니다.\n장바구니에 있는 다른 상품을 뺀 후, 상품을 다시 넣어주세요.");
	location.href = "/cart/viewCart.do";
}
</script>
</head>
<body class="cms-index-index" onload="addtoCartFail()">
	<div class="wrapper">
		<div class="page one-column">
		</div>
		<!-- /.page -->
	</div>
	<!-- /.wrapper -->
</body>
</html>