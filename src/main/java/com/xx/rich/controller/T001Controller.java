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
package com.xx.rich.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.xx.base.controller.BaseController;
import com.xx.base.util.map.QMap;
import com.xx.rich.service.T001Service;

/**
 * @author generate by www.whatgoogle.com (ps : some question? contact
 *         zhuwj726@gmail.com) 
 */
@Controller
@RequestMapping("/t001")
public class T001Controller extends BaseController {
	
	@Resource
	private T001Service t001Service;
	
	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@RequestMapping("/index.html")
	public String index(HttpServletRequest request, Model model) throws Exception {
		return "t001/index";
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@RequestMapping("/list.html")
	public @ResponseBody
	String list(HttpServletRequest request, Model model) throws Exception {
		Map ret = new QMap("200");
		 ret = t001Service.queryPageForMap(ret);
		return JSONObject.toJSONString(ret);
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@RequestMapping("/add.html")
	public String add(HttpServletRequest request, Model model) throws Exception {
		return "t001/add";
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@RequestMapping("/update.html")
	public String update(HttpServletRequest request, Model model) throws Exception {
		return "t001/update";
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@RequestMapping("/del.html")
	public String del(HttpServletRequest request, Model model) throws Exception {
		return "t001/del";
	}
}
