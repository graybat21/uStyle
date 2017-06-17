function verifyOK()
{
	if ( document.registerItemForm.color.value == '' )
	{
		alert("색상을 입력하세요.");
		document.registerItemForm.color.focus();
		return false;	
	}
	else if ( document.registerItemForm.size.value == "" ) 
	{
		alert("사이즈를 입력하세요.");
		document.registerItemForm.size.focus();
		return false;
	}
	else if ( document.registerItemForm.stock.value == "" ) 
	{
		alert("재고수량을 입력하세요.");
		document.registerItemForm.stock.focus();
		return false;
	}
	else if ( document.registerItemForm.originalprice.value == "" ) 
	{
		alert("할인전 가격을 입력하세요.");
		document.registerItemForm.originalprice.focus();
		return false;
	}
	else if ( document.registerItemForm.saleprice.value == "" ) 
	{
		alert("할인가격을 입력하세요.");
		document.registerItemForm.saleprice.focus();
		return false;
	}
	else if ( parseInt(document.registerItemForm.originalprice.value) < 
			parseInt(document.registerItemForm.saleprice.value) ) 
	{
		alert("입력한 할인가격이 정상가격보다 더 높습니다. 할인가격을 다시 입력해주세요.");
		document.registerItemForm.saleprice.focus();
		return false;
	}
	else
	{
		alert("모두 입력하였습니다.");
		$("#registerItemForm").submit();
		return true;
	}
}

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