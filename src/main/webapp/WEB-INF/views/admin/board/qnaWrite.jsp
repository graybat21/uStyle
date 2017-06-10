<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Write something else you want</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<script src="https://cdn.ckeditor.com/4.5.7/standard/ckeditor.js"></script>
<script>
	$(function() {
		CKEDITOR.replace('editor1');
	});

	function sendData() {
		if (!document.getElementById("title").value) {
			alert("제목을 입력하세요.");
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
</head>
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
						</div>
						<!-- /.box-header -->
						<div class="box-body">
						<table class="table table-bordered">
    <tbody>
            <tr>
                <th>제목: </th>
                <td>${qna.title }</td>
            </tr>
            <tr>
                <th>작성자: </th>
                <td>${qna.username}</td>
            </tr>
            <tr>
                <th>분류: </th>
                <td>${qna.category}</td>
            </tr>
            <tr>
                <th>내용: </th>
                <td>${qna.content }</td>
            </tr>
	</tbody></table>
	
		<table class="table table-bordered">
			<thead>
			<caption>글쓰기</caption>
			</thead>
			<tbody>
				<form id="qna_form" method="post" encType="multiplart/form-data">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<tr>
						<th>제목:</th>
						<td><input type="text" placeholder="질문을 입력하세요. " id="title"
							name="title" class="form-control" value="[답변] ${qna.title }"/></td>
					</tr>
					<%-- <tr>
						<th>분류:</th>
						<td>${qna.category }</td>
					</tr> --%>
					<tr>
						<th>답변:</th>
						<td><textarea id="editor1"
								name="content" rows="10" cols="80" class="form-control"></textarea>
						</td>
					</tr>
					<input type="hidden" name="category" value="${qna.category }">
					<input type="hidden" name="bno" value="${qna.bno }">
					<tr>
						<td colspan="2"><input type="button" value="등록"
							onclick="sendData()" class="pull-right" /> <input type="reset"
							value="리셋" onclick="resetCkEditor()" class="pull-left" /> <input type="button"
							value="글 목록으로... " class="pull-right"
							onclick="location.href='qna.do'" /> <!-- <a class="btn btn-default" onclick="sendData()"> 등록 </a>
                    <a class="btn btn-default" type="reset"> reset </a>
                    <a class="btn btn-default" onclick="javascript:location.href='list.jsp'">글 목록으로...</a> -->
						</td>
					</tr>
				</form>
			</tbody>
		</table>
	</div>
	
	</div></div></div></section></div>
	
</body>
</html>
