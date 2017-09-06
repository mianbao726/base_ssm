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
package com.xx.backend.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.xx.base.controller.BaseController;
import com.xx.base.util.map.QMap;

/** test
 * @author generate by www.whatgoogle.com (ps : some question? contact
 *         zhuwj@726@gmail.com)
 */
@Controller
public class DashboardController extends BaseController {

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj@726@gmail.com)
	 */
	@RequestMapping("/dashboard.html")
	public String ret1(HttpServletRequest request, Model model) throws Exception {
		return "dashboard/index";
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj@726@gmail.com)
	 */
	@RequestMapping("/hello.html")
	public String hello(HttpServletRequest request, Model model) throws Exception {
		return "dashboard/hello";
	}

}
