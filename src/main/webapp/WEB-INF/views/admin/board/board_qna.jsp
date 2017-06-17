<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<!-- Content Wrapper. Contains page content -->
<body>
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>Q&A게시판</h1>
		</section>

		<section class="content">
			<div class="row">
				<div class="col-xs-12">
					<div class="box">
						<div class="box-header">
							<h3 class="box-title">Q&A 리스트</h3>
							
							<%-- <form action="itemList.do">
							<select name="o">
								<option value="productname" ${param.o eq "productname" ? "selected" : "" }>productname</option>
								<option value="productid" ${param.o eq "productid" ? "selected" : "" }>productid</option>
								<option value="itemid" ${param.o eq "itemid" ? "selected" : "" }>itemid</option>
							</select>
							<input type="text" name="k" value="${searchKeyword }">
							<input type="submit" value="검색">
							</form> --%>
							
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<table id="example1" class="table table-bordered table-hover">
								<thead>
									<tr>
										<th style="width: 10%; text-align: center">번호</th>
										<th style="width: 10%; text-align: center">분류</th>
										<th style="width: 53%; text-align: center">제목</th>
										<th style="width: 10%; text-align: center">작성자</th>
										<th style="width: 10%; text-align: center">날짜</th>
										<th style="width: 7%; text-align: center">조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${qnaList }">
										<c:url var="viewQna" value="/admin/qnaView.do">
											<c:param name="bno" value="${item.bno }" />
										</c:url>
										<tr>

											<td style="text-align: center;"><a
												href="${viewQna }">${item.bno }</a></td>
											<td style="text-align: center;"><a
												href="${viewQna }">${item.category }</a></td>
											<td style="text-align: center;"><a
												href="${viewQna }">${item.title }</a></td>
											<td style="text-align: center;">${item.username }</td>
											<td style="text-align: center;"><fmt:formatDate
													value="${item.regdate }" pattern="yyyy-MM-dd hh:mm" /></td>
											<td style="text-align: center;">${item.viewcnt }</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
							<!-- <a href="qnaWrite.do">
							<div class="btn btn-default pull-right">글쓰기</div></a> -->
						</div>
						<!-- /.box-body -->
						<!-- 페이징 -->
						<div class="box-footer clearfix">
							<ul class="pagination">
								<c:if test="${pageMaker.prev }">
									<c:if test="${searchKeyword != null }">
										<c:url var="qnaListP" value="qna.do">
											<c:param name="page" value="${pageMaker.start - 1}" />
											<c:param name="o" value="${searchOption }"></c:param>
											<c:param name="k" value="${searchKeyword }"></c:param>
										</c:url>
									</c:if>
									<c:if test="${searchKeyword == null }">
										<c:url var="qnaListP" value="qna.do">
											<c:param name="page" value="${pageMaker.start - 1}" />
										</c:url>
									</c:if>
									<li><a href="${qnaListP }">이전</a></li>
								</c:if>
								<c:forEach begin="${pageMaker.start }"
									end="${pageMaker.end}" var="idx">
									<c:if test="${searchKeyword != null }">
										<c:url var="qnaListP" value="qna.do">
											<c:param name="page" value="${idx}" />
											<c:param name="o" value="${searchOption }"></c:param>
											<c:param name="k" value="${searchKeyword }"></c:param>
										</c:url>
									</c:if>
									<c:if test="${searchKeyword == null }">
										<c:url var="qnaListP" value="qna.do">
											<c:param name="page" value="${idx}" />
										</c:url>
									</c:if>
									<li
										class='<c:out value="${idx == pageMaker.page ? 'current' : ''}"/>'>
										<a href='${qnaListP }'>${idx}</a>
									</li>
	
								</c:forEach>
								<c:if test="${pageMaker.next }">
									<c:if test="${searchKeyword != null }">
										<c:url var="qnaListP" value="qna.do">
											<c:param name="page" value="${pageMaker.end + 1}" />
											<c:param name="o" value="${searchOption }"></c:param>
											<c:param name="k" value="${searchKeyword }"></c:param>
										</c:url>
									</c:if>
									<c:if test="${searchKeyword == null }">
										<c:url var="qnaListP" value="qna.do">
											<c:param name="page" value="${pageMaker.end + 1}" />
										</c:url>
									</c:if>
									<li><a href="${qnaListP }">다음</a></li>
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




</body>