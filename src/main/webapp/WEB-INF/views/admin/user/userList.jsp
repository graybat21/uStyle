<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.svc_contents .svc_list li .list_title {margin-bottom:5px;color:#707070;font-weight:500;line-height:1.5;}
.svc_contents .svc_list li .list_title strong {display:inline-block;color:#353535;vertical-align:middle;}
.svc_contents .svc_list li .list_title span {display:inline-block;vertical-align:middle;max-width:82%;text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;overflow:hidden;color:#353535;}
.svc_contents .svc_list li .list_date {color:#707070;font-size:0.75rem;padding-left:2px;}
.svc_contents .svc_list li:hover {background:url('https://img.goodchoice.kr/images/web_v2/service/ic_list_arrow_on.png') no-repeat 97% 50%;background-size:12px auto;}
.svc_contents .svc_list li:hover .list_title,
.svc_contents .svc_list li:hover .list_title strong {color:#e62a4a;}

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

	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

