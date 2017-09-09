<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.col-md-5 {
	text-align: center;
}

.pinBoardImage {
	max-width: 200px;
	max-height: 200px;
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
.glyphicon-plus {
    font-size: 100px;
}
.pinboard-list {
	padding: 20px;
}
.pinboard-element {
	height: 350px; 
	margin: 20px;
}
.pinboard-pagination {
	padding: 0 50px 50px 50px;
}
</style>

<script type="text/javascript">
/** 
 * 	열려있는 하나의 modal을 닫은 후 다른 modal을 열었을 때, 이에 해당하는 modal을 열 수 있도록 함.
 *	아래의 코드가 없을 경우, 처음에 열었던 modal만 계속해서 나오게 됨.
 */
$('body').on('hidden.bs.modal', '.modal', function (e) {
	  $(this).removeData('bs.modal');
});
</script>
<div class="wrapper">
	<div class="page one-column">
		<div class="em-wrapper-main">
			<div class="container-fluid container-main">
				<div class="container col-md-24 pinboard-list">
					<h1>My PinBoard list</h1>
					<div class="well col-md-5 pinboard-element">
						<a href="createPinBoard.do">
							<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
						</a>
					</div>
					
		 			<c:forEach var="pinBoard" items="${pinBoardList}" varStatus="status">
						<c:url value="viewPinBoard.do" var="pinUrl">
				            <c:param name="pinboardno" value="${pinBoard.pinboardno}" />
			            	<c:param name="productid" value="${productid}" />
				        </c:url>
				        <div class="well col-md-5 pinboard-element">
						<a href="${pinUrl}" data-toggle="modal" data-target="#myModal">
							<div class="col-xs-24 col-sm-24 col-md-24">
							<c:if test="${pinBoard.mainpictureproductid > 0}">
								<img class="pinBoardImage" src="/displayMainPictureurl?productid=${pinBoard.mainpictureproductid}" />
							</c:if>
							<c:if test="${pinBoard.mainpictureproductid == 0}">
								<img class="pinBoardImage" src="/displayFile?fileName=/ustylenone.jpg" />
							</c:if>
							</div>
							<div>${pinBoard.pinboardname}</div>
							<div>${pinBoard.likecnt} LIKE</div>
						</a>
						</div>
					</c:forEach>

					<!-- Modal -->
					<div class="modal modal-center fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-fullsize-center">
							<div class="modal-content modal-fullsize-center">
							  <div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
								<h4 class="modal-title" id="myModalLabel">Modal title</h4>
							  </div>
							  <div class="modal-body">
							  </div>
							  <div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save changes</button>
							  </div>
							</div>
						</div>
					</div>
				</div>
				<div class="container col-md-24 pinboard-pagination">
				<div class="toolbar-bottom em-box-03">
					<div class="toolbar">
					<div class="pager">
						<p class="amount"> Pins ${first} to ${last} of ${totalCnt} total</p>
						<div class="pages">
						    <ol>
						    	<c:if test="${pageMaker.prev }">
									<c:url var="myPinBoardListP" value="myPinBoardList.do">
										<c:param name="pageCount" value="${pageMaker.start - 1}" />
										<c:param name="productid" value="${productid}" />
									</c:url>
                                    <li><a class="fa fa-angle-left" href="${myPinBoardListP}" title="Prev"> </a></li>
								</c:if>
                                <c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" var="idx">
									<c:url var="myPinBoardListP" value="myPinBoardList.do">
									    <c:param name="pageCount" value="${idx}" />
									    <c:param name="productid" value="${productid}" />
									</c:url>
									<li><a class='<c:out value="${idx == pageMaker.page ? 'current' : ''}"/>' href='${myPinBoardListP}'>${idx}</a></li>
								</c:forEach>
								<c:if test="${pageMaker.next }">
								<c:url var="myPinBoardListP" value="myPinBoardList.do">
								    <c:param name="pageCount" value="${pageMaker.end + 1}" />
									<c:param name="productid" value="${productid}" />
								</c:url>
									<li><a class="fa fa-angle-right" href="${myPinBoardListP}" title="Next"></a></li>
								</c:if>
					        </ol>
					    </div>
					</div><!-- /.pager -->
					</div>
					</div>
					</div>
			</div>
		</div>
	</div>
</div>
