<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <input type="button" value="글 수정 " class="pull-right" onclick="location.href='qnaModify.do'"/>
                    <c:if test="${qna.username == sessionScope.session_username }">
                    <input type="button" value="글 삭제 " class="pull-right" onclick="location.href='qnaDelete.do?bno=${qna.bno}'"/>
                    </c:if>
                    <%-- <input type="button" value="글 답변 " class="pull-right" onclick="location.href='qnaReply.do?bno=${qna.bno}'"/> --%>
                </td>
            </tr>
    </tbody>
</table>
</div>
</body>
</html>
