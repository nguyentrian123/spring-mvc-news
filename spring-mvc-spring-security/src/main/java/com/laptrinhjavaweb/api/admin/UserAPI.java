package com.laptrinhjavaweb.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.exception.MyFileNotFoundException;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.util.ValidationUtils;

@RestController(value = "user")
public class UserAPI {
	
	@Autowired
	private IUserService userService;
	
	@PostMapping(value = "api/useradmin")
	public ResponseEntity<?> saveUser(@ModelAttribute UserDTO userDTO){
		try {
			ValidationUtils.ValidateUser(userDTO);
			return ResponseEntity.ok().body(userService.save(userDTO));

		} catch (MyFileNotFoundException ex) {
			  String errorMessage = ex.getMessage();
		       return ResponseEntity.status(HttpStatus.NOT_FOUND).body("{\"detail\":\"" + errorMessage + "\"}");
		}
		
		
	}
	
	@DeleteMapping("api/useradmin")
	public void deleteUser(@RequestBody long[] ids) {
		userService.deleteUser(ids);
	}
	
}
