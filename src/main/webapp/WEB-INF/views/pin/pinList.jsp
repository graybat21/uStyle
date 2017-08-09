<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class='no-js' lang='ko'>
<head>
<%--link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script--%>
<style>
#columns {
	column-width: 350px;
	column-gap: 10px;
	padding: 30px;
}

#columns figure {
	display: inline-block;
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

#like-info {
	text-align: right;
}
</style>
</head>
<body>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<h4 class="modal-title" id="myModalLabel">${pinBoard.pinboardname}</h4>
	</div>
	<div class="modal-body">
		<div class="row">
			<div class="col-md-24">
				<div id="like-info-wrapper">
				<p id="like-info">
					<c:if test="${isCheckLike eq false}">
					<button type="button" class="btn btn-xs btn-link" id="btn-addlike">
						<span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>&nbsp;
					</button>
					</c:if>
					<c:if test="${isCheckLike eq true}">
					<button type="button" class="btn btn-xs btn-link" id="btn-removelike">
						<span class="glyphicon glyphicon-heart" aria-hidden="true"></span>&nbsp;
					</button>
					</c:if>
					${pinBoard.likecnt }
				<%--a href="plusLike.do">LIKE</a--%>
				</p>
				</div>
			</div>
		</div>
		<div class="row">
			<!-- 사진부분 -->
			<div class="container col-md-16">
			<c:forEach var="pinBoardProduct" items="${pinBoardProductList}">
				<div class="imagebox">
					<a href="/product/productDetail.do?productid=${pinBoardProduct.productid}" target="_blank">
						<img class="col-md-5 col-sm-5 col-xs-5" src="/displayFile?fileName=${pinBoardProduct.mainpictureurl}">
					</a>
				</div>
			</c:forEach>
			</div>
			<!-- 글 부분 -->
			<div class="container col-md-8">
				<p align="center">${pinBoard.content}</p>
				<%-- <c:forEach var="reply" items="${replyList }">
					<p align="center">${reply.content}--%>
					<p>글1</p>
					<p>글2</p>
						<p align="right">답변</p> 
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<%--button type="button" class="btn btn-default" data-dismiss="modal">Close</button--%>
		<button type="button" class="btn btn-default" id="btn-modifypinboard">수정</button>
		<button type="button" class="btn btn-default" id="btn-removepinboard">삭제</button>
		<c:if test="${ not empty productid }">
			<button type="button" class="btn btn-default" id="btn-addpin">Pin 추가</button>
		</c:if>
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
	
<script type="text/javascript">
$(document).ready(function() {
	var header = $("meta[name='_csrf_header']").attr("content");
	var token  = $("meta[name='_csrf']").attr("content");
	
	var username = '${session_user.username}';
	var pinboardno = '${pinBoard.pinboardno}';
	var productid = '${productid}';
	
	$("#like-info-wrapper").on("click", "#btn-addlike", function() {
		$.ajax({
			type: 'post',
			url: 'addLike.do',
			beforeSend: function(xhr){
				xhr.setRequestHeader(header, token);
		    },
			headers: {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType: "text",
			data: JSON.stringify({username: username, pinboardno: pinboardno}),
			success: function(result) {
				console.log("result: " + result);
				
				var plusLikeHtml = '<button type="button" class="btn btn-xs btn-link" id="btn-removelike">';
				plusLikeHtml += '<span class="glyphicon glyphicon-heart" aria-hidden="true"></span>&nbsp;';
				plusLikeHtml += '</button>';
				plusLikeHtml += result;
				
				$("#like-info").empty();
				$("#like-info").append(plusLikeHtml);
			},
			error: function(request, status, error) {
			    alert("code:" + request.status + "\n" + "message:" + request.responseText+"\n" + "error:" + error);
		    }
		});
	});
	
	$("#like-info-wrapper").on("click", "#btn-removelike", function() {
		$.ajax({
			type: 'post',
			url: 'removeLike.do',
			beforeSend: function(xhr){
				xhr.setRequestHeader(header, token);
		    },
			headers: {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType: "text",
			data: JSON.stringify({username: username, pinboardno: pinboardno}),
			success: function(result) {
				console.log("result: " + result);
				
				var minusLikeHtml = '<button type="button" class="btn btn-xs btn-link" id="btn-addlike">';
				minusLikeHtml += '<span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>&nbsp;';
				minusLikeHtml += '</button>';
				minusLikeHtml += result;
				
				$("#like-info").empty();
				$("#like-info").append(minusLikeHtml);
			},
			error: function(request, status, error) {
			    alert("code:" + request.status + "\n" + "message:" + request.responseText+"\n" + "error:" + error);
		    }
		});
	});
	
	$(".modal-footer").on("click", "#btn-addpin", function(e) {
		$.ajax({
			type: 'post',
			url: 'insertPin.do',
			beforeSend: function(xhr){
				xhr.setRequestHeader(header, token);
		    },
			headers: {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType: "text",
			data: JSON.stringify({pinboardno: pinboardno, productid: productid}),
			success: function(result) {
				console.log("result: " + result);
				
				if ( result == 'EXIST OF PIN' ) {
    				alert("PinBoard에 선택한 상품이 이미 Pin에 추가되어 있습니다.");
    				window.location.href = "myPinBoardList.do?productid=" + productid;
    			}
				else if ( result == 'EXCEED OF PIN' ) {
    				alert("PinBoard에는 최대 4개의 상품을 Pin으로 추가할 수 있습니다.");
    				window.location.href = "myPinBoardList.do?productid=" + productid;
    			}
				else {
    				alert("PinBoard에 선택한 상품을 Pin으로 추가하였습니다.");
    				window.location.href = "myPinBoardList.do";
    			}
			},
			error: function(request, status, error) {
			    alert("올바르지 않은 Pin 추가입니다.");
			    window.location.href = "myPinBoardList.do";
		    }
		});
	});
	
	$(".modal-footer").on("click", "#btn-modifypinboard", function(e) {
		window.location.href = "modifyPinBoard.do?pinboardno=" + pinboardno;
	});
	
	$(".modal-footer").on("click", "#btn-removepinboard", function(e) {
		if ( confirm("이 PinBoard를 삭제하시겠습니까?") == true )
		{
			$.ajax({
				type: 'post',
				url: 'deletePinBoard.do',
				beforeSend: function(xhr){
					xhr.setRequestHeader(header, token);
			    },
				headers: {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType: "text",
				data: JSON.stringify({pinboardno: pinboardno}),
				success: function(result) {
					console.log("result: " + result);
					
					if ( result == 'SUCCESS' ) {
						window.location.href = "myPinBoardList.do";
					}
				},
				error: function(request, status, error) {
				    alert("올바르지 않은 PinBoard 삭제입니다.");
				    window.location.href = "myPinBoardList.do";
			    }
			});
		}
	});
});
</script>
</body>
</html>









