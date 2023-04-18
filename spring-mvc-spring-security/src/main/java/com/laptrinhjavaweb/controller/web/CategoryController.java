package com.laptrinhjavaweb.controller.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.CategoryDTO;
import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.INewService;

@Controller(value = "categoryControllerOfWeb")
public class CategoryController {
	
	@Autowired
	private ICategoryService categoyService;
	
	@Autowired
	private INewService newService;
	
	@RequestMapping(value = "/the-loai", method = RequestMethod.GET)
	public ModelAndView categoryPage(@RequestParam("code") String code,
									@RequestParam(value="page") Integer page,
									@RequestParam(value="limit") Integer limit,
									HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("web/category/category");
		NewDTO newDTO = new NewDTO();
		CategoryDTO categoryDTO = new CategoryDTO();
		
		newDTO.setPage(page);
		newDTO.setLimit(limit);
		Pageable pageable = new PageRequest(page -1, limit);
		newDTO.setListResult(newService.findByCategoryCode(code,pageable));
		newDTO.setTotalItem(newService.getTotalItems(code));
		newDTO.setTotalPage((int) Math.ceil((double) newDTO.getTotalItem() / newDTO.getLimit()));
		
		// SetList hien thi Menu
		categoryDTO.setListResult(categoyService.findAlls());
		categoryDTO.setName(categoyService.findByCode(code).getName());
		
		mav.addObject("model", categoryDTO);
		mav.addObject("models", newDTO);
		
		
		return mav;
	}
	

}
