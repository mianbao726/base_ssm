package com.xx.base.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController extends BaseController {

	@RequestMapping("/login.html")
	public String login(HttpServletRequest request, Model model) throws Exception {
		return "login/login";
	}
	
	@RequestMapping("/huifengtest.html")
	public String test(HttpServletRequest request, Model model) throws Exception {
		return "login/test";
	}
	
	/**
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/")
	public String login1(HttpServletRequest request, Model model) throws Exception {
		return "login/login";
//		return "exception/page_500";
	}
	
	
}
