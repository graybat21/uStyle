<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
   	<div class="container" style="height: auto; margin: 30px;">
		<div class="box-collateral box-reviews em-line-01" id="customer-reviews">
			<div class="form_review no_reviews">
			    <div class="form-add" id="customer_review_form">
			        <div class="em-block-title">
			            <h2>Q&amp;A</h2>
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
						<button class="btn btn-default" onclick="location.href='qna.do'">목록</button>
						<c:if test="${qna.username == session_user['username']}">
							<button class="btn btn-default" onclick="location.href='qnaModify.do?bno=${qna.bno}'">글수정</button>
							<button class="btn btn-default" onclick="removeQnA(${qna.bno})">글삭제</button>
	                    </c:if>
				    </div>
			    </div>
			</div><!-- /.form_review -->
		</div><!-- /.box-collateral -->
	</div>
	<!-- /.container -->
</div>
</body>

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
					window.location.href = "qna.do?page=" + page;
				}
			},
			error: function(request, status, error) {
			    alert("올바르지 않은 글 삭제입니다.");
			    window.location.href = "qna.do?page=" + page;
		    }
		});
	}
}
</script>

</html>
