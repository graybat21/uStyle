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

<script>
function userDelete(){
	
}
</script>
<!-- Content Wrapper. Contains page content -->
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
						<td>${status.count }</td>
						<td><strong>${list.username }</strong> 
							<span>${list.realname}</span></td>
						<td>${list.email }</td>
						<td>${list.phone }</td>
						<td>${list.point}</td>
						<td>${list.create_time }</td>
						<td>${list.addr1 }&nbsp;${list.addr2 }&nbsp;${list.postcode }</td>
						<td><a href="${deleteUser }"><input type="button" value="탈 퇴" onclick="return deleteUser()"></a>
						<a href="${initPoint }"><input type="button" value="0포인트" onclick="return initPoint()"></a></td>
					</tr>
				</c:forEach>
					<script>		
						function deleteUser() {
							return confirm("선택한 회원을 탈퇴시키겠습니까?");
						}
						function initPoint(){
							return confirm("선택한 회원의 포인트롤 초기화시키겠습니까?");
						}
					</script>
                </tbody>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
      <!-- 페이징 -->
						<div class="box-footer clearfix">
							<ul class="pagination pagination-sm no-margin pull-right">
								<c:if test="${userPageMaker.prev }">
									<li><a href='userList.do?page=${userPageMaker.start -1}'>이전</a></li>
								</c:if>
								<c:forEach begin="${userPageMaker.start }"
									end="${userPageMaker.end}" var="idx">
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





		<%-- <section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-header with-border">
							<h3 class="box-title">Bordered Table</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<table class="table table-bordered">
								
								<tr>
									<th style="width: 10px">#</th>
									<th>username / realname</th>
									<th>email</th>
									<th>phone</th>
									<th>point</th>
									<th>address</th>
									<th>create_time</th>
									<th style="width: 60px">act</th>
								</tr>
								
							<c:forEach var="list" items="${userList}" varStatus="status">
								<c:url var="deleteUser" value="/admin/userDelete.do">
									<c:param name="username" value="${list.username }" />
								</c:url>
								<c:url var="initPoint" value="/admin/initializePoint.do">
									<c:param name="username" value="${list.username }" />
								</c:url>
								<tr>
									<td>${status.count }</td>
									<td><strong>${list.username }</strong> 
										<span>${list.realname}</span></td>
									<td>${list.email }</td>
									<td>${list.phone }</td>
									<td>${list.point}</td>
									<td>${list.create_time }</td>
									<td>${list.addr1 }&nbsp;${list.addr2 }&nbsp;${list.postcode }</td>
									<td><a href="${deleteUser }"><input type="button" value="탈 퇴" onclick="return deleteUser()"></a>
									<a href="${deleteUser }"><input type="button" value="0포인트" onclick="return initPoint()"></a></td>
								</tr>
							</c:forEach>
								<script type="text/javascript">		
									function deleteUser() {
										return confirm("선택한 회원을 탈퇴시키겠습니까?");
									}
									function initPoint(){
										return confirm("선택한 회원의 포인트롤 초기화시키겠습니까?");
									}
								</script>	
							</table>
						</div>
						<!-- 페이징 -->
						<div class="box-footer clearfix">
							<ul class="pagination pagination-sm no-margin pull-right">
								<c:if test="${userPageMaker.prev }">
									<li><a href='userList.do?page=${userPageMaker.start -1}'>이전</a></li>
								</c:if>
								<c:forEach begin="${userPageMaker.start }"
									end="${userPageMaker.end}" var="idx">
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
					</div>
		</section> --%>



</body>