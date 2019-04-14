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

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Calendar;
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
import com.xx.base.util.DateUtil;
import com.xx.base.util.ListUtil;
import com.xx.base.util.map.QMap;

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
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/getdata.html")
	public @ResponseBody
	String getdata(HttpServletRequest request, Model model) throws Exception {
		Map ret = null;
		ret = new QMap("200");
		// List<Map<String, Object>> data = criditService.index(null);
		Map<String, Object> data = criditService.index(new HashMap());
		ret.put("data", data.get("data"));
//		ret.put("day", DateUtil.getCurrentDate("d"));
		ListUtil.display((List<Map<String,Object>>)data.get("data"));
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
	@RequestMapping("/resetTodayTrade.do")
	public @ResponseBody
	String resetTodayTrade(HttpServletRequest request, Model model) throws Exception {
		Map paramsMap = super.getParams(request);
		paramsMap.put("status_code", "200");
		criditService.resetTodayTrade(paramsMap);
		return JSONObject.toJSONString(paramsMap);
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@RequestMapping("/getCreditInfos.do")
	public @ResponseBody
	String getCreditInfos(HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> paramsMap = super.getParams(request);
		paramsMap.put("creditCardInfo", criditService.getCreditInfos(paramsMap));
		paramsMap.put("status_code", "200");
		return JSONObject.toJSONString(paramsMap);
	}
	
	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@RequestMapping("/checkRecentRecord.do")
	public @ResponseBody
	String checkRecentRecord(HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> paramsMap = super.getParams(request);
//		paramsMap.put("records", criditService.checkRecentRecord(paramsMap));
		paramsMap=  criditService.checkRecentRecord(paramsMap);
		paramsMap.put("status_code", "200");
		return JSONObject.toJSONString(paramsMap);
	}
	
	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@RequestMapping("/addRemark.do")
	public @ResponseBody
	String addRemark(HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> paramsMap = super.getParams(request);
		Map<String,Object> info = criditService.addRemark(paramsMap);
		List<Map<String, Object>> ret =(List<Map<String, Object>>) info.get("newRemarks");
		paramsMap.put("remarks", ret);
		paramsMap.put("duplicate", info.get("duplicate"));
		paramsMap.put("status_code", "200");
		return JSONObject.toJSONString(paramsMap);
	}
	
	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@RequestMapping("/getRemarks.do")
	public @ResponseBody
	String getRemarks(HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> paramsMap = super.getParams(request);
		paramsMap.put("remarks", criditService.getRemarks(paramsMap));
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
		Map<String, Object> paramsMap = super.getParams(request);
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
	 @RequestMapping("/updateRecord.do")
	 public @ResponseBody String updateRecord(HttpServletRequest request, Model model)throws Exception{
		 Map<String, Object> paramsMap = super.getParams(request);
		 criditService.updateRecord(paramsMap);
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
	 
	 @RequestMapping("/refesh_bill_date.do")
	 public @ResponseBody String refesh_bill_date(HttpServletRequest request, Model model)throws Exception{
		 Map<String, Object> paramsMap = super.getParams(request);
		 criditService.refesh_bill_date(paramsMap);
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

	public static void main(String[] args) {
		String count = "18";//还款天数
		String bill_day = "10";//账单日期
		String bill_amount = "1900";//账单金额
		String pre_bill_amount ="9822";//未出账单金额
		
		String bill_date_start =DateUtil.calMonth(DateUtil.setDay(bill_day),-1);//上一个账单日　当前账单的账单日期 开始   (DateUtil.formatCalendar格式化日期)
		String bill_date_end =DateUtil.formatCalendar(DateUtil.setDay(bill_day));//账单日　当前账单账单日期 结束     (DateUtil.formatCalendar格式化日期)
		String pay_date =DateUtil.after(bill_date_end, count);//当前账单日的最后还款日期　　根据账单日 和 还款天数 计算出最后还款日
		String next_bill_date =DateUtil.calMonth(DateUtil.setDay(bill_day),1);//下一月的账单日
		String next_pay_date =DateUtil.after(next_bill_date, count);//下一月的账单日的最后还款日
		String current_date = DateUtil.getCurrentDate();//当前日期
		
		System.out.println("账单周期: (" +bill_date_start + "~"+  bill_date_end + ")  还款日期:" + pay_date + "  当前日期 :" + current_date);
		System.out.println("账单金额: " + bill_amount + "  未出账单金额:" + pre_bill_amount);
		if(Integer.parseInt(bill_amount)>0  ){// 当前账单不为零
			System.out.println("-----需要生成账单-----");
			System.out.println("账单周期                               :"+bill_date_start+ " ~ "+  bill_date_end);
			System.out.println("还款日期                               :"+pay_date + "    " +DateUtil.daysBetween(current_date, pay_date) +  " 天内账单到期"+"        账单金额:"+bill_amount  );
			if(DateUtil.daysBetween(bill_date_end,current_date ) <0){
				System.out.println("账单日期                  :"+bill_date_end + "    " + (DateUtil.daysBetween(bill_date_end,current_date )+"").replace("-", "")  + "天后出账    " );
			}else{
				System.out.println("下一个账单日期                  :"+next_bill_date + "    当前月账单已出账:" + DateUtil.daysBetween(bill_date_end,current_date )  + "天    " + DateUtil.daysBetween(current_date, next_bill_date) +" 天后出下月账单");
			}
			if(DateUtil.daysBetween(bill_date_end,current_date ) <0){
				System.out.println("账单的还款日期     :" + pay_date +"    " +DateUtil.daysBetween(current_date,  pay_date)+" 天免息期 " );
			}else{
				System.out.println("下一个账单的还款日期     :" + next_pay_date +"    " +DateUtil.daysBetween(current_date, next_pay_date)+" 天免息期 " );
			}
			//账单信息　
			//银行`　卡`　账单年`　账单月`　账单年月`　账单统计开始日期`　账单统计结束日期`　账单最后还款日`　账单金额`  剩余未还金额`　*修正账单未还金额`
			
			//银行日期
			//  **部分银行出账期 和 还款期在同一个月 招行     部分不是**
			//账单日（每月的第几天）　出账后x天内需还款
			
			//当前账单年`　当前账单月`　当前账单年月日　当前账单统计开始日期　当前账单统计结束日期　当前最后还款日　当前账单金额   剩余还款金额  *修正当前账单金额　
			//当前月账单出账x天　x天内账单到期
			//未出账单金额　x天后出账下月的账单　x天免息期
		}
//		System.out.println(DateUtil.compare(DateUtil.formatCalendar(c)));
//		System.out.println(DateUtil.compare(DateUtil.after(bill_date_end, "17")));
		//剩余应还金额 以及 在多少天能应该还款
		//显示当前刷卡的最长免息期
	}
}

