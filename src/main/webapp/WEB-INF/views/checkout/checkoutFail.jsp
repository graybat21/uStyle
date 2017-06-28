<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class='no-js' lang='ko'>
<head>
<script>
function checkoutFail(outofStockProductname, outofStockColor, outofStockSize, maxStock) {
	var stockMsg = "";
	
	if ( maxStock > 0 )
		stockMsg = "이 상품은 최대 " + maxStock + "개까지 구매 가능합니다.";
	else
		stockMsg = "이 상품은 현재 구매가 불가능합니다.";
	
	alert("장바구니에 있는 아래 상품이 현재 재고수량보다 많습니다.\n"
			+ outofStockProductname + " / " + outofStockColor + " / " + outofStockSize + "\n"
			+ stockMsg);
	
	location.href = "/cart/viewCart.do";
}
</script>
</head>
<body class="cms-index-index" onload="checkoutFail('${outofStockProductname}', '${outofStockColor}', '${outofStockSize}', ${maxStock})">
	<div class="wrapper">
		<div class="page one-column">
		</div>
		<!-- /.page -->
	</div>
	<!-- /.wrapper -->
</body>
</html>