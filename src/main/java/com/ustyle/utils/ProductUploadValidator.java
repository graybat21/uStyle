package com.ustyle.utils;

import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.ustyle.domain.Product;

public class ProductUploadValidator implements Validator 
{

	@Override
	public boolean supports(Class<?> clazz) 
	{
		return Product.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object command, Errors errors) 
	{
		Product product = (Product) command;
		
		if ( !(StringUtils.hasLength(product.getProductname())) )
			errors.rejectValue("productname", "error.required");
		
		if ( !(StringUtils.hasLength(product.getBrand())) )
			errors.rejectValue("brand", "error.required");
		
		if ( !(StringUtils.hasLength(product.getDescription())) )
			errors.rejectValue("description", "error.required");
		
		if ( !(StringUtils.hasLength(product.getCategory())) )
			errors.rejectValue("category", "error.required");
		
		if ( !(StringUtils.hasLength(product.getSubcategory())) )
			errors.rejectValue("subcategory", "error.required");

		if ( errors.hasErrors() )
			errors.reject("error.input.product");
	}
	
}
