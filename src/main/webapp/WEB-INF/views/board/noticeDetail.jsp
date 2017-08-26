<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <!-- <caption> 글쓰기 </caption> -->
    </thead>
    
    <tbody>
    	<div class="container" style="height: auto; margin: 30px;">
			<div class="box-collateral box-reviews em-line-01" id="customer-reviews">
				<div class="form_review no_reviews">
				    <div class="form-add" id="customer_review_form">
				    	<!-- <form method="post" onsubmit="return verifyOK()"> -->
				    		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					        <div class="em-block-title">
					            <h2>Notice</h2>
					        </div>
				            <fieldset>
				                <h3>공지사항</h3>
				                <ul class="form-list">
				                    <li>
				                        <label for="username_field" class="required"><em>*</em>Title</label>
				                        <div class="input-box">
				                            <input type="text" name="noticetitle" id="pinboard-name" class="input-text required-entry" value="${notice.title}" disabled="disabled"/>
				                        </div>
				                    </li>
				                    <li>
				                        <label for="contents_field" class="required"><em>*</em>Contents</label>
				                        <div class="input-box" style="min-height: 100px; background-color: #ECF6CE; padding-top: 10px; padding-left: 10px; padding-right: 10px; padding-bottom: 10px;">
				                            <!-- <textarea name="noticecontent" id="pinboard-content" cols="5" rows="3" class="required-entry" disabled="disabled"> -->
				                            ${notice.content}
				                            <!-- </textarea> -->
				                        </div>
				                    </li>
				                </ul>
				            </fieldset>
				            <div class="board-button">
								<button class="btn btn-default" onclick="location.href='/notice.do'">목록</button>
						    </div>
						    
				    </div>
				</div><!-- /.form_review -->
			</div><!-- /.box-collateral -->
		</div>
		<!-- /.container -->
    
    </tbody>
</table>
</div>
</body>
</html>
