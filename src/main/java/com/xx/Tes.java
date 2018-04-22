package com.xx;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

public class Tes {
public static void main(String[] args) throws ParseException {
	 String string = "2018-1-31";
	 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	 System.out.println(sdf.parse(string));
	
	
	Date date=sdf.parse(string);
	Calendar cal=Calendar.getInstance();
	cal.setTime(date);
	System.out.println(cal);
//	cal.add(Calendar.DATE, 1);
	cal.add(Calendar.MONTH, 1);
	
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.CHINA);  
    System.out.println(format.format(cal.getTime()));  
}
}
