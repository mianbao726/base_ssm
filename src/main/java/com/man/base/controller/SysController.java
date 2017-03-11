package com.man.base.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.man.base.service.IUserService;
import com.man.base.util.C;
/**
 * 
 * @author zhuwj
 *
 */
@SuppressWarnings("rawtypes")
@Controller
public class SysController extends BaseController {
	@Resource
	private IUserService userService;

	@RequestMapping("/sys/500.html")
	public String checkUniqueEmail(HttpServletRequest request) throws Exception {
		return "error/500";
	}

	@RequestMapping("/main.html")
	public String main(HttpServletRequest request) throws Exception {
		return "redirect:" + ((Map) request.getSession().getAttribute("userInfo")).get("main_page").toString();
	}

	/**
	 * 系统默认主页
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/dashboard.html")
	public String dashboard(HttpServletRequest request) throws Exception {
		return "dashboard/dashboard";
	}

}
