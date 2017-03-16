/*
 * Copyright (c) 2017, 2017, WHATGOOGLE and/or its affiliates. All rights reserved.
 * WHATGOOGLE PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 */
package com.man.backend.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.man.base.controller.BaseController;

/**
 * @author generate by www.whatgoogle.com (ps : some question? contact zhuwj@726@gmail.com)
 */
@Controller
@RequestMapping("/dashboard")
public class DashboardController extends BaseController {


	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact zhuwj@726@gmail.com)
	 */
	 @RequestMapping("/dashboard.html")
	public String ret1(HttpServletRequest request, Model model)throws Exception{
		return "dashboard/index";
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact zhuwj@726@gmail.com)
	 */
	 @RequestMapping("/dashboard.html")
	public String getnewone(HttpServletRequest request, Model model)throws Exception{
		return "dashboard/index";
	}
}
