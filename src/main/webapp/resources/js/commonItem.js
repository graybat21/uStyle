var header = $("meta[name='_csrf_header']").attr("content");
var token  = $("meta[name='_csrf']").attr("content");

function verifyOK()
{
	var color = document.registerItemForm.color.value;
	var size = document.registerItemForm.size.value;
	var stock = document.registerItemForm.stock.value;
	var originalprice = document.registerItemForm.originalprice.value;
	var saleprice = document.registerItemForm.saleprice.value;
	var productid = document.registerItemForm.productid.value;
	
	if ( color == '' )
	{
		alert("색상을 입력하세요.");
		document.registerItemForm.color.focus();
		return false;	
	}
	else if ( size == "" ) 
	{
		alert("사이즈를 입력하세요.");
		document.registerItemForm.size.focus();
		return false;
	}
	else if ( stock == "" ) 
	{
		alert("재고수량을 입력하세요.");
		document.registerItemForm.stock.focus();
		return false;
	}
	else if ( originalprice == "" ) 
	{
		alert("할인전 가격을 입력하세요.");
		document.registerItemForm.originalprice.focus();
		return false;
	}
	else if ( saleprice == "" ) 
	{
		alert("할인가격을 입력하세요.");
		document.registerItemForm.saleprice.focus();
		return false;
	}
	else if ( parseInt(originalprice) < parseInt(saleprice) ) 
	{
		alert("입력한 할인가격이 정상가격보다 더 높습니다. 할인가격을 다시 입력해주세요.");
		document.registerItemForm.saleprice.focus();
		return false;
	}
	else
	{
		$.ajax({
			type: 'post',
			url: 'alreadyExistItem.do',
			beforeSend: function(xhr){
				xhr.setRequestHeader(header, token);
		    },
			headers: {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType: "text",
			data: JSON.stringify({color: color, size: size, productid: productid}),
			success: function(result) {
				console.log("result: " + result);
				
				if ( result == 'FAIL' && location.pathname == '/admin/item/addItem.do' ) {
					alert("이 상품에 해당하는 색상 혹은 사이즈를 가진 Item이 존재합니다. 다른 색상 혹은 사이즈를 입력해주세요.");
					return false;
				}
				else {
					alert("모두 입력하였습니다.");
					$("#registerItemForm").submit();
					return true;
				}
			},
		    error: function(request, status, error) {
			    alert("code:" + request.status + "\n" + "message:" + request.responseText+"\n" + "error:" + error);
		    }
		});
		return false;
	}
}

function onlyNumber(event) {
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