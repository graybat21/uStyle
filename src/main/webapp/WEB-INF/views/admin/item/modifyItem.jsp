<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/resources/js/commonItem.js"></script>
<style>
.fileDrop {
	width: 80%;
	height: 100px;
	border: 1px dotted gray;
	background-color: lightslategrey;
	margin: auto;
}
</style>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
	  <h1>Modify Item</h1>
	</section>

    <!-- Main content -->
    <section class="content">
		<div class="row">
			<!-- left column -->
			<div class="col-md-12">
				<!-- general form elements -->
				<div class="box box-primary">
					<div class="box-header">
					</div>
					<!-- /.box-header -->
					
					<form id="registerItemForm" name="registerItemForm" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<div class="box-body">
							<div class="col-sm-3 form-group">
								<label for="exampleInputEmail1">상품 색상</label>
								<input type="text" name="color" value="${item.color}" class="form-control" placeholder="상품의 색상을 입력하세요." readonly>
							</div>
							<div class="col-sm-3 form-group">
								<label for="exampleInputEmail1">사이즈</label>
								<input type="text" name="size" value="${item.size}" class="form-control" placeholder="상품의 사이즈를 입력하세요." readonly>
							</div>
							<div class="col-sm-4 form-group">
								<label for="exampleInputEmail1">상품 고유번호</label>
								<input type="text" name="productid" value="${item.productid}" class="form-control" placeholder="상품의 고유번호를 입력하세요." readonly>
							</div>
							<div class="col-sm-2 form-group">
								<label for="exampleInputEmail1">재고수량</label>
								<input type="text" name="stock" value="${item.stock}" class="form-control" placeholder="숫자로 입력하세요." onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>
							</div>
							<div class="col-sm-6 form-group">
								<label for="exampleInputEmail1">정상가격</label>
								<input type="text" name="originalprice" value="${item.originalprice}" class="form-control" placeholder="상품의 할인전 가격을 입력하세요." onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>
							</div>
							<div class="col-sm-6 form-group">
								<label for="exampleInputEmail1">할인가격</label>
								<input type="text" name="saleprice" value="${item.saleprice}" class="form-control" placeholder="상품의 할인후 가격을 입력하세요." onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>
							</div>
						</div>
						<!-- /.box-body -->
						
						<div class="box-footer">
							<button type="submit" class="btn btn-primary" onclick="return verifyOK()">Submit</button>
						</div>
					</form>
				</div>
				<!-- /.box -->
			</div>
			<!--/.col (left) -->
		</div>
		<!-- /.row -->
	</section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
  
