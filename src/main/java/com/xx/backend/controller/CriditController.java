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

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.xx.backend.service.CriditService;
import com.xx.base.controller.BaseController;
import com.xx.base.util.map.QMap;

/**
 * @author generate by www.whatgoogle.com (ps : some question? contact
 *         zhuwj726@gmail.com)
 */
@Controller
@RequestMapping("/cridit")
public class CriditController extends BaseController {

	// XXX
	@Resource
	private CriditService criditService;

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@RequestMapping("/index.html")
	public String index(HttpServletRequest request, Model model) throws Exception {
		return "cridit/index";
	}

	/**
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getdata.html")
	public @ResponseBody
	String getdata(HttpServletRequest request, Model model) throws Exception {
		Map ret = null;
		ret = new QMap("200");
//		List<Map<String, Object>> data = criditService.index(null);
		Map<String,Object> data = criditService.index(new HashMap());
		int count = 200;// 99999 => 20s 9999
		ret.put("data", data.get("data"));
		ret.put("recordsTotal", Integer.valueOf(count));
		ret.put("recordsFiltered", Integer.valueOf(count));
		return JSONObject.toJSONString(ret);
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@RequestMapping("/pay.html")
	public String pay(HttpServletRequest request, Model model) throws Exception {
		return "cridit/pay";
	}
}
