<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Content Wrapper. Contains page content -->
<script>
$(function(){
	if(searchKeyword != null){
		
	}
});
</script>
<body>
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>회원 리스트</h1>
		</section>

		<section class="content">
			<div class="row">
				<div class="col-xs-12">
					<div class="box">
						<div class="box-header">
							<h3 class="box-title">회원리스트</h3>
							
							<form action="userList.do">
							<select name="o">
								<option value="username" ${param.o eq "username" ? "selected" : "" }>username</option>
								<option value="realname" ${param.o eq "realname" ? "selected" : "" }>realname</option>
								<option value="email" ${param.o eq "email" ? "selected" : "" }>email</option>
								<option value="phone" ${param.o eq "phone" ? "selected" : "" }>phone</option>
								<option value="addr1" ${param.o eq "addr1" ? "selected" : "" }>address</option>
							</select>
							<input type="text" name="k" value="${searchKeyword }">
							<input type="submit" value="검색">
							</form>
							
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<table id="example1" class="table table-bordered table-hover">
								<thead>
									<tr>
										<th>username / realname</th>
										<th>email</th>
										<th>phone</th>
										<th>point</th>
										<th>auth</th>
										<th>address</th>
										<th>create_time</th>
										<th style="width: 60px">act</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="list" items="${userList}" varStatus="status">
										<c:url var="deleteUser" value="/admin/userDelete.do">
											<c:param name="username" value="${list.username }" />
										</c:url>
										<c:url var="initPoint" value="/admin/initializePoint.do">
											<c:param name="username" value="${list.username }" />
										</c:url>
										<tr>
											<td><strong>${list.username }</strong> <span>${list.realname}</span></td>
											<td>${list.email }</td>
											<td>${list.phone }</td>
											<td>${list.point}</td>
											<td>${list.auth == 'y' }</td>
											<td>${list.addr1 }&nbsp;${list.addr2 }&nbsp;${list.postcode }</td>
											<td>${list.create_time }</td>
											<td><a href="${deleteUser }"><input type="button"
													value="탈 퇴" onclick="return deleteUser()"></a> <a
												href="${initPoint }"><input type="button" value="0포인트"
													onclick="return initPoint()"></a></td>
										</tr>
									</c:forEach>
									<script>
										function deleteUser() {
											return confirm("선택한 회원을 탈퇴시키겠습니까?");
										}
										function initPoint() {
											return confirm("선택한 회원의 포인트롤 초기화시키겠습니까?");
										}
									</script>
								</tbody>
							</table>
						</div>
						<!-- /.box-body -->
						<!-- 페이징 -->
						<div class="box-footer clearfix">
							<ul class="pagination pagination-sm no-margin pull-right">
								<c:if test="${pageMaker.prev }">
									<c:if test="${searchKeyword != null }">
										<c:url var="userListP" value="userList.do">
											<c:param name="page" value="${pageMaker.start - 1}" />
											<c:param name="o" value="${searchOption }"></c:param>
											<c:param name="k" value="${searchKeyword }"></c:param>
										</c:url>
									</c:if>
									<c:if test="${searchKeyword == null }">
										<c:url var="userListP" value="userList.do">
											<c:param name="page" value="${pageMaker.start - 1}" />
										</c:url>
									</c:if>
									<li><a href="${userListP }">이전</a></li>
								</c:if>
								<c:forEach begin="${pageMaker.start }"
									end="${pageMaker.end}" var="idx">
									<c:if test="${searchKeyword != null }">
										<c:url var="userListP" value="userList.do">
											<c:param name="page" value="${idx}" />
											<c:param name="o" value="${searchOption }"></c:param>
											<c:param name="k" value="${searchKeyword }"></c:param>
										</c:url>
									</c:if>
									<c:if test="${searchKeyword == null }">
										<c:url var="userListP" value="userList.do">
											<c:param name="page" value="${idx}" />
										</c:url>
									</c:if>
									<li class='<c:out value="${idx == pageMaker.page ? 'current' : ''}"/>'>
										<a href='${userListP }'>${idx}</a>
									</li>
									
								</c:forEach>
								<c:if test="${pageMaker.next }">
									<c:if test="${searchKeyword != null }">
										<c:url var="userListP" value="userList.do">
											<c:param name="page" value="${pageMaker.end + 1}" />
											<c:param name="o" value="${searchOption }"></c:param>
											<c:param name="k" value="${searchKeyword }"></c:param>
										</c:url>
									</c:if>
									<c:if test="${searchKeyword == null }">
										<c:url var="userListP" value="userList.do">
											<c:param name="page" value="${pageMaker.end + 1}" />
										</c:url>
									</c:if>
									<li><a href="${userListP }">다음</a></li>
								</c:if>
							</ul>
						</div>
					</div>
					<!-- /.box -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->

		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->




</body>