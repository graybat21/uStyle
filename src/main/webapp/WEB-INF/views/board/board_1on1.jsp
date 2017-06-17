<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
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
         		   <button class="btn btn-default" onclick="location.href='qna.do'">Q&A</button>
         		   <button class="btn btn-default" onclick="location.href='1on1.do'">1:1 문의</button>
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
  				<h1>1대1 문의 <small>궁금하신 점을 남겨주세요.</small></h1>
			</div>
		
	<div class="board">						
		<table class="table table-striped" id="board">
		
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>		
			</thead>
			
			<tbody>
				<tr>
					<td>165</td>
					<td>제목은 뭐롤하는게 좋을까요</td>
					<td>병일쨩</td>
					<td>2017.05.20</td>
					<td>2</td>
				</tr>
				
				<tr>
					<td>165</td>
					<td>제목은 뭐롤하는게 좋을까요</td>
					<td>병일쨩</td>
					<td>2017.05.20</td>
					<td>2</td>
				</tr>
				
				<tr>
					<td>165</td>
					<td>제목은 뭐롤하는게 좋을까요</td>
					<td>병일쨩</td>
					<td>2017.05.20</td>
					<td>2</td>
				</tr>
				
				<tr>
					<td>165</td>
					<td>제목은 뭐롤하는게 좋을까요</td>
					<td>병일쨩</td>
					<td>2017.05.20</td>
					<td>2</td>
				</tr>
				
				<tr>
					<td>165</td>
					<td>제목은 뭐롤하는게 좋을까요</td>
					<td>병일쨩</td>
					<td>2017.05.20</td>
					<td>2</td>
				</tr>
				
				<tr>
					<td>165</td>
					<td>제목은 뭐롤하는게 좋을까요</td>
					<td>병일쨩</td>
					<td>2017.05.20</td>
					<td>2</td>
				</tr>
				
				<tr>
					<td>165</td>
					<td>제목은 뭐롤하는게 좋을까요</td>
					<td>병일쨩</td>
					<td>2017.05.20</td>
					<td>2</td>
				</tr>
				
				<tr>
					<td>165</td>
					<td>제목은 뭐롤하는게 좋을까요</td>
					<td>병일쨩</td>
					<td>2017.05.20</td>
					<td>2</td>
				</tr>
				
				<tr>
					<td>165</td>
					<td>제목은 뭐롤하는게 좋을까요</td>
					<td>병일쨩</td>
					<td>2017.05.20</td>
					<td>2</td>
				</tr>
				
			</tbody>
		</table>
		<c:if test="${session_username != null }">
		<button class="btn btn-default" onclick="location.href='write.do'">글쓰기</button>
		</c:if>
	</div>
	
	
		
		
	<div class="bottom">
		
		<div class="text-center">
			<ul class="pagination">
				<li><a href="#">1</a>
				<li><a href="#">2</a>
				<li><a href="#">3</a>
				<li><a href="#">4</a>
				<li><a href="#">5</a>
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