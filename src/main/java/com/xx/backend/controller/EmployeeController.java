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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		Map ret = new QMap("200");
		ret = employeeService.queryPageForMap(ret);
		return JSONObject.toJSONString(ret);
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@RequestMapping("/create.html")
	public String create(HttpServletRequest request,RedirectAttributes attr, Model model) throws Exception {
		Map paramsMap = super.getParams(request);
		return "employee/create";
	}
	
	@RequestMapping("/update.htm")
	public @ResponseBody
	String update(HttpServletRequest request, Model model) throws Exception {
		Map paramsMap = super.getParams(request);
		paramsMap = employeeService.getInfo(paramsMap);
		return JSONObject.toJSONString(paramsMap);
	}
	
	@RequestMapping("/upload.html")
	public String pic(HttpServletRequest request,RedirectAttributes attr, Model model) throws Exception {
		Map paramsMap = super.getParams(request);
		return "employee/upload";
	}
	
	@RequestMapping("/update.ht")
	public @ResponseBody
	String update(HttpServletRequest request) throws Exception {
		Map paramsMap = super.getParams(request);
		paramsMap = employeeService.updateInfo(paramsMap);
		return JSONObject.toJSONString(paramsMap);
	}
	
	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@RequestMapping("/create.htm")
	public @ResponseBody
	String create(HttpServletRequest request, Model model) throws Exception {
		Map paramsMap = super.getParams(request);
		Map ret = new QMap("200");
		if (XX.isPost(request) && employeeService.create(paramsMap).status) {
			ret = employeeService.queryPageForMap(ret);
		} 
		return JSONObject.toJSONString(ret);
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@RequestMapping("/delete.html")
	public @ResponseBody
	String delete(HttpServletRequest request, Model model) throws Exception {
		Map paramsMap = super.getParams(request);
		Map ret = employeeService.delete(paramsMap);
		ret = new QMap(200);
		return JSONObject.toJSONString(ret);
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
