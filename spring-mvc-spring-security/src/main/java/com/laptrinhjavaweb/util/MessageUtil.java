package com.laptrinhjavaweb.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

@Component
public class MessageUtil {
	
	public static Map<String, String> getMessage(String message){
		Map<String, String> result = new HashMap<>();
		if (message.equals("update_success")) {
			result.put("message", "Update success");
			result.put("alert", "success");
		} else if (message.equals("insert_success")) {
			result.put("message", "Insert success");
			result.put("alert", "success");
		} else if (message.equals("delete_success")) {
			result.put("message", "Delete success");
			result.put("alert", "success");
		} else if (message.equals("error_system")) {
			result.put("message", "Error system");
			result.put("alert", "danger");
		}
		return result;
	}
	
	public static ModelAndView displayMessage(ModelAndView mav, HttpServletRequest request){
		if(request.getParameter("message")!= null)
		{
			Map<String, String> message;
			String requestMessage = request.getParameter("message");
			if(!requestMessage.equals("insert_success") &&
				!requestMessage.equals("update_success")){
				message = getMessage("error_system");
			}
			else{
				message = getMessage(request.getParameter("message"));
			}

			mav.addObject("message", request.getParameter("message"));
			mav.addObject("alert", message.get("alert"));
		}
		return mav;
	}
}
