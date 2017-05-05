package com.ustyle.utils;

import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.ustyle.domain.User;

public class UserEntryValidator implements Validator 
{

	@Override
	public boolean supports(Class<?> clazz) 
	{
		return User.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object command, Errors errors) 
	{
		User user = (User) command;
		
		if ( !(StringUtils.hasLength(user.getUsername())) )
			errors.rejectValue("username", "error.required");
		
		if ( !(StringUtils.hasLength(user.getPassword())) )
			errors.rejectValue("password", "error.required");
		
		if ( !(StringUtils.hasLength(user.getEmail())) )
			errors.rejectValue("email", "error.required");
		
		if ( !(StringUtils.hasLength(user.getAddr1())) )
			errors.rejectValue("addr1", "error.required");
		
		if ( !(StringUtils.hasLength(user.getAddr2())) )
			errors.rejectValue("addr2", "error.required");

		if ( !(StringUtils.hasLength(Integer.toString(user.getPostcode()))) )
			errors.rejectValue("postcode", "error.required");
		
		if ( !(StringUtils.hasLength(user.getPhone())) )
			errors.rejectValue("phone", "error.required");
		
		if ( !(StringUtils.hasLength(user.getRealname())) )
			errors.rejectValue("realname", "error.required");
		
		if ( errors.hasErrors() )
			errors.reject("error.input.user");
	}
	
}
