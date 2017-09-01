<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="/resources/js/commonBoard.js"></script>
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
                            <div class="col-xs-24 col-sm-18 col-sm-push-6 em-col-main">
                                <div class="page-title category-title">
                                    <h1>My Q&amp;A List</h1>
                                </div>
                            	<div class="category-products">
									<div class="board">
										<table class="table table-striped" id="board">
											<thead>
												<tr>
													<th style="width: 10%; text-align: center">번호</th>
													<th style="width: 15%; text-align: center">분류</th>
													<th style="width: 48%; text-align: center">제목</th>
													<th style="width: 18%; text-align: center">날짜</th>
													<th style="width: 7%; text-align: center">조회수</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${not empty myQnaList}">
												<c:forEach var="qna" items="${myQnaList}">
													<c:url var="viewQna" value="myQnaView.do">
														<c:param name="bno" value="${qna.bno}" />
														<c:param name="page" value="${pageMaker.page}" />
														<c:if test="${ not empty param.o }">
															<c:param name="o" value="${param.o}" />
															<c:param name="k" value="${param.k}" />
														</c:if>
													</c:url>
													<tr>
														<td style="text-align: center;">${qna.bno}</td>
														<td style="text-align: center;">${qna.category}</td>
														<td style="text-align: center;"><a href="${viewQna}">${qna.title}</a></td>
														<td style="text-align: center;">
															<fmt:formatDate value="${qna.regdate}" pattern="yyyy-MM-dd HH:mm" />
														</td>
														<td style="text-align: center;">${qna.viewcnt}</td>
													</tr>
												</c:forEach>
												</c:if>
												<c:if test="${empty myQnaList}">
													<tr>
														<td colspan="5" style="text-align: center">
														작성한 Q&amp;A가 없습니다.
														</td>
													</tr>
												</c:if>
											</tbody>
										</table>
									</div>

									<div class="bottom">
										<div class="col-xs-24 col-sm-24">
											<div class="form-search" style="border-style: none; margin: 10px;">
											<form name="form_search" id="form_search" action="myQnaList.do" onsubmit="return verifyOK()">
												<select id="searchOption" name="o">
													<option value="tnc" ${param.o eq "tnc" ? "selected" : "" }>제목 + 내용</option>
													<option value="tit" ${param.o eq "tit" ? "selected" : "" }>제목</option>
													<option value="con" ${param.o eq "con" ? "selected" : "" }>내용</option>
												</select>
												<input type="text" id="k" name="k" value="${searchKeyword}">
												<input type="submit" value="검색"> 
											</form>
											</div>
										</div>
										<c:url var="qnaWrite" value="qnaWrite.do">
											<c:param name="page" value="${pageMaker.page}" />
											<c:if test="${ not empty param.o }">
												<c:param name="o" value="${param.o}" />
												<c:param name="k" value="${param.k}" />
											</c:if>
										</c:url>
										<div class="col-xs-24 col-sm-24">
											<a href="${qnaWrite}">
												<button class="btn btn-default pull-right">글쓰기</button>
											</a>
										</div>
										<div class="col-xs-24 col-sm-24 text-center">
											<c:if test="${pageMaker.start > 0}">
												<ul class="pagination">
												<c:if test="${pageMaker.prev }">
													<c:if test="${ not empty param.o }">
														<c:url var="qnaListP" value="myQnaList.do">
															<c:param name="page" value="${pageMaker.start - 1}" />
															<c:param name="o" value="${param.o}" />
															<c:param name="k" value="${param.k}" />
														</c:url>
													</c:if>
													<c:if test="${ empty param.o }">
														<c:url var="qnaListP" value="myQnaList.do">
															<c:param name="page" value="${pageMaker.start - 1}" />
														</c:url>
													</c:if>
													<li><a href="${qnaListP }">이전</a></li>
												</c:if>
												<c:forEach begin="${pageMaker.start }"
													end="${pageMaker.end}" var="idx">
													<c:if test="${ not empty param.o }">
														<c:url var="qnaListP" value="myQnaList.do">
															<c:param name="page" value="${idx}" />
															<c:param name="o" value="${param.o}" />
															<c:param name="k" value="${param.k}" />
														</c:url>
													</c:if>
													<c:if test="${ empty param.o }">
														<c:url var="qnaListP" value="myQnaList.do">
															<c:param name="page" value="${idx}" />
														</c:url>
													</c:if>
													<li
														class='<c:out value="${idx == pageMaker.page ? 'current' : ''}"/>'>
														<a href='${qnaListP }'>${idx}</a>
													</li>
	
												</c:forEach>
												<c:if test="${pageMaker.next }">
													<c:if test="${ not empty param.o }">
														<c:url var="qnaListP" value="myQnaList.do">
															<c:param name="page" value="${pageMaker.end + 1}" />
															<c:param name="o" value="${param.o}"></c:param>
															<c:param name="k" value="${param.k}"></c:param>
														</c:url>
													</c:if>
													<c:if test="${ empty param.o }">
														<c:url var="qnaListP" value="myQnaList.do">
															<c:param name="page" value="${pageMaker.end + 1}" />
														</c:url>
													</c:if>
													<li><a href="${qnaListP }">다음</a></li>
												</c:if>
											</ul>
										</c:if>
									</div>
								</div>
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
                