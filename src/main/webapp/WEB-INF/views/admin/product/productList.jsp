<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="/resources/admin/js/commonBoard.js"></script>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Product 리스트</h1>
	</section>

	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">Product 리스트</h3>
						
						<form name="form_search" id="form_search" action="productList.do" onsubmit="return verifyOK()">
						<select name="o">
							<option value="productname" ${param.o eq "productname" ? "selected" : "" }>productname</option>
							<option value="productid" ${param.o eq "productid" ? "selected" : "" }>productid</option>
							<option value="brand" ${param.o eq "brand" ? "selected" : "" }>brand</option>
							<option value="category" ${param.o eq "category" ? "selected" : "" }>category</option>
							<option value="subcategory" ${param.o eq "subcategory" ? "selected" : "" }>subcategory</option>
							<option value="description" ${param.o eq "description" ? "selected" : "" }>description</option>
						</select>
						<input type="text" id="k" name="k" value="${searchKeyword}">
						<input type="submit" value="검색">
						</form>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<table id="example1" class="table table-bordered table-hover">
							<thead>
								<tr>
									<th style="width: 80px">productId</th>
									<th>picture</th>
									<th style="width: 120px">productName</th>
									<th style="width: 100px">brand</th>
									<th style="width: 100px">category</th>
									<th style="width: 100px">subcategory</th>
									<th>description</th>
									<th>originalprice</th>
									<th>saleprice</th>
									<th style="width: 60px">act</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${productList}" varStatus="status">
									<c:url var="addItem" value="/admin/item/addItem.do">
										<c:param name="productid" value="${list.productid}" />
									</c:url>
									<c:url var="readProduct" value="readProduct.do">
										<c:param name="productid" value="${list.productid}" />
										<c:param name="page" value="${pageMaker.page}" />
										<c:if test="${ not empty param.o }">
											<c:param name="o" value="${param.o}" />
											<c:param name="k" value="${param.k}" />
										</c:if>
									</c:url>
									<tr>
										<td><strong>${list.productid}</strong></td>
										<td>
										<img src="/displayFile?fileName=${list.pictureurl}" width="100px"></td>
										<td><a href="${readProduct}">${list.productname}</a></td>
										<td>${list.brand}</td>
										<td>${list.category}</td>
										<td>${list.subcategory}</td>
										<td>${list.description}</td>
										<td>${list.originalprice}</td>
										<td>${list.saleprice}</td>
										<td><a href="${addItem}"><input type="button" 
											value="item 추가" onclick="return addItem()"></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- /.box-body -->
					<!-- 페이징 -->
					<div class="box-footer clearfix">
						<ul class="pagination pagination-sm no-margin pull-right">
							<c:if test="${pageMaker.prev }">
								<c:if test="${ not empty param.o }">
									<c:url var="productListP" value="productList.do">
										<c:param name="page" value="${pageMaker.start - 1}" />
										<c:param name="o" value="${param.o}"></c:param>
										<c:param name="k" value="${param.k}"></c:param>
									</c:url>
								</c:if>
								<c:if test="${ empty param.o }">
									<c:url var="productListP" value="productList.do">
										<c:param name="page" value="${pageMaker.start - 1}" />
									</c:url>
								</c:if>
								<li><a href="${productListP }">이전</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" var="idx">
								<c:if test="${ not empty param.o }">
									<c:url var="productListP" value="productList.do">
										<c:param name="page" value="${idx}" />
										<c:param name="o" value="${param.o}"></c:param>
										<c:param name="k" value="${param.k}"></c:param>
									</c:url>
								</c:if>
								<c:if test="${ empty param.o }">
									<c:url var="productListP" value="productList.do">
										<c:param name="page" value="${idx}" />
									</c:url>
								</c:if>
								<li class='<c:out value="${idx == pageMaker.page ? 'active' : ''}"/>'>
									<a href='${productListP}'>${idx}</a>
								</li>
								
							</c:forEach>
							<c:if test="${pageMaker.next}">
								<c:if test="${ not empty param.o }">
									<c:url var="productListP" value="productList.do">
										<c:param name="page" value="${pageMaker.end + 1}" />
										<c:param name="o" value="${param.o}"></c:param>
										<c:param name="k" value="${param.k}"></c:param>
									</c:url>
								</c:if>
								<c:if test="${ empty param.o }">
									<c:url var="productListP" value="productList.do">
										<c:param name="page" value="${pageMaker.end + 1}" />
									</c:url>
								</c:if>
								<li><a href="${productListP}">다음</a></li>
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
