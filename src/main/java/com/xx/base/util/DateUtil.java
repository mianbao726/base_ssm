package com.xx.base.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 获取指定格式的日期字符串,主要防止重复,按照日期命名
 * @author xx
 *
 */
public class DateUtil {
	/**
	 * 获取默认的格式日期
	 * @return
	 */
	public static String getDateTitle(){
		Date date=new Date();
    	SimpleDateFormat df=new SimpleDateFormat("yyyy.MM.dd|hh:mm:ss");
		return df.format(date);
	} 
	/**
	 * 获取format的格式日期
	 * @return
	 */
	public static String getDateTitle(String format){
		Date date=new Date();
    	SimpleDateFormat df=new SimpleDateFormat(format);
		return df.format(date);
	} 
}
