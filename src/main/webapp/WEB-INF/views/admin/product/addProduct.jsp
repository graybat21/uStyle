<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/resources/js/commonProduct.js"></script>
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
      <h1>Add Product</h1>
    </section>

    <!-- Main content -->
    <section class="content">
		<div class="row">
			<!-- left column -->
			<div class="col-md-12">
				<!-- general form elements -->
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">Add Product</h3>
					</div>
					<!-- /.box-header -->
					
					<form id="registerProductForm" name="registerProductForm" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<div class="box-body">
							<div class="col-sm-8 form-group">
								<label for="exampleInputEmail1">상품명</label>
								<input type="text" name="productname" value="${product.productname}" class="form-control" placeholder="상품명을 입력하세요.">
							</div>
							<div class="col-sm-4 form-group">
								<label for="exampleInputEmail1">브랜드</label>
								<input type="text" name="brand" value="${product.brand}" class="form-control" placeholder="상품의 브랜드를 입력하세요.">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">상세설명</label>
								<textarea class="form-control" name="description" rows="3"
									placeholder="상세 설명을 입력하세요.">${product.description}</textarea>
							</div>
							<div class="col-sm-6 form-group">
								<label for="exampleInputEmail1">카테고리</label>
								<input type="text" name="category" value="${product.category}" class="form-control" placeholder="상품의 카테고리를 입력하세요.">
							</div>
							<div class="col-sm-6 form-group">
								<label for="exampleInputEmail1">서브 카테고리</label>
								<input type="text" name="subcategory" value="${product.subcategory}" class="form-control" placeholder="상품의 서브 카테고리를 입력하세요.">
							</div>
							<div class="col-sm-6 form-group">
								<label for="exampleInputEmail1">정상가격</label>
								<input type="text" name="originalprice" value="${product.originalprice}" class="form-control" placeholder="상품의 할인전 가격을 입력하세요." onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>
							</div>
							<div class="col-sm-6 form-group">
								<label for="exampleInputEmail1">할인가격</label>
								<input type="text" name="saleprice" value="${product.saleprice}" class="form-control" placeholder="상품의 할인후 가격을 입력하세요." onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">상품의 이미지 첨부(아래의 영역에 이미지를 한 장씩 Drag and Drop해주시면 됩니다)</label>
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
							
							<button type="button" class="btn btn-primary" onclick="return verifyOK()">Submit</button>
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
  
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script id="template" type="text/x-handlebars-template">
<li>
	<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}"
	alt="Attachment"></span>
	<div class="mailbox-attachment-info">
		<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
		<a href="{{fullName}}"	
			class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
	</div>
</li>
</script>

<script type="text/javascript">
var template = Handlebars.compile($("#template").html());

var header = $("meta[name='_csrf_header']").attr("content");
var token  = $("meta[name='_csrf']").attr("content");

$(".fileDrop").on("dragenter dragover", function(event) {
	event.preventDefault();
});

$(".fileDrop").on("drop", function(event) {
	event.preventDefault();
	
	var files = event.originalEvent.dataTransfer.files;
	
	var file = files[0];
	
	console.log(file);
	var formData = new FormData();
	
	formData.append("file", file);
	
	$.ajax({
		url: '/uploadAjax',
		data: formData,
		dataType: 'text',
		processData: false,
		contentType: false,
		type: 'POST',
		beforeSend: function(xhr){
			xhr.setRequestHeader(header, token);
	    },
		success: function(data) {
			if ( checkImageType(data) )		// 이미지 업로드만 가능하게 함
			{
				var fileInfo = getFileInfo(data);
				
				var html = template(fileInfo);
				
				$(".uploadedList").append(html);
			}
			else
			{
				alert("이미지만 업로드 가능합니다.");
			}
		}	
	});
});

$("#registerProductForm").submit(function(event) {
	event.preventDefault();
	
	var that = $(this);
	
	var str = "";
	
	$(".uploadedList .delbtn").each(function(index) {
		str += "<input type='hidden' name='files[" + index + "]' value='" 
			+ $(this).attr("href") + "'> ";
	});
	
	that.append(str);
	
	that.get(0).submit();
});

$(".uploadedList").on("click", ".delbtn", function(event){

	event.preventDefault();

	var that = $(this);

	//alert("DELETE FILE");

	$.ajax({
		url: "/deleteFile",
		type: "POST",
		beforeSend: function(xhr){
			xhr.setRequestHeader(header, token);
	    },
		data: {fileName:$(this).attr("href")},
		dataType: "text",
		success: function(result){
			console.log("RESULT: " + result);
			if ( result == 'deleted' )
				that.closest("li").remove();
		}
	});
});
</script>
