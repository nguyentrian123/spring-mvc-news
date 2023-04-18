package com.laptrinhjavaweb.security;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.annotations.Check;
import org.springframework.data.jpa.repository.Query;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.util.SecurityUtils;

@Component
public class CustomSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
	
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException {
		String targetUrl = determineTargetUrl(authentication); // hàm định tuyến Url nào sẽ trả về (nếu admin thì trả về trang admin )
		if (response.isCommitted()) {
			return;
		}
		redirectStrategy.sendRedirect(request, response, targetUrl);
		
	}

	public RedirectStrategy getRedirectStrategy() {
		return redirectStrategy;
	}
	
	public void setRedirectStrategy(RedirectStrategy redirectStrategy) {
		this.redirectStrategy = redirectStrategy;
	}
	
	private String determineTargetUrl(Authentication authentication) {
		String url = "";
		List<String> roles = SecurityUtils.getAuthorities(); // lấy ra list chuỗi từ SecurityUtils đã getAuthority
		if (isAdmin(roles)) {
			url = "/quan-tri/trang-chu";
		} else if (isUser(roles)) {
			url = "/trang-chu";
		}
		return url;
	}
	
	//check ADmin
	private boolean isAdmin(List<String> roles) {
		if (roles.contains("ADMIN")) {
			return true;
		}
		return false;
	}
	
	//checkUser
	private boolean isUser(List<String> roles) {
		if (roles.contains("USER")) {
			return true;
		}
		return false;
	}
}
