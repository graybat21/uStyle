function verifyOK()
{
	if ( document.registerForm.productname.value == '' )
	{
		alert("상품명을 입력하세요.");
		document.registerForm.productname.focus();
		return;	
	}
	else if ( document.registerForm.brand.value == "" ) 
	{
		alert("브랜드를 입력하세요.");
		document.registerForm.brand.focus();
		return false;
	}
	else if ( document.registerForm.description.value == "" ) 
	{
		alert("상세설명을 입력하세요.");
		document.registerForm.description.focus();
		return false;
	}
	else if ( document.registerForm.category.value == "" ) 
	{
		alert("카테고리를 입력하세요.");
		document.registerForm.category.focus();
		return false;
	}
	else if ( document.registerForm.subcategory.value == "" ) 
	{
		alert("서브 카테고리를 입력하세요.");
		document.registerForm.subcategory.focus();
		return false;
	}
	else
	{
		alert("모두 입력하였습니다.");
		$("#registerForm").submit();
		return true;
	}
}