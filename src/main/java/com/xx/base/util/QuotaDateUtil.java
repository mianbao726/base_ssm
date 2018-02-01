package com.xx.base.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

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
	
	public static String format(Calendar cd,String f){
		SimpleDateFormat sdf = new SimpleDateFormat(f); 
		return sdf.format(cd.getTime());
	}
	
	public static String format(Calendar cd){
		return QuotaDateUtil.format(cd,"yyyy-MM-dd");
	}
	
	public static void main(String[] args) {
		QuotaDateUtil.getMonthDate("3");
	}
}
