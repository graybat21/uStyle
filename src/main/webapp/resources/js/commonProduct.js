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
	else
	{
		alert("모두 입력하였습니다.");
		$("#registerProductForm").submit();
		return true;
	}
}