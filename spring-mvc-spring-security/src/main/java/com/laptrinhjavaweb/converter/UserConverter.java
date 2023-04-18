package com.laptrinhjavaweb.converter;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.entity.UserEntity;

@Component
public class UserConverter {

		public UserDTO toDTO(UserEntity entity)
		{
			UserDTO result = new UserDTO();
			result.setId(entity.getId());
			result.setUserName(entity.getUserName());
			result.setPassword(entity.getPassword());
			result.setStatus(entity.getStatus());
			result.setFullName(entity.getFullName());	
			result.setRoleid(entity.getRoles().get(0).getId());
			return result;
			
		}
		
		public UserEntity toEntity(UserEntity result, UserDTO   dto)
		{
			result.setUserName(dto.getUserName());
			result.setPassword(dto.getPassword());
			result.setFullName(dto.getFullName());
			result.setStatus(1);
			return result;
		}
		
		public UserEntity toEntity(UserDTO dto)
		{
			
			
			UserEntity result = new UserEntity();
			result.setUserName(dto.getUserName());
			result.setPassword(dto.getPassword());
			result.setFullName(dto.getFullName());
			result.setStatus(1);
		
			
			return result;
		}
		
		
}
