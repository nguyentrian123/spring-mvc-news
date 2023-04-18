package com.laptrinhjavaweb.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.CategoryDTO;
import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.util.MessageUtil;

@Controller(value = "categoryControllerOfAdmin")
public class CategoryController {

	
	@Autowired
	private ICategoryService categoryService;
	
	@RequestMapping(value = "/quan-tri/the-loai", method = RequestMethod.GET)
	public ModelAndView showCategory()
	{
		CategoryDTO model = new CategoryDTO();
		ModelAndView mav = new ModelAndView("admin/category/category");
		model.setListResult(categoryService.findAlls());
		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = "/quan-tri/the-loai/chinh-sua", method = RequestMethod.GET)
	public ModelAndView editCategory(@RequestParam(value = "id", required = false) Long id, HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView("admin/category/edit");
		CategoryDTO model = new CategoryDTO();
		if(id != null)
		{
			model = categoryService.findById(id);
		}
		MessageUtil.displayMessage(mav,request);
		mav.addObject("model", model);
		return mav;
	}
	
	
}
