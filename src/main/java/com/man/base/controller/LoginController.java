package com.man.base.controller;

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
	
	@RequestMapping("/login1.html")
	public String login1(HttpServletRequest request, Model model) throws Exception {
		return "dashboard/index";
	}
	
	
}
