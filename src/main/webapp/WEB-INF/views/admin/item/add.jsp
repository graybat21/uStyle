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
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Add Item
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Examples</a></li>
        <li class="active">404 error</li>
      </ol>
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
						<div class="form-group">
							<label for="exampleInputEmail1">상품명</label>
							<input type="text" name="itemName" class="form-control" placeholder="상품명을 입력하세요.">
						</div>
						<div class="col-sm-6 form-group">
							<label for="exampleInputEmail1">상품 색상</label>
							<input type="text" name="color" class="form-control" placeholder="상품의 색상을 입력하세요.">
						</div>
						<div class="col-sm-6 form-group">
							<label for="exampleInputEmail1">사이즈</label>
							<input type="text" name="size" class="form-control" placeholder="상품의 사이즈를 입력하세요.">
						</div>
						<div class="col-sm-6 form-group">
							<label for="exampleInputEmail1">브랜드</label>
							<input type="text" name="brand" class="form-control" placeholder="상품의 브랜드를 입력하세요.">
						</div>
						<div class="col-sm-6 form-group">
							<label for="exampleInputEmail1">공통 고유번호</label>
							<input type="text" name="productid" class="form-control" placeholder="상품의 공통 고유번호를 입력하세요.">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">상세설명</label>
							<textarea class="form-control" name="description" rows="3"
								placeholder="상세 설명을 입력하세요."></textarea>
						</div>
						<div class="col-sm-5 form-group">
							<label for="exampleInputEmail1">정상가격</label>
							<input type="text" name="originalprice" class="form-control" placeholder="상품의 할인전 가격을 입력하세요.">
						</div>
						<div class="col-sm-5 form-group">
							<label for="exampleInputEmail1">할인가격</label>
							<input type="text" name="saleprice" class="form-control" placeholder="상품의 할인후 가격을 입력하세요.">
						</div>
						<div class="col-sm-2 form-group">
							<label for="exampleInputEmail1">재고수량</label>
							<input type="text" name="stock" class="form-control" placeholder="숫자로 입력하세요.">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">공통 고유번호</label>
							<input type="text" name="productid" class="form-control" placeholder="상품의 공통 고유번호를 입력하세요.">
						</div>
						<div class="col-sm-6 form-group">
							<label for="exampleInputEmail1">카테고리</label>
							<input type="text" name="category" class="form-control" placeholder="상품의 카테고리를 입력하세요.">
						</div>
						<div class="col-sm-6 form-group">
							<label for="exampleInputEmail1">서브 카테고리</label>
							<input type="text" name="subcategory" class="form-control" placeholder="상품의 서브 카테고리를 입력하세요.">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">상품의 이미지 첨부(아래의 영역에 이미지를 Drag & Drop해주시면 됩니다)</label>
							<div class="fileDrop"></div>
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
  
