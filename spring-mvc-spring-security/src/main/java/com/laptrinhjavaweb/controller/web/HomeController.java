package com.laptrinhjavaweb.controller.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.CategoryDTO;
import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.INewService;
import com.laptrinhjavaweb.util.MessageUtil;

@Controller(value = "homeControllerOfWeb")
public class HomeController {

	@Autowired
	private INewService newService;
	@Autowired
	private ICategoryService categoryService;

	
	@RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("web/home");
		NewDTO newDTO = new NewDTO();
		CategoryDTO categoryDTO = new CategoryDTO();
		newDTO.setListResult(newService.findAlls());
		categoryDTO.setListResult(categoryService.findAlls());
		Pageable pageable = new PageRequest(0, 5);
		
		mav.addObject("model", categoryDTO);
		mav.addObject("models", newDTO);
		mav.addObject("newsSport", newService.findByCategoryCode("The-thao",pageable));	
		mav.addObject("newsEconomy", newService.findByCategoryCode("Kinh-te",pageable));	
		return mav;
	}
	
	
	

	@RequestMapping(value = "/dang-nhap", method = RequestMethod.GET)
	public ModelAndView loginPage() {
		ModelAndView mav = new ModelAndView("login");
		return mav;
	}
	
	@RequestMapping(value = "/dang-ky", method = RequestMethod.GET)
	public ModelAndView SignUpPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("signup");
		MessageUtil.displayMessage(mav,request);
		return mav;
	}
	
	@RequestMapping(value = "/thoat", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return new ModelAndView("redirect:/trang-chu");
	}
	
	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public ModelAndView accessDenied() {
		return new ModelAndView("redirect:/dang-nhap?accessDenied");
	}
}
