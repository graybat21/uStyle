<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- Main content -->

<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>상품 정보</h1>
    </section>

    <!-- Main content -->
	<section class="content">
		<div class="row">
			<!-- left column -->
			<div class="col-md-12">
			<!-- general form elements -->
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">상품 정보</h3>
					</div>
					
					<form role="form" action="modifyPage" method="post">
						<input type="hidden" name="productid" value="${product.productid}">
						<input type="hidden" name="page" value="${page}">
						<%--input type="hidden" name="perPageNum" value="${cri.perPageNum}">
						<input type="hidden" name="searchType" value="${cri.searchType}">
						<input type="hidden" name="keyword" value="${cri.keyword}"--%>
					</form>
					
					<div class="box-body">		
					
						<div class="col-sm-8 form-group">
							<label for="exampleInputEmail1">상품명</label>
							<input type="text" name="productname" value="${product.productname}" class="form-control" readonly>
						</div>
						<div class="col-sm-4 form-group">
							<label for="exampleInputEmail1">브랜드</label>
							<input type="text" name="brand" value="${product.brand}" class="form-control" readonly>
						</div>		
						<div class="form-group">
							<label for="exampleInputPassword1">상세설명</label>
							<textarea class="form-control" name="description" rows="3" readonly>${product.description}</textarea>
						</div>
						<div class="col-sm-6 form-group">
							<label for="exampleInputEmail1">카테고리</label>
							<input type="text" name="category" value="${product.category}" class="form-control" readonly>
						</div>
						<div class="col-sm-6 form-group">
							<label for="exampleInputEmail1">서브 카테고리</label>
							<input type="text" name="subcategory" value="${product.subcategory}" class="form-control" readonly>
						</div>
						<div class="col-sm-6 form-group">
							<label for="exampleInputEmail1">정상가격</label>
							<input type="text" name="originalprice" value="${product.originalprice}" class="form-control" readonly>
						</div>
						<div class="col-sm-6 form-group">
							<label for="exampleInputEmail1">할인가격</label>
							<input type="text" name="saleprice" value="${product.saleprice}" class="form-control" readonly>
						</div>
					</div>
					<!--  /.box-body -->
					
					<ul class="mailbox-attachments clearfix uploadedList"></ul>
					<div class="box-footer">
						<button type="submit" class="btn btn-warning" id="modifyBtn">수정</button>
						<button type="submit" class="btn btn-danger" id="removeBtn">삭제</button>
						<button type="submit" class="btn btn-primary" id="goListBtn">상품 목록</button>
					</div>
				</div>
				<!--  /.box -->
			</div>
			<!-- /.col (left) -->
		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-rno={{rno}}>
<i class="fa fa-comments bg-blue"></i>
	<div class="timeline-item">
		<span class="time">
			<i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
		</span>
		<h3 class="timeline-header"><strong>{{rno}}</strong> -{{replyer}}</h3>
		<div class="timeline-body">{{replytext}}</div>
		<div class="timeline-footer">
			{{#eqReplyer replyer}}
			<a class="btn btn-primary btn-xs"
			data-toggle="modal" data-target="#modifyModal">Modify</a>
			{{/eqReplyer}}
		</div>
	</div>
</li>
{{/each}}
</script>

<script id="templateAttach" type="text/x-handlebars-template">
<li data-src='{{fullName}}'>
	<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" 
	alt="Attachment"></span>
	<div class="mailbox-attachment-info">
		<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	</div>
</li>
</script>

<script type="text/javascript">
var header = $("meta[name='_csrf_header']").attr("content");
var token  = $("meta[name='_csrf']").attr("content");

var productid = '${product.productid}';

$(document).ready(function() {
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$("#modifyBtn").on("click", function() {
		formObj.attr("action", "/admin/product/modifyProduct.do");
		formObj.attr("method", "get");
		formObj.submit();
	});
	
	$("#removeBtn").on("click", function() {
		var result = confirm("선택한 물품을 삭제하시겠습니까?");
		
		if ( result )
		{
			var arr = [];

			$.ajaxSetup({
			    beforeSend: function(xhr) {
			    	xhr.setRequestHeader(header, token);
			    }
			});
			
			$(".uploadedList li").each(function(index) {
				arr.push($(this).attr("data-src"));
			});
			
			if ( arr.length > 0 )
			{
				$.post("/deleteAllFiles", {files: arr}, function() {
					
				});
			}	
			
			formObj.attr("action", "/admin/product/deleteProduct.do");
			formObj.attr("method", "get");
			formObj.submit();
		}
		else
		{
			
		}
	});
	
	$("#goListBtn").on("click", function() {
		formObj.attr("method", "get");
		formObj.attr("action", "/admin/product/productList.do");
		formObj.submit();
	});
	
	var template = Handlebars.compile($("#templateAttach").html());
	
	$.getJSON("/admin/product/readProductImage/" + productid, function(list) {
		$(list).each(function() {
			if ( this != "/ustylenone.jpg" )		// 기본 이미지 삭제를 막기 위한 작업
			{
				var fileInfo = getFileInfo(this);
				
				var html = template(fileInfo);
				
				$(".uploadedList").append(html);
			}
		});
	});
	
	$(".uploadedList").on("click", ".mailbox-attachment-info a", function(event) {
		var fileLink = $(this).attr("href");
		
		if ( checkImageType(fileLink) )
		{
			event.preventDefault();
			
			var imgTag = $("#popup_img");
			imgTag.attr("src", fileLink);
			
			console.log(imgTag.attr("src"));
			
			$(".popup").show("slow");
			imgTag.addClass("show");
		}
	});
	
	$("#popup_img").on("click", function() {
		$(".popup").hide("slow");
	});
});
</script>
