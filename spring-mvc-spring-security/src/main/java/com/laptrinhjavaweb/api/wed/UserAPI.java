package com.laptrinhjavaweb.api.wed;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.exception.MyFileNotFoundException;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.util.ValidationUtils;

@RestController(value="userAPIOfWeb")
public class UserAPI {

	@Autowired
	private IUserService userService;
	
	@PostMapping("api/user")
	public ResponseEntity<?> createUser(@RequestBody UserDTO userDTO)
	{
		try {
			userDTO.setRoleid((long) 2);
			ValidationUtils.ValidateUser(userDTO);
			return ResponseEntity.ok().body(userService.save(userDTO));

		} catch (MyFileNotFoundException ex) {
			  String errorMessage = ex.getMessage();
		       return ResponseEntity.status(HttpStatus.NOT_FOUND).body("{\"detail\":\"" + errorMessage + "\"}");
		}
	}
	
}
