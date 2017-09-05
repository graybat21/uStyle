<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="/resources/admin/js/commonBoard.js"></script>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Item 리스트</h1>
	</section>

	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">Item 리스트</h3>
						<form name="form_search" id="form_search" action="itemList.do" onsubmit="return verifyOK()">
							<select name="o">
								<option value="productname" ${param.o eq "productname" ? "selected" : "" }>productname</option>
								<option value="productid" ${param.o eq "productid" ? "selected" : "" }>productid</option>
								<option value="itemid" ${param.o eq "itemid" ? "selected" : "" }>itemid</option>
							</select>
							<input type="text" name="k" value="${searchKeyword}">
							<input type="submit" value="검색">
						</form>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<table id="example1" class="table table-bordered table-hover">
							<thead>
								<tr>
									<th style="width: 100px">productId</th>
									<th style="width: 200px">productName</th>
									<th>itemId</th>
									<th>originalPrice</th>
									<th>salePrice</th>
									<th>color</th>
									<th>size</th>
									<th>stock</th>
									<th>act</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${itemList.size() == 0 }">
									<tr><td colspan="9" style="text-align: center"><strong>자료가 없습니다.</strong></td></tr>
								</c:if>
								<c:if test="${itemList.size() != 0 }">
								<c:forEach var="list" items="${itemList}" varStatus="status">
									<c:url var="deleteItem" value="deleteItem.do">
										<c:param name="itemid" value="${list.itemid }" />
									</c:url>
									<c:url var="modifyItem" value="modifyItem.do">
										<c:param name="itemid" value="${list.itemid }" />
									</c:url>
									<tr>
										<td><strong>${list.productid}</strong></td>
										<td>${list.productname}</td>
										<td>${list.itemid}</td>
										<td>${list.originalprice}</td>
										<td>${list.saleprice}</td>
										<td>${list.color}</td>
										<td>${list.size}</td>
										<td>${list.stock}</td>
										<td><a href="${modifyItem}"><input type="button" value="수정"></a>
											<input type="button" value="삭제" onclick="isDeleteItem(${list.itemid})"></td>
									</tr>
								</c:forEach>
								</c:if>
								
							</tbody>
						</table>
					</div>
					<!-- /.box-body -->
					<!-- 페이징 -->
					<div class="box-footer clearfix">
						<ul class="pagination pagination-sm no-margin pull-right">
							<c:if test="${pageMaker.prev }">
								<c:if test="${not empty param.o}">
									<c:url var="itemListP" value="itemList.do">
										<c:param name="page" value="${pageMaker.start - 1}" />
										<c:param name="o" value="${param.o}"></c:param>
										<c:param name="k" value="${param.k}"></c:param>
									</c:url>
								</c:if>
								<c:if test="${empty param.o}">
									<c:url var="itemListP" value="itemList.do">
										<c:param name="page" value="${pageMaker.start - 1}" />
									</c:url>
								</c:if>
								<li><a href="${itemListP}">이전</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.start }" end="${pageMaker.end}" var="idx">
								<c:if test="${not empty param.o}">
									<c:url var="itemListP" value="itemList.do">
										<c:param name="page" value="${idx}" />
										<c:param name="o" value="${param.o}"></c:param>
										<c:param name="k" value="${param.k}"></c:param>
									</c:url>
								</c:if>
								<c:if test="${empty param.o}">
									<c:url var="itemListP" value="itemList.do">
										<c:param name="page" value="${idx}" />
									</c:url>
								</c:if>
								<li class='<c:out value="${idx == pageMaker.page ? 'active' : ''}"/>'>
									<a href='${itemListP }'>${idx}</a>
								</li>
								
							</c:forEach>
							<c:if test="${pageMaker.next }">
								<c:if test="${not empty param.o}">
									<c:url var="itemListP" value="itemList.do">
										<c:param name="page" value="${pageMaker.end + 1}" />
										<c:param name="o" value="${param.o}"></c:param>
										<c:param name="k" value="${param.k}"></c:param>
									</c:url>
								</c:if>
								<c:if test="${empty param.o}">
									<c:url var="itemListP" value="itemList.do">
										<c:param name="page" value="${pageMaker.end + 1}" />
									</c:url>
								</c:if>
								<li><a href="${itemListP }">다음</a></li>
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
<script type="text/javascript">
var header = $("meta[name='_csrf_header']").attr("content");
var token  = $("meta[name='_csrf']").attr("content");

function isDeleteItem(itemid) {
	if ( confirm("선택한 Item을 삭제하시겠습니까?") ) {
		$.ajax({
			type: 'post',
			url: 'isDeleteItem.do',
			beforeSend: function(xhr){
				xhr.setRequestHeader(header, token);
		    },
			headers: {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType: "text",
			data: JSON.stringify({itemid: itemid}),
			success: function(result) {
				console.log("result: " + result);
				
				if ( result == 'FAIL' ) {
					alert("구매 내역에 들어가있는 Item은 삭제가 불가능합니다.");
					return false;
				}
				else {
					deleteItem(itemid);
				}
			},
			error: function(request, status, error) {
			    alert("code:" + request.status + "\n" + "message:" + request.responseText+"\n" + "error:" + error);
		    }
		});
		return false;
	}
	else {
		return false;
	}
}

function deleteItem(itemid) {
	$.ajax({
		type: 'post',
		url: 'deleteItem.do',
		beforeSend: function(xhr){
			xhr.setRequestHeader(header, token);
	    },
		headers: {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType: "text",
		data: JSON.stringify({itemid: itemid}),
		success: function(result) {
			console.log("result: " + result);
			
			if ( result == 'SUCCESS' ) {
				alert("선택한 Item이 삭제되었습니다.");
				location.href = "/admin/item/itemList.do";
			}
		},
		error: function(request, status, error) {
		    alert("code:" + request.status + "\n" + "message:" + request.responseText+"\n" + "error:" + error);
	    }
	});
}
</script>
