<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html class='no-js' lang='ko'>
<head>
<script>
$(function(){
    $("#popbutton").click(function(){
        $('div.modal').modal({
            remote : '/viewPin.do?pinboardno=12'
        });
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
.modal.modal-center{
text-align: center;
}
@media screen and (min-width: 768px) { 
  .modal.modal-center:before {
    display: inline-block;
    vertical-align: middle;
    content: " ";
    height: 100%;
  }
}
.modal-dialog.modal-fullsize-center {
  width: 80%;
  height: 80%;
  margin: 0;
  padding: 0;
  display: inline-block;
  text-align: left;
  vertical-align: middle;
}
.modal-content.modal-fullsize-center {
  height: auto;
  min-height: 100%;
  border-radius: 0; 
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
				<a href="#popbutton" data-toggle="modal"> <%-- ${pinBoard.pinboardno } --%>
					<div class="well col-md-6" style="height: 350px;">
						${pinBoard.pinboardno } / ${pinBoard.like }
						<c:forEach var="image" items="${imageList }">
							<c:if test="${image.pinboardno eq pinBoard.pinboardno }">
								<img src="${image.mainpictureurl }" />
							</c:if>
						</c:forEach>
					</div>
					
			</c:forEach>
			
			
			<!-- Modal -->
			<div class="modal modal-center fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-fullsize-center">
			    <div class="modal-content modal-fullsize-center">
			      
			    </div>
			  </div>
			</div>
			
			
		</div>
	</div>

</body>
</html>








