<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class='no-js' lang='ko'>
<head>
</head>
<body class="cms-index-index">
	<div class="wrapper">
		<div class="page one-column">

				<div class="em-wrapper-main">
                    <div class="container container-main">
                        <div class="em-inner-main">
                            <div class="em-wrapper-area02"></div>
                            <div class="em-wrapper-area03"></div>
                            <div class="em-wrapper-area04"></div>
                            <div class="em-main-container em-col2-left-layout">
                                <div class="row">
                                
                                	<!-- 본문내용 -->
                                    <div class="col-sm-18 col-sm-push-6 em-col-main">
                                        <div class="page-title category-title">
                                            <h1>My Q&A List</h1>
                                        </div>
                                        
                                        <div class="category-products">

										<div class="board">
										<table class="table table-striped" id="board">

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

												<c:forEach var="item" items="${myQnaList }">
													<c:url var="viewQna" value="qnaView.do">
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
										<a href="qnaWrite.do">
										<div class="btn btn-default pull-right">글쓰기</div></a>
									</div>


									<div class="bottom">

										<div class="text-center">
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


								<!-- /.container -->                                        

    
                                        </div><!-- /.category-products -->
                                    </div><!-- /.em-col-main -->
                                    
                                    <!-- 사이드바 -->
                                    <%@ include file="/WEB-INF/views/include/sidemenu.jspf" %>
                                    
                                </div>
                            </div><!-- /.em-main-container -->
                        </div>
                    </div>
                </div><!-- /.em-wrapper-main -->
                
		</div>
		<!-- /.page -->
	</div>
	<!-- /.wrapper -->
</body>
</html>
                