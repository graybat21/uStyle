<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html class='no-js' lang='ko'>
<head>
<style>
.col-md-6 {
	text-align: center;
}

img {
	width: 150px;
	height: 150px;
}
</style>
</head>
<body class="cms-index-index">

	<div class="page-header">
		<div class="container col-md-24" style="padding: 100px;">
			<h1>PinBoard list</h1>
			<a href="createPinBoard.do">
				<div class="well col-md-6" style="height: 350px;">+</div>
			</a>

			<c:forEach var="pinBoard" items="${pinBoardList }">
				<a href="viewPin.do?pinboardno=${pinBoard.pinboardno }">
					<div class="well col-md-6" style="height: 350px;">
						<c:forEach var="image" items="${imageList }">
							<c:if test="${image.pinboardno eq pinBoard.pinboardno }">
								<img src="${image.mainpictureurl }" />
							</c:if>
						</c:forEach>

					</div>
				</a> 	
			</c:forEach>
		</div>
	</div>

	<%-- <div class="container" style="width:300px; height:auto; margin:0px;">
    <div class="row">
    	
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="margin:0px;">
            <img src="" class="img-responsive">
            <div>
            ${pinBoard.pinboardno }/${pinBoard.username } / ${pinBoard.pinboardname } / ${pinBoard.create_time } / ${pinBoard.likecnt }
            </a>
            </div>
        </div>
       		
    </div>
</div> --%>

</body>
</html>








