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
import com.xx.base.util.rsa.way001.*;

/**
 * spend 花销 repay 还款 check 检查 water 线下流水 
 * 
 * @author generate by www.whatgoogle.com (ps : some question? contact
 *         zhuwj726@gmail.com)
 */
@Controller
@RequestMapping("/credit")
public class CreditController extends BaseController {

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
		// List<Map<String, Object>> data = criditService.index(null);
		Map<String, Object> data = criditService.index(new HashMap());
		ret.put("data", data.get("data"));
		ret.put("recordsTotal", Integer.valueOf(((List) data.get("data")).size()));
		ret.put("recordsFiltered", Integer.valueOf(((List) data.get("data")).size()));
		return JSONObject.toJSONString(ret);
	}

	/**
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/getdetialdata.html")
	public @ResponseBody
	String getdetialdata(HttpServletRequest request, Model model) throws Exception {
		Map ret = null;
		ret = new QMap("200");
		Map page = super.getParams(request);
		System.out.println(page);
		if(page.containsKey("reservation")){
			page.put("s_date", page.get("reservation").toString().split("-")[0].replaceAll(" ", ""));
			page.put("e_date", page.get("reservation").toString().split("-")[1].replaceAll(" ", ""));
		}
		Map<String, Object> data = criditService.detail(page);
		ret.put("data", data.get("data"));
		ret.put("recordsTotal", Integer.valueOf(((List) data.get("data")).size()));
		ret.put("recordsFiltered", Integer.valueOf(((List) data.get("data")).size()));
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
	@RequestMapping("/getCreditInfos.do")
	public @ResponseBody
	String getCreditInfos(HttpServletRequest request, Model model) throws Exception {
		Map paramsMap = super.getParams(request);
		paramsMap.put("creditCardInfo", criditService.getCreditInfos(paramsMap));
		paramsMap.put("status_code", "200");
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

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@RequestMapping("/setBillInfo.do")
	public @ResponseBody
	String setBillInfo(HttpServletRequest request, Model model) throws Exception {
		Map paramsMap = super.getParams(request);
		paramsMap.put("setBillInfo", criditService.setBillInfo(paramsMap));
		paramsMap.put("status_code", "200");
		return JSONObject.toJSONString(paramsMap);
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@RequestMapping("/summaryInformation.do")
	public @ResponseBody
	String summaryInformation(HttpServletRequest request, Model model) throws Exception {
		Map paramsMap = super.getParams(request);
		paramsMap.put("setBillInfo", criditService.summaryInformation(paramsMap));
		paramsMap.put("status_code", "200");
		return JSONObject.toJSONString(paramsMap);
	}
	
	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@RequestMapping("/setSummaryInfo.do")
	public @ResponseBody
	String setSummaryInfo(HttpServletRequest request, Model model) throws Exception {
		Map paramsMap = super.getParams(request);
		paramsMap.put("setBillInfo", criditService.setSummaryInfo(paramsMap));
		paramsMap.put("status_code", "200");
		return JSONObject.toJSONString(paramsMap);
	}
	

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact zhuwj726@gmail.com)
	 */
	 @RequestMapping("/water.do")
	public @ResponseBody String water(HttpServletRequest request, Model model)throws Exception{
		 Map<String, Object> paramsMap = super.getParams(request);
			criditService.water(paramsMap);
			return JSONObject.toJSONString(paramsMap);
	}
	 /**
	  * @author generate by www.whatgoogle.com (ps : some question? contact zhuwj726@gmail.com)
	  */
	 @RequestMapping("/cancel_this.do")
	 public @ResponseBody String cancel_this(HttpServletRequest request, Model model)throws Exception{
		 Map<String, Object> paramsMap = super.getParams(request);
		 criditService.cancel_this(paramsMap);
		 return JSONObject.toJSONString(paramsMap);
	 }
	 /**
	  * @author generate by www.whatgoogle.com (ps : some question? contact zhuwj726@gmail.com)
	  */
	 @RequestMapping("/delete_this.do")
	 public @ResponseBody String delete_this(HttpServletRequest request, Model model)throws Exception{
		 Map<String, Object> paramsMap = super.getParams(request);
		 criditService.delete_this(paramsMap);
		 return JSONObject.toJSONString(paramsMap);
	 }
	 /**
	  * @author generate by www.whatgoogle.com (ps : some question? contact zhuwj726@gmail.com)
	  */
	 @RequestMapping("/repayment.do")
	 public @ResponseBody String repayment(HttpServletRequest request, Model model)throws Exception{
		 Map<String, Object> paramsMap = super.getParams(request);
		 criditService.repayment(paramsMap);
		 return JSONObject.toJSONString(paramsMap);
	 }
	 /**
	  * @author generate by www.whatgoogle.com (ps : some question? contact zhuwj726@gmail.com)
	  */
	 @RequestMapping("/water_arrival.do")
	 public @ResponseBody String water_arrival(HttpServletRequest request, Model model)throws Exception{
		 Map<String, Object> paramsMap = super.getParams(request);
		 criditService.water_arrival(paramsMap);
		 return JSONObject.toJSONString(paramsMap);
	 }
	 /**
	  * @author generate by www.whatgoogle.com (ps : some question? contact zhuwj726@gmail.com)
	  */
	 @RequestMapping("/cash.do")
	 public @ResponseBody String cash(HttpServletRequest request, Model model)throws Exception{
		 Map<String, Object> paramsMap = super.getParams(request);
		 criditService.cash(paramsMap);
		 return JSONObject.toJSONString(paramsMap);
	 }
	 /**
	  * @author generate by www.whatgoogle.com (ps : some question? contact zhuwj726@gmail.com)
	  */
	 @RequestMapping("/alipay.do")
	 public @ResponseBody String alipay(HttpServletRequest request, Model model)throws Exception{
		 Map<String, Object> paramsMap = super.getParams(request);
		 criditService.alipay(paramsMap);
		 return JSONObject.toJSONString(paramsMap);
	 }
}
