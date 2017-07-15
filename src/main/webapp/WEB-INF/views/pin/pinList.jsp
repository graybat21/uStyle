<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html class='no-js' lang='ko'>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#columns {
	column-width: 350px;
	column-gap: 10px;
	padding: 30px;
}

#columns figure {
	display: Inline-block;
	border: 1px solid rgba(0, 0, 0, 0.2);
	margin: 0px;
	margin-bottom: 10px;
	box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
}

div img {
	width: 100%;
}

#columns figure figcaption {
	border-top: 1px solid rgba(0, 0, 0, 0.2);
	padding: 10px;
	margin-top: 10px;
}
</style>
</head>

	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<h4 class="modal-title" id="myModalLabel">Modal title</h4>
	</div>
	<div class="modal-body">
		<div class="row">
			<div class="col-md-12">
				<p align="center">${pinBoard.pinboardname }</p>
				${pinBoard.like }
				<a href="plusLike.do">LIKE</a>
			</div>
		</div>
		<div class="row">
			<!-- 사진부분 -->
			<div class="container col-md-8">
			<c:forEach var="pin" items="${pinList }">
				<div class="imagebox">
					<img src="${pin.productimage }">
				</div>
			</c:forEach>
			</div>
			<!-- 글 부분 -->
			<div class="container col-md-4">
				<p align="center">${pinBoard.content }</p>
				<%-- <c:forEach var="reply" items="${replyList }">
					<p align="center">${reply.content}--%>
					<p>글1</p>
					<p>글2</p>
						<p align="right">답변</p> 
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		<button type="button" class="btn btn-primary">수정</button>
	</div>


	<%-- <div class="row">
		<c:forEach var="pin" items="${pinList }">

			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12"
				style="margin: 0px;">
				<img src="" class="img-responsive">
				<div>
					<a href="insertPin.do"> ${pin.pinno} / ${pin.pinboardno} /
						${pin.productid} </a>

				</div>
			</div>

		</c:forEach>
		<a href="insertPin.do?pinboardno=${pinboardno }">새로 핀 입력</a>

	</div> --%>




</html>









