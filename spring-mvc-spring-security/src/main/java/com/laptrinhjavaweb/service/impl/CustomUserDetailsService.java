package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.dto.MyUser;
import com.laptrinhjavaweb.entity.RoleEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.UserRepository;

@Service
public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	private UserRepository userRepository;

	// chỉ cần loadUserByUsername vì nó đã làm ngầm cho ta phần Password
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserEntity userEntity = userRepository.findOneByUserNameAndStatus(username, SystemConstant.ACTIVE_STATUS);
	
		if (userEntity == null) {
			throw new UsernameNotFoundException("User not found");
		}
		List<GrantedAuthority> authorities = new ArrayList<>();
		
		// put list role của cái user đó vào (trong UserEntity có list<role>) để qua bên customSuccess so sánh
		for (RoleEntity role: userEntity.getRoles()) {
			authorities.add(new SimpleGrantedAuthority(role.getCode()));
		}
		
		// ta custom lại cái hàm User mà Spring build sẵn để có thể lấy đc full name vào Session để có thể đưa ra hello fullname
		MyUser myUser = new MyUser(userEntity.getUserName(), userEntity.getPassword(), 
							true, true, true, true, authorities);
		myUser.setFullName(userEntity.getFullName());
		myUser.setId(userEntity.getId());
		return myUser; // nhảy qa customsuccess xử lý tiếp
	}

}
