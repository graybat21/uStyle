<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>PinBoard 리스트</h1>
	</section>

	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-body">
						<table id="example1" class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>pinboardno</th>
									<th>create username</th>
									<th>pinboardname</th>
									<th>create_time</th>
									<th>content</th>
									<th>likecnt</th>
									<th style="width: 60px">act</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${pinBoardList}" varStatus="status">
									<tr>
										<td>${list.pinboardno}</td>
										<td>${list.username}</td>
										<td>${list.pinboardname}</td>
										<td>
											<fmt:formatDate value="${list.create_time}" pattern="yyyy-MM-dd HH:mm" />
										</td>
										<td>${list.content}</td>
										<td>${list.likecnt }</td>
										<td>
											<input type="button" value="삭제" onclick="deletePinBoard(${list.pinboardno})">
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- /.box-body -->
					<!-- 페이징 -->
					<div class="box-footer clearfix">
						<ul class="pagination pagination-sm no-margin pull-right">
							<c:if test="${pageMaker.prev }">
								<c:if test="${not empty param.o}">
									<c:url var="pinBoardListP" value="pinBoardList.do">
										<c:param name="page" value="${pageMaker.start - 1}" />
										<c:param name="o" value="${param.o}"></c:param>
										<c:param name="k" value="${param.k}"></c:param>
									</c:url>
								</c:if>
								<c:if test="${empty param.o}">
									<c:url var="pinBoardListP" value="pinBoardList.do">
										<c:param name="page" value="${pageMaker.start - 1}" />
									</c:url>
								</c:if>
								<li><a href="${pinBoardListP}">이전</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" var="idx">
								<c:if test="${not empty param.o}">
									<c:url var="pinBoardListP" value="pinBoardList.do">
										<c:param name="page" value="${idx}" />
										<c:param name="o" value="${param.o}"></c:param>
										<c:param name="k" value="${param.k}"></c:param>
									</c:url>
								</c:if>
								<c:if test="${empty param.o}">
									<c:url var="pinBoardListP" value="pinBoardList.do">
										<c:param name="page" value="${idx}" />
									</c:url>
								</c:if>
								<li class='<c:out value="${idx == pageMaker.page ? 'current' : ''}"/>'>
									<a href='${pinBoardListP}'>${idx}</a>
								</li>
								
							</c:forEach>
							<c:if test="${pageMaker.next}">
								<c:if test="${not empty param.o}">
									<c:url var="pinBoardListP" value="pinBoardList.do">
										<c:param name="page" value="${pageMaker.end + 1}" />
										<c:param name="o" value="${param.o}"></c:param>
										<c:param name="k" value="${param.k}"></c:param>
									</c:url>
								</c:if>
								<c:if test="${empty param.o}">
									<c:url var="pinBoardListP" value="pinBoardList.do">
										<c:param name="page" value="${pageMaker.end + 1}" />
									</c:url>
								</c:if>
								<li><a href="${pinBoardListP}">다음</a></li>
							</c:if>
						</ul>
					</div>
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->

	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<script type="text/javascript">
var header = $("meta[name='_csrf_header']").attr("content");
var token  = $("meta[name='_csrf']").attr("content");

function deletePinBoard(pinboardno) {
	var result = confirm("선택한 PinBoard를 삭제하시겠습니까?");

	if ( result )
	{
		$.ajax({
			type: 'post',
			url: 'pinBoardDelete.do',
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
					window.location.href = "pinBoardList.do";
				}
			},
			error: function(request, status, error) {
			    alert("올바르지 않은 PinBoard 삭제입니다.");
			    window.location.href = "faq.do?";
		    }
		});
	}	
}
</script>
