package com.man.base.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.man.base.service.IUserService;

@Controller
public class SysController extends BaseController {
	@Resource
	private IUserService userService;

	@RequestMapping("/sys/500.html")
	public String checkUniqueEmail(HttpServletRequest request) throws Exception {
		return "error";
	}
	
	@RequestMapping("/main.html")
	public String main(HttpServletRequest request) throws Exception {
		return "user/index";
	}
	
}
