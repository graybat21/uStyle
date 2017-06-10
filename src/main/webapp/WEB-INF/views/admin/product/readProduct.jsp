<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- Main content -->

<%--style type="text/css">
	.popup { position: absolute; }
	.back { background-color: gray; opacity: 0.5; width: 100%; height: 300%; overflow: hidden; z-index: 1101; }
	.front { z-index: 1110; opacity: 1; border: 1px; margin: auto; }
	.show {
		position: relative;
		max-width: 1200px;
		max-height: 800px;
		overflow: auto;
	}
</style--%>

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
					</div>
					<!--  /.box-body -->
					
					<ul class="mailbox-attachments clearfix uploadedList"></ul>
						<div class="box-footer">
							<button type="submit" class="btn btn-warning" id="modifyBtn">Modify</button>
							<button type="submit" class="btn btn-danger" id="removeBtn">REMOVE</button>
							<button type="submit" class="btn btn-primary" id="goListBtn">GO LIST</button>
						</div>
				</div>
				<!--  /.box -->
			</div>
			<!-- /.col (left) -->
		</div>
		<!-- /.row -->
		
		<%--div class="row">
			<div class="col-md-12">
				<div class="box box success">
					<div class="box-header">
						<h3 class="box-title">ADD NEW REPLY</h3>
					</div>
					<c:if test="${ not empty login }">
						<div class="box-body">
							<label for="exampleInputEmail1">Writer</label>
							<input class="form-control" type="text" id="newReplyWriter" value="${ login.uid }" readonly="readonly">
							<label for="exampleInputEmail1">Reply Text</label>
							<input class="form-control" type="text" placeholder="REPLY TEXT" id="newReplyText">
						</div>
						<!-- /.box-body -->
						<div class="box-footer">
							<button type="button" class="btn btn-primary" id="replyAddBtn">ADD REPLY</button>
						</div>
					</c:if>
					
					<c:if test="${ empty login }">
						<!-- /.box-body -->
						<div class="box-footer">
							<div><a href="javascript:goLogin()" >Login Please</a></div>
						</div>
					</c:if>
					
				</div>
				<!-- The time line -->
				<ul class="timeline">
					<!-- timeline time label -->
					<li class="time-label" id="repliesDiv"><span class="bg-green">
						Replies List <small id="replycntSmall"> [ ${boardVO.replycnt} ]</small>
						</span>
					</li>
				</ul>
				
				<div class="text-center">
					<ul id="pagination" class="pagination pagination-sm no-margin">
					
					</ul>
				</div>
			</div>
			<!-- /.col -->
		</div--%>
		<!-- /.row -->
		
		<!-- Modal -->
		<div id="modifyModal" class="modal modal-primary fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content -->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-diamiss="modal">&times;</button>
						<h4 class="modal-title"></h4>
					</div>
					<div class="modal-body" data-rno>
						<p><input type="text" id="replytext" class="form-control"></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
						<button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	
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

<script>
	
	var productid = ${product.productid};
	
	var header = $("meta[name='_csrf_header']").attr("content");
	var token  = $("meta[name='_csrf']").attr("content");
	
	
	$(document).ready(function() {
		
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		$("#modifyBtn").on("click", function() {
			formObj.attr("action", "/admin/product/modifyProduct.do");
			formObj.attr("method", "get");
			formObj.submit();
		});
		
		$("#removeBtn").on("click", function() {
			var result = confirm("선택한 물품을 삭제하겠습니까?");
			
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