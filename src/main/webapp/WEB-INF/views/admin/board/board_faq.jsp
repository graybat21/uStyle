<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html class='no-js' lang='ko'>

<body class="cms-index-index">
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>FAQ게시판</h1>
		</section>

		<section class="content">
			<div class="row">
				<div class="col-xs-12">
					<div class="box">
						<div class="box-header">
							<h3 class="box-title">FAQ 리스트</h3>
							
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
							<table class="table table-striped" id="board">

								<thead>
									<tr>
										<th style="width: 7%; text-align: center">글번호</th>
										<th style="width: 53%; text-align: center">내용</th>
										<th style="width: 20%; text-align: center">날짜</th>
										<th style="width: 7%; text-align: center">조회수</th>
									</tr>
								</thead>
								<script>
									function viewComment(bno){
										var str="comment_"+bno;
										$('#comment_'+bno).click(function(){
											$('#comment_'+bno).css("display","");
										});
									}
								</script>

								<tbody>

									<c:forEach var="item" items="${faqList }">
										<tr id="${item.bno }">
											<td style="text-align: center;">${item.bno }</td>
											<a href="javascript:viewComment(${item.bno })">
											<td style="text-align: center;">${item.content }</td></a>
											<td style="text-align: center;"><fmt:formatDate
													value="${item.regdate }" pattern="yyyy-MM-dd hh:mm" /></td>
											<td style="text-align: center;">${item.viewcnt }</td>
										</tr>
										<c:if test="${item.comment != null }">
										<tr>
											<td id="comment_${item.bno }" colspan="4" style="display:none">
											${item.comment }
											</td>
										</tr>
										</c:if>
									</c:forEach>

								</tbody>
							</table>
							<a href="faqWrite.do">
							<div class="btn btn-default pull-right">글쓰기</div></a>
						</div>


						<div class="bottom">

							<div class="text-center">
								<ul class="pagination">
									<c:if test="${pageMaker.prev }">
										<c:if test="${searchKeyword != null }">
											<c:url var="faqListP" value="faq.do">
												<c:param name="page" value="${pageMaker.start - 1}" />
												<c:param name="o" value="${searchOption }"></c:param>
												<c:param name="k" value="${searchKeyword }"></c:param>
											</c:url>
										</c:if>
										<c:if test="${searchKeyword == null }">
											<c:url var="faqListP" value="faq.do">
												<c:param name="page" value="${pageMaker.start - 1}" />
											</c:url>
										</c:if>
										<li><a href="${faqListP }">이전</a></li>
									</c:if>
									<c:forEach begin="${pageMaker.start }"
										end="${pageMaker.end}" var="idx">
										<c:if test="${searchKeyword != null }">
											<c:url var="faqListP" value="faq.do">
												<c:param name="page" value="${idx}" />
												<c:param name="o" value="${searchOption }"></c:param>
												<c:param name="k" value="${searchKeyword }"></c:param>
											</c:url>
										</c:if>
										<c:if test="${searchKeyword == null }">
											<c:url var="faqListP" value="faq.do">
												<c:param name="page" value="${idx}" />
											</c:url>
										</c:if>
										<li
											class='<c:out value="${idx == pageMaker.page ? 'current' : ''}"/>'>
											<a href='${faqListP }'>${idx}</a>
										</li>

									</c:forEach>
									<c:if test="${pageMaker.next }">
										<c:if test="${searchKeyword != null }">
											<c:url var="faqListP" value="faq.do">
												<c:param name="page" value="${pageMaker.end + 1}" />
												<c:param name="o" value="${searchOption }"></c:param>
												<c:param name="k" value="${searchKeyword }"></c:param>
											</c:url>
										</c:if>
										<c:if test="${searchKeyword == null }">
											<c:url var="faqListP" value="faq.do">
												<c:param name="page" value="${pageMaker.end + 1}" />
											</c:url>
										</c:if>
										<li><a href="${faqListP }">다음</a></li>
									</c:if>
								</ul>
							</div>
						</div>

					</div>

					<!-- /.container -->

				</div>
			</section>
		<!-- /.page -->
	</div>
	<!-- /.wrapper -->
</body>
</html>