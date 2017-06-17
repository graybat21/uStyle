<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>공지사항게시판</h1>
		</section>

		<section class="content">
			<div class="row">
				<div class="col-xs-12">
					<div class="box">
						<div class="box-header">
							<h3 class="box-title">공지사항 리스트</h3>
							
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
<table class="table table-bordered">
    <thead>
        <caption> 글쓰기 </caption>
    </thead>
    
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
            <!-- <tr>
                <th>비밀번호: </th>
                <td><input type="password" placeholder="비밀번호를 입력하세요" class="form-control"/></td>
            </tr> -->
            
            <tr>
                <td colspan="2">
                    <input type="button" value="글 목록으로... " class="pull-right" onclick="location.href='qna.do'"/>
                    <input type="button" value="답변하기 " class="pull-right" onclick="location.href='qnaReply.do?parent=${qna.bno}'"/>
                    <input type="button" value="삭제하기" class="pull-right" onclick="location.href='qnaDelete.do?bno=${qna.bno}'"/>
                </td>
            </tr>
    </tbody>
</table>
</div>
</div></div></div></section></div>
</body>
</html>
