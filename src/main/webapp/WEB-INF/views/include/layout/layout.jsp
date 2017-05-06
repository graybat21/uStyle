<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<title>uStyle</title>
</head>
<body>
	<div id="header">
		<tiles:insertAttribute name="header"/><!-- // header -->
	</div>
	 	
	<!-- container --> 
	<div id="container" style="min-height:500px;">
		<tiles:insertAttribute name="body"/><!-- // container -->
	</div>
	<!-- footer --> 
	<tiles:insertAttribute name="footer"/><!-- // footer -->

</body>
</html>