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

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xx.base.controller.BaseController;

/**
 * @author generate by www.whatgoogle.com (ps : some question? contact zhuwj@726@gmail.com)
 */
@Controller
@RequestMapping("/test")
public class TestController extends BaseController {

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact zhuwj@726@gmail.com)
	 */
	 @RequestMapping("/index.html")
	public String index(HttpServletRequest request, Model model)throws Exception{
		return "test/index";
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact zhuwj@726@gmail.com)
	 */
	 @RequestMapping("/add.html")
	public String add(HttpServletRequest request, Model model)throws Exception{
		return "test/add";
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact zhuwj@726@gmail.com)
	 */
	 @RequestMapping("/save.html")
	public String save(HttpServletRequest request, Model model)throws Exception{
		return "test/save";
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact zhuwj@726@gmail.com)
	 */
	 @RequestMapping("/delete.html")
	public String delete(HttpServletRequest request, Model model)throws Exception{
		return "test/delete";
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact zhuwj@726@gmail.com)
	 */
	 @RequestMapping("/edit.html")
	public String edit(HttpServletRequest request, Model model)throws Exception{
		return "test/edit";
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact zhuwj@726@gmail.com)
	 */
	 @RequestMapping("/update.html")
	public String update(HttpServletRequest request, Model model)throws Exception{
		return "test/update";
	}
}
