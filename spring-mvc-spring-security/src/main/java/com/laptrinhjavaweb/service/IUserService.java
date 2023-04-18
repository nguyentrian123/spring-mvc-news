package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.dto.RoleDTO;
import com.laptrinhjavaweb.dto.UserDTO;

public interface IUserService {
	UserDTO save(UserDTO userDTO);
	List<UserDTO> findAllUser();
	List<UserDTO> findUserByUsername(String username);
	void deleteUser(long[] ids);
	UserDTO findById(Long id);
	List<RoleDTO> findAllRoles();
}
