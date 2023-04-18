package com.laptrinhjavaweb.controller.admin;

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
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.INewService;
import com.laptrinhjavaweb.util.MessageUtil;

@Controller(value = "newControllerOfAdmin")
public class NewController {

	@Autowired
	private INewService newService;
	@Autowired
	private ICategoryService categoryService;
	@Autowired
	private MessageUtil messageUtil;
	
	
	@RequestMapping(value = "/quan-tri/bai-viet/danh-sach", method = RequestMethod.GET)
	public ModelAndView showList(@RequestParam(value="page",required=false) Integer page,
								@RequestParam(value="title",required= false) String title ,
								HttpServletRequest request) {
		
		NewDTO model = new NewDTO();	
		ModelAndView mav = new ModelAndView("admin/new/list");
		
		model.setPage(page);
		model.setLimit(4);
		Pageable pageable = new PageRequest(page -1, 4);// tìm vị trí tiếp theo của page
		
		if(StringUtils.hasText(title))
		{
			model.setListResult(newService.findByTitleContaining(title,pageable));
			model.setTotalItem(newService.getTotalItem(title));
		}
		else
		{
			model.setListResult(newService.findAll(pageable));
			model.setTotalItem(newService.getTotalItem());
			
			  if(request.getParameter("message")!= null) { Map<String, String> message =
			  MessageUtil.getMessage(request.getParameter("message"));
			  mav.addObject("message", message.get("message")); mav.addObject("alert",
			  message.get("alert")); }
			 	
		}
		
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		
		
		mav.addObject("saveSearch",title);
		mav.addObject("model", model);
		return mav;
	}
	
	

	@RequestMapping(value = "/quan-tri/bai-viet/chinh-sua", method = RequestMethod.GET)
	public ModelAndView editNew(@RequestParam(value = "id", required = false) Long id, HttpServletRequest request
			) { // vì 1 giao dien cho 2 form, id luc co luc ko nen ta de required = false
		ModelAndView mav = new ModelAndView("admin/new/edit");
		NewDTO model = new NewDTO();
		
		if(id != null)
		{
			model = newService.findById(id);
			
		}
		MessageUtil.displayMessage(mav,request);
		
		mav.addObject("categories", categoryService.findAll());
		mav.addObject("model", model);
		return mav;
	}
	
	

		
}
