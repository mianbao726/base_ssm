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
package com.xx.backend.service.impl;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.xx.backend.service.CriditService;
import com.xx.base.dao.BaseDao;
import com.xx.base.dao.PageServiceDao;
import com.xx.base.util.C;
import com.xx.base.util.DateUtil;
import com.xx.base.util.FeeCost;
import com.xx.base.util.MapUtil;

/**
 * @author generate by www.whatgoogle.com (ps : some question? contact
 *         zhuwj726@gmail.com)
 */
@Transactional
@Service
public class CriditServiceImpl extends PageServiceDao implements CriditService {

	@Resource
	private BaseDao baseDao;
	@Resource
	private PageServiceDao pageServiceDao;
	private static Logger log = Logger.getLogger(CriditServiceImpl.class);

	@Override
	public int add(Map<String, Object> map) {
		if("0".equals(map.get("type"))){//信用卡water
			map.put("safty_cost_fee", FeeCost.fee(map.get("amount").toString()) );
			map.put("type", "water");
		}else if ("1".equals(map.get("type"))){//信用卡消费
			map.put("safty_cost_fee", "0");
			map.put("type", "pay");
		}else if("2".equals(map.get("type"))){//现金消费
			if(!map.containsKey("remark"))map.put("remark", "现金消费");
			map.put("type", "cash");
			map.put("cardno", "**** **** **** 2132");
			map.put("bank", "ZSYH");
			map.put("safty_cost_fee", "0");
		}else if ("3".equals(map.get("type"))){//支付宝
			if(!map.containsKey("remark"))map.put("remark", "支付宝消费");
			map.put("type", "alipay");
			map.put("cardno", "**** **** **** 2012");
			map.put("bank", "ALTH");
			map.put("safty_cost_fee", "0");
		}else {//还款
			map.put("safty_cost_fee", "0");
			map.put("type", "repayment");
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		map.put("now",sdf.format(new Date()) );
		int ret = baseDao.insert("credit.cridit_insert", map);
		return ret;
	}
	public static void main(String[] args) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println(sdf.format(new Date()));
//		map.put("now",sdf.format(new Date()) );
	}

	@Override
	public int update(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int del(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Map<String, Object> selectOne(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> queryPageForMap(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	public Map<String, Object> index(Map<String, Object> map) {
		Map<String, Object> ret = pageServiceDao.index("credit.cridit_page", map);
		return ret;
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	public Map<String, List> getCreditInfos(Map<String, Object> map) {
		List<Map<String, Object>> l = baseDao.selectList("credit.getCreditInfos", map);
		Map<String, List> ret = new HashMap<String, List>();
		for (Map<String, Object> m : l) {
			String key = m.get("type").toString() + "_" + m.get("name").toString() + "_" + m.get("short_name").toString();
			List clist = ret.containsKey(key) ? ret.get(key) : new ArrayList<>();
			clist.add(m.get("no") + "_" + m.get("card_name"));
			ret.put(key, clist);
		}
		return ret;
	}
	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	public List<Map<String, Object>> getRemarks(Map<String, Object> map) {
		List<Map<String, Object>> l = baseDao.selectList("credit.getRemarks", map);
		return l;
	}
	
	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	public Map<String, Object> checkRecentRecord(Map<String, Object> map) {
		Map<String, Object> ret = new HashMap<String,Object>();
		//当前一个月内多少笔
		List<Map<String,Object>> in1Month = new ArrayList<Map<String,Object>>();
		List<Map<String,Object>> theLatest = new  ArrayList<Map<String,Object>>();
		boolean latest = true;
		List<Map<String, Object>> l = baseDao.selectList("credit.checkRecentRecord", map);
		for (Map<String, Object> map2 : l) {
			if(latest)theLatest.add(MapUtil.cloneMap(map2)) ;//最近一笔
			latest=false; // 第一笔标志
           	if(DateUtil.inXMonth(map2,-1,"cr_date"))in1Month.add(MapUtil.cloneMap(map2)); //在一个月内的交易
           	else break; //因为是按照交易时间倒序,
		}
		//历史共多少比
		ret.put("all", l);
		//当前一个月内多少笔
		ret.put("in1Month", in1Month);
		//最近一笔
		ret.put("latest",theLatest);
		return ret;
	}
	
	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	public Map<String, Object> addRemark(Map<String, Object> map) {
		Map<String,Object> ret = new HashMap<String, Object>();
		//检查是否有重复
		List<Map<String, Object>> ls = baseDao.selectList("credit.selectRemark", map);
		if(ls.size()>0){
			ret.put("duplicate", "0");
		}else{
			ret.put("duplicate", "1");
			map.put("name",map.get("remark"));
			baseDao.insert("credit.addRemark" , map);
			ret.put("newRemarks", baseDao.selectList("credit.getRemarks", map)) ;//当新输入的没有重复是插入信息的信息
		}
		return ret;
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	public Map<String, Object> detail(Map<String, Object> map) {
		return pageServiceDao.index("credit.cridit_page_detail", map);
	}
	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	public int resetTodayTrade(Map<String, Object> map) {
		return baseDao.update("credit.resetTodayCountAmount");
		
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	public String pay(Map<String, Object> map) {
		// 更新信用卡信息
		baseDao.update("credit.pay", map);
		// 更新银行信息
		baseDao.update("credit.pay_bank", map);
		// XXX 注释中应该有参数信息
		List clist = baseDao.selectList("credit.getCredit_List", map);
		if (1 != clist.size()) {
			Map<String, Object> mainCredit = (HashMap<String, Object>) clist.get(0);
			// baseDao.update("credit.pay",mainCredit);
			if (map.get("cardno").equals(mainCredit.get("no"))) {// 消费卡是主卡
				for (int index = 1; index < clist.size(); index++) {
					Map<String, Object> credit = (HashMap<String, Object>) clist.get(index);
					credit.put("amount", map.get("amount"));
					credit.put("remaining_credit_main", mainCredit.get("remaining_credit"));
					baseDao.update("credit.creditOtherCard", credit);
				}
			} else {// 消费卡不是主卡

			}
		}
		add(map);
		return null;
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	public String setBillInfo(Map<String, Object> map) {
		int count = baseDao.update("credit.setBillInfo", map);
		upateSummaryInfo();
		return count == 1 ? "success" : "fail";
	}

	public void touchBank(Map<String, Object> map){
		baseDao.update("credit.update_touch_date", map);
	}
	
	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	public List summaryInformation(Map<String, Object> map) {
		return baseDao.selectList("credit.summaryInformation", map);
	}
	
	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@SuppressWarnings("rawtypes")
	public List setSummaryInfo(Map<String, Object> map) {
		System.out.println(map);
		List ret = baseDao.selectList("credit.setSummaryInfo", map);
		upateSummaryInfo();
		return ret;
	}
	
	public void upateSummaryInfo(){
		baseDao.update("credit.update_summary_info");
	}
	
	/**
	 * 入账方法
	 */
	public String water(Map<String, Object> map) {
		baseDao.update("credit.water_bank", map); // 更新银行信息
		if("0".equals(map.get("type"))){// 判断是否是银行流水类型
			baseDao.update("credit.wj_financial_information_next_day_arrival", map); // 修改次日到账信息
		}
		add(map);// 添加消费记录表信息
		addRemark(map);//检查消费备注是否需要加入 
		return null;
	}
	public String updateRecord(Map<String, Object> map) {
		baseDao.update("credit.updateRecord", map);
		map.put("remark", map.get("editable-select"));
		addRemark(map);//检查备注是否需要加入
		return null;
	}
	public String cancel_this(Map<String, Object> map) {
		Map<String, Object> p = baseDao.selectOne("credit.select_one_wj_record_by_id",map);
		baseDao.update("credit.water_bank_cancel", p);
		baseDao.update("credit.water_bank_cancel_record", map);
		return null;
	}
	public String delete_this(Map<String, Object> map) {
		baseDao.update("credit.delete_water_bank_cancel_record", map);
		return null;
	}
	public String water_arrival(Map<String, Object> map) {
		baseDao.update("credit.water_arrival", map);
		return null;
	}
	public String cash(Map<String, Object> map) {
		map.put("type", "2");
		map.put("amount", map.get("cash_amount"));
		add(map);
		baseDao.update("credit.cash", map);
		upateSummaryInfo();
		return null;
	}
	public String alipay(Map<String, Object> map) {
		map.put("type", "3");
		map.put("amount", map.get("alipay_amount"));
		add(map);
		baseDao.update("credit.alipay", map);
		upateSummaryInfo();
		return null;
	}
	public String refesh_bill_date(Map<String, Object> map) {
		map.put("type", "3");
		map.put("amount", map.get("alipay_amount"));
		add(map);
		baseDao.update("credit.alipay", map);
		upateSummaryInfo();
		return null;
	}
	/**
	 * repayment_amount 还款金额
	 * repayment_bank还款银行
	 */
	public String repayment(Map<String, Object> map) {
		@SuppressWarnings("unchecked")
		Map<String, Object> info =  (Map<String, Object>) baseDao.selectList("credit.getAllCreditInfos",map).get(0);
		BigDecimal repayment_amount = new BigDecimal(map.get("repayment_amount").toString()); // 还款金额
		BigDecimal bill_amount = new BigDecimal(info.get("bill_amount").toString()); // 当前账单金额
		BigDecimal pre_bill_amount = new BigDecimal(info.get("pre_bill_amount").toString()); // 未出账单金额
		BigDecimal remaining_credit = new BigDecimal(info.get("remaining_credit").toString()); // 剩余额度
		
		if(bill_amount.compareTo(C.ZERO)>0){//当前账单有未还金额
			if(repayment_amount.compareTo(bill_amount)>0){//还款金额大于当前账单金额
				BigDecimal bill_amount_overflow = repayment_amount.subtract(bill_amount);// 还款金额大于当前账单金额溢出的还款金额
				bill_amount = C.ZERO;//当前账单清零
				if(pre_bill_amount.compareTo(C.ZERO)>0){ //有未出账单
					if(bill_amount_overflow.compareTo(pre_bill_amount)>0){//刨除当前账单金额后，比未出账单的金额还大
						pre_bill_amount =C.ZERO;
					}else{//刨除当前账单金额后，比未出账单金额小
						pre_bill_amount =pre_bill_amount.subtract(bill_amount_overflow);
					}
				}else{//无未出账单
					pre_bill_amount =C.ZERO;
				}
				remaining_credit = remaining_credit.add(repayment_amount);//恢复额度
			}else{//还款金额小于等于当前账单金额
				bill_amount = bill_amount.subtract(repayment_amount);//当前账单还款
				remaining_credit = remaining_credit.add(repayment_amount);//恢复额度
			}
		}else if(bill_amount.compareTo(C.ZERO)<=0 && pre_bill_amount.compareTo(C.ZERO)>0){// 当前账单还清，未出账单金额不为0
			if(repayment_amount.compareTo(pre_bill_amount)>0){//比未出账单的金额还大
				pre_bill_amount =C.ZERO;
			}else{//比未出账单金额小
				pre_bill_amount =pre_bill_amount.subtract(repayment_amount);
			}
			remaining_credit = remaining_credit.add(repayment_amount);//恢复额度
		}else if(bill_amount.compareTo(C.ZERO)<=0 && pre_bill_amount.compareTo(C.ZERO)<=0){// 当前账单还清，未出账单金额为0
			remaining_credit = remaining_credit.add(repayment_amount);//恢复额度
		}
		map.put("amount", repayment_amount.toString());
		map.put("remark", "还款");
		map.put("bank", "ZSYH");
		map.put("cardno", "**** **** **** 2132");
		map.put("bill_amount", bill_amount);
		map.put("pre_bill_amount", pre_bill_amount);
		map.put("remaining_credit", remaining_credit);
		add(map);
		baseDao.update("credit.repayment", map);
		return null;
	}
}
