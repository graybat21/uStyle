<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                    <h1>My Q&amp;A</h1>
                                </div>
					                <h3>질문과 답변</h3>
					                <ul class="form-list">
					                    <li>
					                        <label for="title_field" class="required">Title</label>
					                        <div class="input-box">
					                            <input type="text" name="qnatitle" id="pinboard-name" class="input-text required-entry" value="${qna.title}" disabled="disabled"/>
					                        </div>
					                    </li>
					                    <li>
					                        <label for="username_field" class="required">UserName</label>
					                        <div class="input-box">
					                            <input type="text" name="qnausername" id="pinboard-name" class="input-text required-entry" value="${qna.username}" disabled="disabled"/>
					                        </div>
					                    </li>
					                    <li>
					                        <label for="category_field" class="required">Category</label>
					                        <div class="input-box">
					                            <input type="text" name="qnacategory" id="pinboard-name" class="input-text required-entry" value="${qna.category}" disabled="disabled"/>
					                        </div>
					                    </li>
					                    <li>
					                        <label for="contents_field" class="required">Contents</label>
					                        <div class="input-box" style="min-height: 100px; background-color: #ECF6CE; padding-top: 10px; padding-left: 10px; padding-right: 10px; padding-bottom: 10px;">
					                        	${qna.content}
					                        </div>
					                    </li>
					                </ul>
					            <div class="board-button">
					            	<c:if test="${ not empty param.o }">
										<c:url var="qnaModifyP" value="qnaModify.do">
											<c:param name="bno" value="${param.bno}" />
											<c:param name="page" value="${page}" />
											<c:param name="o" value="${param.o}"></c:param>
											<c:param name="k" value="${param.k}"></c:param>
										</c:url>
										<c:url var="qnaListP" value="myQnaList.do">
											<c:param name="page" value="${page}" />
											<c:param name="o" value="${param.o}"></c:param>
											<c:param name="k" value="${param.k}"></c:param>
										</c:url>
									</c:if>
									<c:if test="${ empty param.o }">
										<c:url var="qnaModifyP" value="qnaModify.do">
											<c:param name="bno" value="${param.bno}" />
											<c:param name="page" value="${pageMaker.end + 1}" />
										</c:url>
										<c:url var="qnaListP" value="myQnaList.do">
											<c:param name="page" value="${pageMaker.end + 1}" />
										</c:url>
									</c:if>
									
									<button class="btn btn-default" onclick="location.href='${qnaListP}'">목록</button>
									<button class="btn btn-default" onclick="location.href='${qnaModifyP}'">글수정</button>
									<button class="btn btn-default" onclick="removeQnA(${qna.bno})">글삭제</button>
							    </div>
						    </div>
						    <%@ include file="/WEB-INF/views/include/sidemenu.jspf" %>
						</div><!-- /.form_review -->
					</div><!-- /.box-collateral -->
				</div>
				<!-- /.container -->
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
var header = $("meta[name='_csrf_header']").attr("content");
var token  = $("meta[name='_csrf']").attr("content");

var page = '${page}';

function removeQnA(bno) {
	
	if ( confirm("이 글을 삭제하시겠습니까?") == true )
	{
		$.ajax({
			type: 'post',
			url: 'qnaDelete.do',
			beforeSend: function(xhr){
				xhr.setRequestHeader(header, token);
		    },
			headers: {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType: "text",
			data: JSON.stringify({bno: bno}),
			success: function(result) {
				console.log("result: " + result);
				
				if ( result == 'SUCCESS' ) {
					window.location.href = "myQnaList.do";
				}
			},
			error: function(request, status, error) {
			    alert("올바르지 않은 글 삭제입니다.");
			    window.location.href = "myQnaList.do";
		    }
		});
	}
}
</script>

</html>
