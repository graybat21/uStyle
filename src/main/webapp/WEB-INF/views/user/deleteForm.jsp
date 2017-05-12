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

			<form method="post" id="delete_form" name="delete_form">
				<h2>비밀번호를 입력하세요.</h2>
				<input type="password" id="password" name="password"> <input
					type="button" value="탈퇴" onclick="deleteCheck()">
			</form>







		</div>
		<!-- /.page -->
	</div>
	<!-- /.wrapper -->
</body>
</html>