<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
<div class="container">
<table class="table table-bordered">
    <thead>
        <caption> 글쓰기 </caption>
    </thead>
    
    <tbody>
            <tr>
                <th>제목: </th>
                <td>${notice.title }</td>
            </tr>
            <tr>
                <th>내용: </th>
                <td>${notice.content }</td>
            </tr>
            <tr>
                <th>첨부파일: </th>
                <td>...</td>
            </tr>
            <!-- <tr>
                <th>비밀번호: </th>
                <td><input type="password" placeholder="비밀번호를 입력하세요" class="form-control"/></td>
            </tr> -->
            
            <tr>
                <td colspan="2">
                    <input type="button" value="글 목록으로... " class="pull-right" onclick="location.href='notice.do'"/>
                    <input type="button" value="글 수정 " class="pull-right" onclick="location.href='noticeModify.do'"/>
                    <!-- <a class="btn btn-default" onclick="sendData()"> 등록 </a>
                    <a class="btn btn-default" type="reset"> reset </a>
                    <a class="btn btn-default" onclick="javascript:location.href='list.jsp'">글 목록으로...</a> -->
                </td>
            </tr>
    </tbody>
</table>
</div>
</body>
</html>
