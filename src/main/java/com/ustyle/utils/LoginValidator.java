package com.ustyle.utils;

import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.ustyle.domain.User;

public class LoginValidator implements Validator 
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
		
		if ( errors.hasErrors() )
			errors.reject("error.input.user");
	}
	
}
