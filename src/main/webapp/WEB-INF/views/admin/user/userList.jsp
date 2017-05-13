<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
li .list_title {margin-bottom:5px;color:#707070;font-weight:500;line-height:1.5;}
li .list_title strong {display:inline-block;color:#353535;vertical-align:middle;}
li .list_title span {display:inline-block;vertical-align:middle;max-width:82%;text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;overflow:hidden;color:#353535;}
li .list_date {color:#707070;font-size:0.75rem;padding-left:2px;}
li:hover {background:url('https://img.goodchoice.kr/images/web_v2/service/ic_list_arrow_on.png') no-repeat 97% 50%;background-size:12px auto;}
li:hover .list_title,
li:hover .list_title strong {color:#e62a4a;}
/* paging */
.svc_paging {padding:30px 0;text-align:center;}
.svc_paging ul {display:inline-block;border:1px solid #ccc;border-radius:5px;}
.svc_paging ul li {float:left;display:inline-block;border-right:1px solid #ddd;box-sizing:border-box;}
.svc_paging ul li a {display:inline-block;min-width:28px;height:38px;line-height:42px;font-weight:500;text-align:center;color:#707070;vertical-align:middle;}
.svc_paging ul li.page_first a {background:url('https://img.goodchoice.kr/images/web_v2/service/ic_page_first.png') no-repeat 50% 50%;background-size:auto 10px;}
.svc_paging ul li.page_prev a {background:url('https://img.goodchoice.kr/images/web_v2/service/ic_page_prev.png') no-repeat 50% 50%;background-size:auto 10px}
.svc_paging ul li.page_next a {background:url('https://img.goodchoice.kr/images/web_v2/service/ic_page_next.png') no-repeat 50% 50%;background-size:auto 10px}
.svc_paging ul li.page_last a {background:url('https://img.goodchoice.kr/images/web_v2/service/ic_page_last.png') no-repeat 50% 50%;background-size:auto 10px;}
.svc_paging ul li:last-child {border-right:none;}
.svc_paging ul li:last-child a {border-radius:0 5px 5px 0;}
.svc_paging ul li:first-child a {border-radius:5px 0 0 5px;}
.svc_paging ul li:hover a, .svc_paging ul li.active a {color:#e62a4a;background-color:#fff;}

</style>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>회원 리스트</h1>
		<!-- <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Examples</a></li>
        <li class="active">404 error</li>
      </ol> -->
	</section>

	<!-- Main content -->
	<section class="content">
		<c:forEach var="list" items="${userList}">
			<%-- <c:url var="viewURL" value="userDetail.do">
				<c:param name="no" value="${list.no }" />
			</c:url> --%>
			<ul>
				<li><%-- <a href="${viewURL }"> --%>
						<p class="list_title" align="left">
							<strong>${list.username }</strong>
							<span>${list.email } / ${list.realname} / ${list.point}</span>
						</p>
						<p class="list_date">
							<fmt:formatDate value="${list.create_time }" pattern="yyyy.MM.dd" />
						</p>
				</li>
			</ul>
		</c:forEach>

		<!-- 페이징 -->
		<div class="svc_paging">
		<ul class="pageUL">
			<c:if test="${userPageMaker.prev }">
				<li><a href='userList.do?page=${userPageMaker.start -1}'>이전</a></li>
			</c:if>
			<c:forEach begin="${userPageMaker.start }" end="${userPageMaker.end}"
				var="idx">
				<li
					class='<c:out value="${idx == userPageMaker.page ? 'current' : ''}"/>'>
					<a href='userList.do?page=${idx}'>${idx}</a>
				</li>
			</c:forEach>
			<c:if test="${userPageMaker.next }">
				<li><a href='userList.do?page=${userPageMaker.end +1}'>다음</a></li>
			</c:if>
		</ul>
		</div>
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

