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
import javax.ejb.CreateException;
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
@RequestMapping("/credit")
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
		return "credit/index";
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
		ret.put("data", data.get("data"));
		ret.put("recordsTotal", Integer.valueOf(((List)data.get("data")).size()));
		ret.put("recordsFiltered", Integer.valueOf(((List)data.get("data")).size()));
		return JSONObject.toJSONString(ret);
	}
	
	/**
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getdetialdata.html")
	public @ResponseBody
	String getdetialdata(HttpServletRequest request, Model model) throws Exception {
		Map ret = null;
		ret = new QMap("200");
		Map page = super.getParams(request);
		Map<String,Object> data = criditService.detail(page);
		ret.put("data", data.get("data"));
		ret.put("recordsTotal", Integer.valueOf(((List)data.get("data")).size()));
		ret.put("recordsFiltered", Integer.valueOf(((List)data.get("data")).size()));
		return JSONObject.toJSONString(ret);
	}
	
	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@RequestMapping("/pay.do")
	public @ResponseBody
	 String pay(HttpServletRequest request, Model model) throws Exception {
		Map paramsMap = super.getParams(request);
		paramsMap.put("status_code", "200");
		String bank = paramsMap.get("bank").toString();
		String cardno = paramsMap.get("cardno").toString();
		String amount = paramsMap.get("amount").toString();
		String type = paramsMap.get("type").toString();
		criditService.pay(paramsMap);
		return JSONObject.toJSONString(paramsMap);
	}
	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@RequestMapping("/au.html")
	public String au(HttpServletRequest request, Model model) throws Exception {
		return "credit/au";
	}
	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@RequestMapping("/detial.html")
	public String detial(HttpServletRequest request, Model model) throws Exception {
		return "credit/detial";
	}
	
}
