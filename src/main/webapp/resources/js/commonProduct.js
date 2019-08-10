function verifyOK()
{
	if ( document.registerProductForm.productname.value == '' )
	{
		alert("상품명을 입력하세요.");
		document.registerProductForm.productname.focus();
		return false;	
	}
	else if ( document.registerProductForm.brand.value == "" ) 
	{
		alert("브랜드를 입력하세요.");
		document.registerProductForm.brand.focus();
		return false;
	}
	else if ( document.registerProductForm.description.value == "" ) 
	{
		alert("상세설명을 입력하세요.");
		document.registerProductForm.description.focus();
		return false;
	}
	else if ( document.registerProductForm.category.value == "" ) 
	{
		alert("카테고리를 입력하세요.");
		document.registerProductForm.category.focus();
		return false;
	}
	else if ( document.registerProductForm.subcategory.value == "" ) 
	{
		alert("서브 카테고리를 입력하세요.");
		document.registerProductForm.subcategory.focus();
		return false;
	}
	else if ( document.registerProductForm.originalprice.value == "" ) 
	{
		alert("정상가격을 입력하세요.");
		document.registerProductForm.originalprice.focus();
		return false;
	}
	else if ( document.registerProductForm.saleprice.value == "" ) 
	{
		alert("할인가격을 입력하세요.");
		document.registerProductForm.saleprice.focus();
		return false;
	}
	else if ( parseInt(document.registerProductForm.originalprice.value) < 
			parseInt(document.registerProductForm.saleprice.value) ) 
	{
		alert("입력한 할인가격이 정상가격보다 더 높습니다. 할인가격을 다시 입력해주세요.");
		document.registerProductForm.saleprice.focus();
		return false;
	}
	else
	{
		alert("모두 입력하였습니다.");
		$("#registerProductForm").submit();
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