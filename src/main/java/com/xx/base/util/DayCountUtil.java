package com.xx.base.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 账单天数计算
 * 
 * @author xx
 */
public class DayCountUtil {
	public static void main(String[] args) {
		String month_bill_date = "10";
		Integer i = Integer.parseInt(month_bill_date);
		Calendar c = DayCountUtil.getNow();
		DayCountUtil.dis(c);
		Calendar c1 = DayCountUtil.getNow();
		c1.set(Calendar.DAY_OF_MONTH, i);
		DayCountUtil.dis(c1);
		System.out.println(c1.before(c));
		c.set(Calendar.DAY_OF_MONTH, i);
		DayCountUtil.dis(c1);
		DayCountUtil.dis(c);
		System.out.println(c.compareTo(c1));
	}

	public static String dis(Calendar c){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String ret = sdf.format(c.getTime());
		System.out.println(ret);
		return ret;
	}
	
	private static Calendar getNow() {
		Calendar c = Calendar.getInstance();
		c.setTime(new Date());
		return c;
	}
}
