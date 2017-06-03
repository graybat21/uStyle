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
	else
	{
		alert("모두 입력하였습니다.");
		$("#registerItemForm").submit();
		return true;
	}
}