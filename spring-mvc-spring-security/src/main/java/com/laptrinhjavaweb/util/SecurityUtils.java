package com.laptrinhjavaweb.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import com.laptrinhjavaweb.dto.MyUser;

// cần build 1 hàm để getAuthorities
public class SecurityUtils {
	
	// Hàm get tất cả từ MyUser để lấy fullName welcome
	public static MyUser getPrincipal() {
		// Khi ta có dữ liệu rồi để ta duy trì đc dữ liệu đó trong Spring Security ta dùng đối tượng Principal
		MyUser myUser = (MyUser) (SecurityContextHolder.getContext()).getAuthentication().getPrincipal();
        return myUser;
    }
	
	@SuppressWarnings("unchecked")
	public static List<String> getAuthorities() {
		// list string này gồm có user và admin..
		List<String> results = new ArrayList<>();
		List<GrantedAuthority> authorities = (List<GrantedAuthority>)(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
        for (GrantedAuthority authority : authorities) {
            results.add(authority.getAuthority()); // getAuthority từ CustomuserDetail đã được put vào
        }
		return results;
	}
}
