<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.fileDrop {
	width: 80%;
	height: 100px;
	border: 1px dotted gray;
	background-color: lightslategrey;
	margin: auto;
}
</style>
<script>
function onlyNumber(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		return false;
}
function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
}
</script>
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>Add Item</h1>
    </section>

    <!-- Main content -->
    <section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">Add Item</h3>
				</div>
				<!-- /.box-header -->
				
				<form id="registerForm" role="form" method="post">
					<div class="box-body">
						<div class="col-sm-3 form-group">
							<label for="exampleInputEmail1">상품 색상</label>
							<input type="text" name="color" class="form-control" placeholder="상품의 색상을 입력하세요.">
						</div>
						<div class="col-sm-3 form-group">
							<label for="exampleInputEmail1">사이즈</label>
							<input type="text" name="size" class="form-control" placeholder="상품의 사이즈를 입력하세요.">
						</div>
						<div class="col-sm-4 form-group">
							<label for="exampleInputEmail1">상품 고유번호</label>
							<input type="text" name="productid" class="form-control" placeholder="상품의 고유번호를 입력하세요." value="${productid }">
						</div>
						<div class="col-sm-2 form-group">
							<label for="exampleInputEmail1">재고수량</label>
							<input type="text" name="stock" class="form-control" placeholder="숫자로 입력하세요." onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>
						</div>
						<div class="col-sm-6 form-group">
							<label for="exampleInputEmail1">정상가격</label>
							<input type="text" name="originalprice" class="form-control" placeholder="상품의 할인전 가격을 입력하세요." onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>
						</div>
						<div class="col-sm-6 form-group">
							<label for="exampleInputEmail1">할인가격</label>
							<input type="text" name="saleprice" class="form-control" placeholder="상품의 할인후 가격을 입력하세요." onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>
						</div>
					</div>
					<!-- /.box-body -->
					
					<div class="box-footer">
						<div>
							<hr>
						</div>
						
						<ul class="mailbox-attachments clearfix uploadedList">
						</ul>
						
						<button type="submit" class="btn btn-primary">Submit</button>
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
  