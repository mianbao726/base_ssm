package com.xx.base.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.ws.rs.core.Response.Status.Family;

public class QuotaDateUtil {
	/**
	 * 计算账单日
	 * @param date
	 * @return
	 */
	public static Calendar getMonthDate (String date){
		Calendar c = Calendar.getInstance();
		c.setTime(new Date());
		System.out.println(c.get(Calendar.DAY_OF_MONTH)+"  "  + "  " +Integer.valueOf(date));
		if(c.get(Calendar.DAY_OF_MONTH)>Integer.valueOf(date)){
//			c.add(Calendar.DATE, Integer.valueOf(date));
			c.add(Calendar.MONTH, 1);
		}
		c.set(Calendar.DATE, Integer.valueOf(date));
		System.out.println(format(c,"yyyy-MM-dd"));
		return c;
	} 
	
	/**
	 * 计算还款日
	 * @param date
	 * @return
	 */
	public static Calendar getRepayDate(String date,String dayCount){
		Calendar c = Calendar.getInstance();
		Date d = QuotaDateUtil.parse(date);
		c.setTime(d);
		c.add(Calendar.DATE, Integer.valueOf(dayCount));
		System.out.println(format(c,"yyyy-MM-dd"));
		return c;
	} 
	
	/**
	 * 计算还款日
	 * @param date
	 * @return
	 */
	public static Calendar getRepayFixedDate(String date,String dayCount,String isNextMonth){
		Calendar c = Calendar.getInstance();
		Date d = QuotaDateUtil.parse(date);
		c.setTime(d);
		c.set(Calendar.DATE, Integer.parseInt(dayCount));
		c.add(Calendar.MONTH, Integer.parseInt(isNextMonth));
		System.out.println(format(c,"yyyy-MM-dd"));
		return c;
	} 
	
	
	public static void main(String[] args) {
		getRepayDate("2018-01-01","15");
	}
	
	
	
	public static String format(Calendar cd,String f){
		SimpleDateFormat sdf = new SimpleDateFormat(f); 
		return sdf.format(cd.getTime());
	}
	
	public static Date parse(String date,String f){
		SimpleDateFormat sdf = new SimpleDateFormat(f);
		Date ret = null;
		try {
			ret = sdf.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			return ret; 
		}
	}
	
	public static String format(Calendar cd){
		return QuotaDateUtil.format(cd,"yyyy-MM-dd");
	}
	
	public static Date parse(String date){
		return QuotaDateUtil.parse(date,"yyyy-MM-dd");
	}
	
}
