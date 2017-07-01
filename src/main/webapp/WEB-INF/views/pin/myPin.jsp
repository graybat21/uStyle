<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html class='no-js' lang='ko'>
<head>
</head>
<body class="cms-index-index">
	<div class="wrapper">
		<div class="page one-column">
		
		
		<h1>pinBoard list</h1>
		
		<c:forEach var="pinBoard" items="${pinBoardList }">
			<%-- <c:url name="modify" value="modifyPinBoardName.do">
				<c:param name="pinboardno" value="${pinBoard.pinboardno }"></c:param>
			</c:url>
			<a href="${modify}"> --%>${pinBoard.username } / ${pinBoard.pinboardname }</a>
			<br>
		</c:forEach>
		
		
		</div>
		<!-- /.page -->
	</div>
	<!-- /.wrapper -->
</body>
</html>