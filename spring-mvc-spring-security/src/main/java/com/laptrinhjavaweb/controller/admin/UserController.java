package com.laptrinhjavaweb.controller.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.dto.RoleDTO;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.util.MessageUtil;

@Controller(value = "userControllerOfAdmin")
public class UserController {
	
	@Autowired
	private IUserService userService;
	@Autowired
	private MessageUtil messageUtil;
	
	@RequestMapping(value = "/quan-tri/tai-khoan/danh-sach", method = RequestMethod.GET)
	public ModelAndView showList(@RequestParam(value="fullname",required= false) String fullname ,
								HttpServletRequest request) {
		
		List<UserDTO> models = new ArrayList<UserDTO>();	
		ModelAndView mav = new ModelAndView("admin/user/list");
		if(StringUtils.hasText(fullname))
		{
			models = userService.findUserByUsername(fullname);
		}
		else
		{
			models = userService.findAllUser();
			if(request.getParameter("message")!= null)
			{
				Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
				mav.addObject("message", message.get("message"));
				mav.addObject("alert", message.get("alert"));
			}		
		}
		mav.addObject("saveSearch",fullname);
		mav.addObject("model", models);
		return mav;
	}
	
	
	@RequestMapping(value = "/quan-tri/tai-khoan/chinh-sua", method = RequestMethod.GET)
	public ModelAndView editNew(@RequestParam(value = "id", required = false) Long id, HttpServletRequest request
			) { // vì 1 giao dien cho 2 form, id luc co luc ko nen ta de required = false
		ModelAndView mav = new ModelAndView("admin/user/edit");
		UserDTO model = new UserDTO();
		
		if(id != null)
		{
			model = userService.findById(id);
		}
		MessageUtil.displayMessage(mav,request);
		mav.addObject("roles", userService.findAllRoles());
		mav.addObject("model", model);
		return mav;
	}
	
}
