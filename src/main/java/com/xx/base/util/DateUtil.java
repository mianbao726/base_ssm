package com.xx.base.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 获取指定格式的日期字符串,主要防止重复,按照日期命名
 * @author xx
 *
 */
public class DateUtil {
	private static final String yyyy_MM_dd="yyyy-MM-dd";
	/**
	 * 获取默认的格式日期
	 * @return
	 */
	public static String format(){
		Date date=new Date();
    	SimpleDateFormat df=new SimpleDateFormat("yyyy.MM.dd|hh:mm:ss");
		return df.format(date);
	} 
	/**
	 * 获取format的格式日期
	 * @return
	 */
	public static String format(String format){
		Date date=new Date();
    	SimpleDateFormat df=new SimpleDateFormat(format);
		return df.format(date);
	}
	/**
	 * 获取format的格式日期
	 * @return
	 */
	public static Calendar formatCalendar(String day){
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
    	SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
    	calendar.set(Calendar.DAY_OF_MONTH, Integer.parseInt(day));
    	return calendar;
	}
	/**
	 * 获取format的格式日期
	 * @return
	 */
	public static String formatCalendar(Calendar calendar ){
		Date d = calendar.getTime();
		SimpleDateFormat df=new SimpleDateFormat(yyyy_MM_dd);
    	return df.format(d);
	}
	
	public static int compare(String d1,String d2){
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat(yyyy_MM_dd);
		try {
			c1.setTime(sdf.parse(d1));
			c2.setTime(sdf.parse(d2));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return c1.compareTo(c2);
	}
	public static int compare(String d1){
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat(yyyy_MM_dd);
		try {
			c1.setTime(sdf.parse(d1));
			c2.setTime(sdf.parse(DateUtil.format(yyyy_MM_dd)));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return c1.compareTo(c2);
	}
	public  static String after(String c , String count){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date d = null;
		try {
			d = sdf.parse(c);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(d);
		calendar.add(calendar.DAY_OF_MONTH, Integer.parseInt(count));
		return sdf.format(calendar.getTime());
	}
}
