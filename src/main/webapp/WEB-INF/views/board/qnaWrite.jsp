<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.ckeditor.com/4.5.7/standard/ckeditor.js"></script>
<script type="text/javascript">
$(function() {
	CKEDITOR.replace('editor1');
});

function sendData() {
	if (!document.getElementById("title").value) {
		alert("제목을 입력하세요.");
		return false;
	}
	if (!document.getElementById("category").value) {
		alert("카테고리를 입력하세요.");
		return false;
	}
	if (!CKEDITOR.instances.editor1.getData()) {
		alert("내용을 입력하세요.");
		return false;
	}
	
	$("#qna_form").submit();
}

function resetCkEditor(){
	CKEDITOR.instances.editor1.setData('');
}
</script>

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
								<div class="box">
									<div class="box-header">
										<h3 class="box-title">Q&amp;A 작성</h3>
									</div>
									<!-- /.box-header -->
									<div class="box-body">
										<c:if test="${ not empty param.o }">
											<c:url var="qnaListP" value="myQnaList.do">
												<c:param name="page" value="${page}" />
												<c:param name="o" value="${param.o}"></c:param>
												<c:param name="k" value="${param.k}"></c:param>
											</c:url>
										</c:if>
										<c:if test="${ empty param.o }">
											<c:url var="qnaListP" value="myQnaList.do">
												<c:param name="page" value="${page}" />
											</c:url>
										</c:if>
										<form id="qna_form" method="post">
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
													
											<table class="table table-bordered">
												<tbody>
													<tr>
														<th>제목:</th>
														<td><input type="text" placeholder="질문을 입력하세요. " id="title"
															name="title" class="form-control" value=""/></td>
													</tr>
													<tr>
														<th>분류:</th>
														<td>
															<select id="category" name="category">
																<option value="회원정보관련">회원정보관련</option>
																<option value="상품환불관련">상품환불관련</option>
																<option value="배송관련">배송관련</option>
															</select>
														</td>
													</tr>
													<tr>
														<th>내용:</th>
														<td><textarea id="editor1"
																name="content" rows="10" cols="80" class="form-control"></textarea>
														</td>
													</tr>
									
													<tr>
														<td colspan="2">
															<input type="button" value="등록" onclick="sendData()" class="pull-right" /> 
															<input type="reset" value="리셋" onclick="resetCkEditor()" class="pull-left" /> 
															<input type="button" value="글 목록으로" class="pull-right" onclick="location.href='${qnaListP}'" /> 
														</td>
													</tr>
												</tbody>
											</table>
										</form>
									</div>	
								</div>
							</div>
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
                            