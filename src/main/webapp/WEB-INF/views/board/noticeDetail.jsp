<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<div class="container" style="height: auto; margin: 30px;">
		<div class="box-collateral box-reviews em-line-01" id="customer-reviews">
			<div class="form_review no_reviews">
			    <div class="form-add" id="customer_review_form">
			        <div class="em-block-title">
			            <h2>Notice</h2>
			        </div>
		            <fieldset>
		                <h3>공지사항</h3>
		                <ul class="form-list">
		                    <li>
		                        <label for="username_field" class="required">Title</label>
		                        <div class="input-box">
		                            <input type="text" name="title" id="title" class="input-text required-entry" value="${notice.title}" disabled="disabled"/>
		                        </div>
		                    </li>
		                    <li>
		                        <label for="contents_field" class="required">Contents</label>
		                        <div class="input-box" style="min-height: 100px; background-color: #ECF6CE; padding-top: 10px; padding-left: 10px; padding-right: 10px; padding-bottom: 10px;">
		                            ${notice.content}
		                        </div>
		                    </li>
		                </ul>
		            </fieldset>
		            <div class="board-button">
		            	<c:url var="noticeList" value="notice.do">
							<c:param name="page" value="${param.page}" />
							<c:if test="${ not empty param.o }">
								<c:param name="o" value="${param.o}" />
								<c:param name="k" value="${param.k}" />
							</c:if>
						</c:url>
						<button class="btn btn-default" onclick="location.href='${noticeList}'">목록</button>
				    </div>
			    </div>
			</div><!-- /.form_review -->
		</div><!-- /.box-collateral -->
	</div>
	<!-- /.container -->
</div>
