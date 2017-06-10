<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html class='no-js' lang='ko'>
<head>

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
</head>


<body class="cms-index-index">
	<div class="wrapper">
		<div class="page one-column">

			<div class="board-button">
				<p>
					<button class="btn btn-default" onclick="location.href='notice.do'">공지사항</button>
					<button class="btn btn-default" onclick="location.href='faq.do'">FAQ</button>
					<button class="btn btn-default" onclick="location.href='QA.do'">Q&A</button>
					<button class="btn btn-default" onclick="location.href='1on1.do'">1:1
						문의</button>
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
										<h1>
											공지사항 <small>최신 정보를 알려드립니다.</small>
										</h1>
									</div>

									<div class="board">
										<table class="table table-striped" id="board">

											<thead>
												<tr>
													<th style="width: 10%; text-align: center">번호</th>
													<th style="width: 53%; text-align: center">제목</th>
													<th style="width: 10%; text-align: center">작성자</th>
													<th style="width: 20%; text-align: center">날짜</th>
													<th style="width: 7%; text-align: center">조회수</th>
												</tr>
											</thead>

											<tbody>

												<c:forEach var="item" items="${noticeList }">
													<c:url var="viewNotice" value="noticeView.do">
														<c:param name="bno" value="${item.bno }" />
													</c:url>
													<tr>

														<td style="text-align: center;"><a
															href="${viewNotice }">${item.bno }</a></td>
														<td style="text-align: center;"><a
															href="${viewNotice }">${item.title }</a></td>
														<td style="text-align: center;">관리자</td>
														<td style="text-align: center;"><fmt:formatDate
																value="${item.regdate }" pattern="yyyy-MM-dd hh:mm" /></td>
														<td style="text-align: center;">${item.viewcnt }</td>
													</tr>
												</c:forEach>

											</tbody>
										</table>
										<!-- <a href="noticeWrite.do">
										<div class="btn btn-default pull-right">글쓰기</div></a> -->
									</div>


									<div class="bottom">

										<div class="text-center">
											<ul class="pagination">
												<c:if test="${pageMaker.prev }">
													<c:if test="${searchKeyword != null }">
														<c:url var="noticeListP" value="notice.do">
															<c:param name="page" value="${pageMaker.start - 1}" />
															<c:param name="o" value="${searchOption }"></c:param>
															<c:param name="k" value="${searchKeyword }"></c:param>
														</c:url>
													</c:if>
													<c:if test="${searchKeyword == null }">
														<c:url var="noticeListP" value="notice.do">
															<c:param name="page" value="${pageMaker.start - 1}" />
														</c:url>
													</c:if>
													<li><a href="${noticeListP }">이전</a></li>
												</c:if>
												<c:forEach begin="${pageMaker.start }"
													end="${pageMaker.end}" var="idx">
													<c:if test="${searchKeyword != null }">
														<c:url var="noticeListP" value="notice.do">
															<c:param name="page" value="${idx}" />
															<c:param name="o" value="${searchOption }"></c:param>
															<c:param name="k" value="${searchKeyword }"></c:param>
														</c:url>
													</c:if>
													<c:if test="${searchKeyword == null }">
														<c:url var="noticeListP" value="notice.do">
															<c:param name="page" value="${idx}" />
														</c:url>
													</c:if>
													<li
														class='<c:out value="${idx == pageMaker.page ? 'current' : ''}"/>'>
														<a href='${noticeListP }'>${idx}</a>
													</li>

												</c:forEach>
												<c:if test="${pageMaker.next }">
													<c:if test="${searchKeyword != null }">
														<c:url var="noticeListP" value="notice.do">
															<c:param name="page" value="${pageMaker.end + 1}" />
															<c:param name="o" value="${searchOption }"></c:param>
															<c:param name="k" value="${searchKeyword }"></c:param>
														</c:url>
													</c:if>
													<c:if test="${searchKeyword == null }">
														<c:url var="noticeListP" value="notice.do">
															<c:param name="page" value="${pageMaker.end + 1}" />
														</c:url>
													</c:if>
													<li><a href="${noticeListP }">다음</a></li>
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
</body>
</html>