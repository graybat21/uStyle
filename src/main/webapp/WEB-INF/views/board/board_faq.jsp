<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.board {
	border: 1.5px solid #e0e0e0;
	padding: 10px 10px 10px 10px;
	margin: 20px 20px 20px 20px;
}

.board-button {
	margin: 20px 20px 20px 20px;
	text-align: center;
}

.btn-default {
	margin: 30px 10px 0px 10px;
}

.pagination {
	margin: 0px 0px 50px 100px;
}
</style>
<div class="wrapper">
	<div class="page one-column">

		<div class="board-button">
			<p>
				<button class="btn btn-default" onclick="location.href='notice.do'">공지사항</button>
				<button class="btn btn-default" onclick="location.href='faq.do'">FAQ</button>
				<button class="btn btn-default" onclick="location.href='qna.do'">Q&amp;A</button>
			</p>
		</div>

		<div class="em-wrapper-main">
			<div class="container container-main">
				<div class="em-inner-main">
					<div class="em-wrapper-area02"></div>
					<div class="em-main-container em-col1-layout">
						<div class="row">
							<div class="em-col-main col-sm-24">
								<div class="page-header">
									<div><h1>FAQ</h1></div>
									<div><h3>자주 묻는 질문들을 답해드립니다.</h3></div>
								</div>
								<div class="board">
									<table class="table table-striped" id="board">

										<thead>
											<tr>
												<th style="width: 7%; text-align: center">글번호</th>
												<th style="width: 7%; text-align: center">분류</th>
												<th style="width: 53%; text-align: center">내용</th>
												<!-- <th style="width: 20%; text-align: center">날짜</th> -->
											</tr>
										</thead>
										<tbody>

											<c:forEach var="item" items="${faqList }">
												<tr id="${item.bno }">
													<td style="text-align: center;">${item.bno }</td>
													<td style="text-align: center;">${item.category }</td>
												
													<td style="text-align: center;">	<a href="javascript:viewComment(${item.bno })">${item.content }</a></td>
												</tr>
												<tr>
													<td id="comment_${item.bno }" colspan="3" style="display:none">
													${item.comment }
													</td>
												</tr>
											</c:forEach>

										</tbody>
									</table>
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
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- /.page -->
</div>
<!-- /.wrapper -->
<script type="text/javascript">
function viewComment(bno) {
	if ( $('#comment_' + bno).css("display") == "none" ){
		$('#comment_' + bno).css("display", "");
	}
	else{
		$('#comment_' + bno).css("display", "none");
	}
}
</script>