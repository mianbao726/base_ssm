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
	private static final String yyyy_MM_dd_hh_mm_ss="yyyy-MM-dd hh:mm:ss";
	
	/**
	 * 获取完整格式的日期 精确到时分秒
	 * 默认格式  yyyy-MM-dd hh:mm:ss
	 * @return
	 */
	public static String getCurrentDateFull(){
		Date date=new Date();
    	SimpleDateFormat df=new SimpleDateFormat(yyyy_MM_dd_hh_mm_ss);
		return df.format(date);
	} 
	/**
	 * 获取默认的日期格式 yyyy-MM-dd
	 * @return
	 */
	public static String getCurrentDate(){
		Date date=new Date();
    	SimpleDateFormat df=new SimpleDateFormat(yyyy_MM_dd);
		return df.format(date);
	}
	/**
	 * 获取指定格式的日期
	 * 
	 * @param format 自定义格式
	 * @return
	 */
	public static String getCurrentDate(String format){
		Date date=new Date();
    	SimpleDateFormat df=new SimpleDateFormat(format);
		return df.format(date);
	}
	/**
	 * 获取format的格式日期
	 * @return
	 */
	public static Calendar setDay(String day){
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
	
	/**
	 * 获取format的格式日期
	 * @return
	 */
	public static String calMonth(Calendar calendar,int month ){
		calendar.add(calendar.MONTH, month);
		Date d = calendar.getTime();
		SimpleDateFormat df=new SimpleDateFormat(yyyy_MM_dd);
    	return df.format(d);
	}
	
	/**
	 * 与当前系统日期作对比
	 * 
	 * @param d1
	 * @return
	 */
	public static int compare(String d1){
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat(yyyy_MM_dd);
		try {
			c1.setTime(sdf.parse(d1));
			c2.setTime(sdf.parse(DateUtil.getCurrentDate(yyyy_MM_dd)));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println(DateUtil.formatCalendar(c1) +"  " + DateUtil.formatCalendar(c2));
		return c1.compareTo(c2);
	}
	
	/**
	 * d1与d2比较日期
	 * @param d1
	 * @param d2
	 * @return
	 */
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
	
	/**
	 * 将当前日期
	 * @param date
	 * @param count
	 * @return
	 */
	public  static String after(String date , String count){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date d = null;
		try {
			d = sdf.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(d);
		calendar.add(calendar.DAY_OF_MONTH, Integer.parseInt(count));
		return sdf.format(calendar.getTime());
	}
	/**
	 * 重载public  static String after(String date , String count)
	 * @param date
	 * @param count
	 * @return
	 */
	public  static String after(String date , int count){
		return after(date, count+"");
	}
	
	public static Calendar str2Calendar(String str){
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = sdf.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar;
	}
	
	/**
	 * 计算两个日期的相差的天数
	 * @param date1
	 * @param date2
	 * @return
	 */
	public static int daysBetween(String d1,String d2){ 
//		System.out.println( d1 + "  " + d2);
		    Calendar cal =  str2Calendar(d1); 
	        long time1 = cal.getTimeInMillis();                  
	        Calendar cal2 =  str2Calendar(d2); 
	        long time2 = cal2.getTimeInMillis();          
	        long between_days=(time2-time1)/(1000*3600*24);     
	       return Integer.parseInt(String.valueOf(between_days));   
		}
}
