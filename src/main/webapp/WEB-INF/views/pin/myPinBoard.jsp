<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html class='no-js' lang='ko'>
<head>
<script>
$(function(){
    $("#popbutton").click(function(){
        $('div.modal').modal(/* {
            remote : '/login.do'
        } */);
    })
})
</script>
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
<!-- Button trigger modal --> 
<button type="button" class="btn btn-primary btn-lg" id="popbutton">
  Launch demo modal
</button>
 			<c:forEach var="pinBoard" items="${pinBoardList }" varStatus="status">
				<%-- <a href="viewPin.do?pinboardno=${pinBoard.pinboardno }" data-toggle="modal" data-target="#myModal"> --%>
					<div class="well col-md-6" style="height: 350px;">
						${status }/ ${pinBoard.pinboardno }
						<c:forEach var="image" items="${imageList }">
							<c:if test="${image.pinboardno eq pinBoard.pinboardno }">
								<img src="${image.mainpictureurl }" />
							</c:if>
						</c:forEach>
					</div>
					
			</c:forEach>
			
			
			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
			      </div>
			      <div class="modal-body">
			      	<!-- 사진부분 -->
			      	<div class="row">
			        <div class="col-md-24">
			        	<p align="center">제목</p>
			        </div>
			        </div>
			        <div class="row">
				        <div class="col-md-16">
				        	<p align="center">이미지</p>
				        </div>
			        	<div class="col-md-8">
			        		<p align="center">글내용</p>
			        	</div>
			        </div>
			        <div class="row">
			        </div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary">수정</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			
		</div>
	</div>

</body>
</html>








