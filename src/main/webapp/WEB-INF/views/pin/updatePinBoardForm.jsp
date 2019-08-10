<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
#columns {
	column-width: 350px;
	column-gap: 10px;
	padding: 30px;
}

#columns figure {
	display: Inline-block;
	border: 1px solid rgba(0, 0, 0, 0.2);
	margin: 0px;
	margin-bottom: 10px;
	box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
}

div img {
	width: 100%;
}

td img {
	width: 50%;
}

.glyphicon-ok-circle {
    font-size: 20px;
}

#columns figure figcaption {
	border-top: 1px solid rgba(0, 0, 0, 0.2);
	padding: 10px;
	margin-top: 10px;
}
</style>
<div class="wrapper">
	
	<div class="page one-column" id="columns">
		<h1>Update PinBoard</h1>
	</div>
	<!-- /.page -->

	<div class="container" style="height: auto; margin: 30px;">
		<div class="box-collateral box-reviews em-line-01" id="customer-reviews">
			<div class="form_review no_reviews">
			    <div class="form-add" id="customer_review_form">
			    	<form method="post" onsubmit="return verifyOK()">
			    		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				        <div class="em-block-title">
				            <h2>Update PinBoard Form</h2>
				        </div>
			            <fieldset>
			                <h3>수정할 PinBoard의 제목과 내용을 입력해주세요.</h3>
			                <ul class="form-list">
			                    <li>
			                        <label for="username_field" class="required"><em>*</em>Title</label>
			                        <div class="input-box">
			                            <input type="text" name="pinboardname" id="pinboard-name" class="input-text required-entry" value="${pinBoard.pinboardname}"/>
			                        </div>
			                    </li>
			                    <li>
			                        <label for="contents_field" class="required"><em>*</em>Contents</label>
			                        <div class="input-box">
			                            <textarea name="content" id="pinboard-content" cols="5" rows="3" class="required-entry">${pinBoard.content}</textarea>
			                        </div>
			                    </li>
			                </ul>
			            </fieldset>
			            <div class="buttons-set">
					        <button type="submit" title="Submit Pinboard" class="button"><span>Submit Pinboard</span>
					        </button>
					    </div>
					    <div style="height: 50px"></div>
					    <h3>Pin List (체크 표시된 상품이 PinBoard의 대표 이미지로 설정되어 있음)</h3>
			            <table class="data-table">
			            	<thead>
			            		<tr class="em-block-title">
				            		<th class="col-md-5 col-sm-5 col-xs-5 a-center">Product Image</th>
				            		<th class="col-md-15 col-sm-15 col-xs-15 a-center">Product Name</th>
				            		<th class="col-md-4 col-sm-4 col-xs-4 a-center">Pin Remove / PinBoard Image Change</th>
			            		</tr>
			            	</thead>
			            	<tbody>
			            		<c:forEach var="pinBoardProduct" items="${pinBoardProductList}">
				            		<tr>
					            		<td class="a-center">
					            		<c:if test="${pinBoardProduct.productid == pinBoard.mainpictureproductid}">
					            			<span class="glyphicon glyphicon-ok-circle" aria-hidden="true"></span>
					            		</c:if>
					            			<img src="/displayMainPictureurl?productid=${pinBoardProduct.productid}">
					            		</td>
					            		<td class="productid" style="display: none;">${pinBoardProduct.productid}</td>
					            		<td class="a-center">${pinBoardProduct.productname}</td>
					            		<td class="a-center">
					            			<button type="button" class="btn btn-default" id="btn-removepin" onClick="removePin(this)">삭제</button>
					            			<button type="button" class="btn btn-default" id="btn-changepinboardimage" onClick="changePinboardImage(this)">이미지 변경</button>
					            		</td>
				            		</tr>
				            	</c:forEach>
			            	</tbody>
			            </table>
			    	</form>
			    </div>
			</div><!-- /.form_review -->
		</div><!-- /.box-collateral -->
	</div>
	<!-- /.container -->
</div>
<!-- /.wrapper -->
	
<script type="text/javascript">
var header = $("meta[name='_csrf_header']").attr("content");
var token  = $("meta[name='_csrf']").attr("content");

function verifyOK() {
	if ( $("#pinboard-name").val() == '' ) {
		alert("제목을 입력하세요.");
		return false;
	}
	else if ( $("#pinboard-content").val() == '' ) {
		alert("내용을 입력하세요.");
		return false;
	}
	else	
		return true;
}

function removePin(element) {
	var pinboardno = '${pinBoard.pinboardno}';
	
	var rownum = element.parentNode.parentNode.rowIndex - 1;
	var productIdArr = document.getElementsByClassName("productid");
	var productid = productIdArr[rownum].innerText;
	
	console.log(pinboardno);
	console.log(productid);
	
	if ( confirm("이 Pin을 삭제하시겠습니까?") == true )
	{
		$.ajax({
			type: 'post',
			url: 'deletePin.do',
			beforeSend: function(xhr){
				xhr.setRequestHeader(header, token);
		    },
			headers: {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType: "text",
			data: JSON.stringify({pinboardno: pinboardno, productid: productid}),
			success: function(result) {
				console.log("result: " + result);
				
				if ( result == 'SUCCESS' ) {
					window.location.href = "modifyPinBoard.do?pinboardno=" + pinboardno;
				}
			},
			error: function(request, status, error) {
			    alert("올바르지 않은 Pin 삭제입니다.");
			    window.location.href = "modifyPinBoard.do?pinboardno=" + pinboardno;
		    }
		});
	}
}

function changePinboardImage(element) {
	var pinboardno = '${pinBoard.pinboardno}';
	
	var rownum = element.parentNode.parentNode.rowIndex - 1;
	var productIdArr = document.getElementsByClassName("productid");
	var productid = productIdArr[rownum].innerText;
	
	if ( confirm("PinBoard의 이미지를 변경하시겠습니까?") == true )
	{
		$.ajax({
			type: 'post',
			url: 'updatePinBoardPictureurl.do',
			beforeSend: function(xhr){
				xhr.setRequestHeader(header, token);
		    },
			headers: {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType: "text",
			data: JSON.stringify({pinboardno: pinboardno, mainpictureproductid: productid}),
			success: function(result) {
				console.log("result: " + result);
				
				if ( result == 'SUCCESS' ) {
					window.location.href = "modifyPinBoard.do?pinboardno=" + pinboardno;
				}
			},
			error: function(request, status, error) {
			    alert("올바르지 않은 PinBoard 이미지 변경입니다.");
			    window.location.href = "modifyPinBoard.do?pinboardno=" + pinboardno;
		    }
		});
	}
}
</script>
