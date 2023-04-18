package com.laptrinhjavaweb.util;

import org.springframework.web.multipart.MultipartFile;

import com.laptrinhjavaweb.dto.CategoryDTO;
import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.exception.MyFileNotFoundException;

public class ValidationUtils {
	
	public static void ValidateNews(NewDTO newDTO,MultipartFile[] files) throws MyFileNotFoundException
	{
		if(  newDTO.getTitle().equals(""))
		{
			throw new MyFileNotFoundException("Title is required!");
		}
		if( newDTO.getContent().equals(""))
		{
			throw new MyFileNotFoundException("Content is required!");
		}
		if(newDTO.getId() == null) {
			if (files[0].isEmpty()) {
				throw new MyFileNotFoundException("You need to choose image!");
			}
		}
		
		if(newDTO.getCategoryCode().equals("")) {
			throw new MyFileNotFoundException("Category is required!");
		}
	}
	
	public static void ValidateUser(UserDTO userDTO) throws MyFileNotFoundException
	{
		if(  userDTO.getUserName().equals(""))
		{
			throw new MyFileNotFoundException("Username is required!");
		}
		if( userDTO.getFullName().equals(""))
		{
			throw new MyFileNotFoundException("FullName is required!");
		}
		if(userDTO.getId() == null) {
			if (userDTO.getPassword().equals("")) {
				throw new MyFileNotFoundException("Password is required!");
			}
		}
		
		if(userDTO.getRoleid() == null) {
			throw new MyFileNotFoundException("Role is required!");
		}
	}
	
	public static void ValidateCategory(CategoryDTO categoryDTO) throws MyFileNotFoundException
	{
		if(  categoryDTO.getCode().equals(""))
		{
			throw new MyFileNotFoundException("Code is required!");
		}
		if( categoryDTO.getName().equals(""))
		{
			throw new MyFileNotFoundException("Name is required!");
		}
		
	}
	

}
