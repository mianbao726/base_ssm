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

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.xx.backend.service.EmployeeService;
import com.xx.base.controller.BaseController;
import com.xx.base.util.XX;
import com.xx.base.util.map.QMap;

/**
 * @author generate by www.whatgoogle.com (ps : some question? contact
 *         zhuwj726@gmail.com)
 */
@Controller
@RequestMapping("/employee")
public class EmployeeController extends BaseController {

	// XXX
	@Resource
	private EmployeeService employeeService;

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@RequestMapping("/index.html")
	public String index(HttpServletRequest request, Model model) throws Exception {
		return "employee/index";
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@RequestMapping("/list.html")
	public @ResponseBody
	String list(HttpServletRequest request, Model model) throws Exception {
		Map ret = null;
		ret = new QMap("200");
		ret = employeeService.queryPageForMap(ret);
		return JSONObject.toJSONString(ret);
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@RequestMapping("/create.html")
	public String create(HttpServletRequest request, Model model) throws Exception {
		Map paramsMap = super.getParams(request);
		if (XX.isPost(request) && employeeService.create(paramsMap).status) {
			return "employee/index";
		} else {
			return "employee/create";
		}
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@RequestMapping("/delete.html")
	public String delete(HttpServletRequest request, Model model) throws Exception {
		return "employee/delete";
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@RequestMapping("/goEdit.html")
	public String goEdit(HttpServletRequest request, Model model) throws Exception {
		return "employee/goEdit";
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@RequestMapping("/edit.html")
	public String edit(HttpServletRequest request, Model model) throws Exception {
		return "employee/edit";
	}

}
