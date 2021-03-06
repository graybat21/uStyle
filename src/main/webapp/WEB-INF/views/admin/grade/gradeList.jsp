<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Grade 리스트</h1>
	</section>

	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">Grade 리스트</h3>
						<a href="modifyAllUsersGrade.do">
						<input type="button" value="유저 등급 업데이트"></a>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<table id="example1" class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>idx</th>
									<th style="width: 200px">grade</th>
									<th>point_ratio</th>
									<th>buy_term</th>
									<th>min</th>
									<th>max</th>
									<th>etc</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${itemList.size() == 0 }">
									<tr><td colspan="9" style="text-align: center"><strong>자료가 없습니다.</strong></td></tr>
								</c:if>
								<c:if test="${itemList.size() != 0 }">
								<c:forEach var="list" items="${gradeList}" varStatus="status">
									<form action="gradeUpdate.do" method="post">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									<tr>
										<td><strong><input type="text" name="idx" value="${list.idx}" readonly></strong></td>
										<td><input type="text" name="grade" value="${list.grade}"></td>
										<td><input type="text" name="point_ratio" value="${list.point_ratio}"></td>
										<td><input type="text" name="buy_term" value="${list.buy_term}"></td>
										<td><input type="text" name="min" value="${list.min}"></td>
										<td><input type="text" name="max" value="${list.max}"></td>
										<td>
										<input type="submit" value="수정">
										</td>
									</tr>
									</form>
								</c:forEach>
								</c:if>
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
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
