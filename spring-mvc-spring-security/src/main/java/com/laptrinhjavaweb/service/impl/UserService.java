package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.laptrinhjavaweb.converter.UserConverter;
import com.laptrinhjavaweb.dto.RoleDTO;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.entity.RoleEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.exception.MyFileNotFoundException;
import com.laptrinhjavaweb.repository.RoleRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.IUserService;

@Service
public class UserService implements IUserService {

	@Autowired
	UserConverter userConverter;
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	RoleRepository roleRepository;

	
	@Override
	@Transactional
	public UserDTO save(UserDTO userDTO) {
		UserEntity userEntity = new UserEntity();
		List<UserEntity> entities =  userRepository.findByUserName(userDTO.getUserName().trim());
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		List<RoleEntity> roleEntities = new ArrayList<>();
		RoleEntity roleEntity = roleRepository.findOne(userDTO.getRoleid());
		roleEntities.add(roleEntity);
		
		if(entities.size() > 0) {
			for(UserEntity entity : entities) {
				if(entity.getId() != userDTO.getId()) {
					throw new MyFileNotFoundException("UserName is exist!");
				}
			}
		}
		
		if(userDTO.getId() != null) {
			UserEntity oldUser =  userRepository.findOne(userDTO.getId());
			oldUser.setRoles(roleEntities);
			userEntity = userConverter.toEntity(oldUser, userDTO);
		}else {
			userDTO.setPassword(passwordEncoder.encode(userDTO.getPassword()));
			userEntity = userConverter.toEntity(userDTO);	
			userEntity.setRoles(roleEntities);
		}
		
			
		return userConverter.toDTO(userRepository.save(userEntity));
	}



	@Override
	public List<UserDTO> findAllUser() {
		List<UserDTO> userDTOs = new ArrayList<>();
		List<UserEntity> userEntities = userRepository.findAll();
		userEntities.forEach(entity ->{
			UserDTO userDTO = userConverter.toDTO(entity);
			userDTOs.add(userDTO);
		});
		
		return userDTOs;
	}



	@Override
	public List<UserDTO> findUserByUsername(String fullname) {
		List<UserDTO> userDTOs = new ArrayList<>();
		List<UserEntity> userEntities = userRepository.findByFullNameContaining(fullname);
		userEntities.forEach(entity ->{
			UserDTO userDTO = userConverter.toDTO(entity);
			userDTOs.add(userDTO);
		});
		
		return userDTOs;
	}



	@Override
	@Transactional
	public void deleteUser(long[] ids) {
		for (Long id : ids) {
			userRepository.delete(id);
		}
		
	}



	@Override
	public UserDTO findById(Long id) {
		UserEntity userEntity = userRepository.findOne(id);
		return userConverter.toDTO(userEntity);
	}



	@Override
	public List<RoleDTO> findAllRoles() {
		List<RoleDTO> result = new ArrayList<>();
		List<RoleEntity> roleEntities = roleRepository.findAll();
		roleEntities.forEach(entity ->{
			RoleDTO roleDTO = new RoleDTO();
			roleDTO.setCode(entity.getCode());
			roleDTO.setName(entity.getName());
			roleDTO.setId(entity.getId());
			result.add(roleDTO);
		});
		return result;
	}
	
	
	
	

}
