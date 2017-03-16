package com.man.base.util;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;


public class KeyPoints {
	private final List<Point> points = new ArrayList<Point>();

	public class Point {
		String k;
		String v;

		public Point(String k, String v) {
			this.k = k;
			this.v = v;
		}
	}

	{
		points.add(new Point("xx_author", "@author generate by www.whatgoogle.com (ps : some question? contact zhuwj@726@gmail.com)"));
	}

	
	
	public KeyPoints(ClassBuilder cb) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {
		super();
		if(cb instanceof Claxx){
			Claxx c = (Claxx)cb;
			points.add(new Point("xx_package_name", c.getPackage_name()+";"));
			points.add(new Point("xx_import_name", ""));
			points.add(new Point("xx_requestMapping_name", "/"+c.getRequestMapping_name()));
			points.add(new Point("xx_class_name", c.getClass_name()));
		}else if (cb instanceof XX_Method){
			XX_Method c = (XX_Method)cb;
			
			
//			c.getClass().getDeclaredMethod(f.getName().substring(0,1).toUpperCase()+f.getName().substring(1),null
			Class claxx = c.getClass();
					
			for(Field f :claxx.getDeclaredFields()){
				System.out.println(f.getName());
				points.add(new Point("xx_"+f.getName().substring(0, f.getName().indexOf("_")), (String)(claxx.getMethod("get"+upperFirstCharter(f.getName())).invoke(c))));
			}
			// points.add(new Point("xx_return", c.getReturn_name()));
			// points.add(new Point("xx_method_name", c.getMethod_name()));
			// points.add(new Point("xx_param", c.getParam_name()));
			//
			// points.add(new Point("xx_request", c.getRequest_name()));
			// points.add(new Point("xx_tail", c.getTail_name()));
			// points.add(new Point("xx_pack", c.getPack_name()));
			// points.add(new Point("xx_page", c.getPage_name()));
		}
	}
	
	public static String upperFirstCharter(String str){
		return str.substring(0,1).toUpperCase()+str.substring(1); 
	}

	public static void main(String[] args) throws NoSuchMethodException, SecurityException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		XX_Method c = new XX_Method("1", "2", "3", "4", "5", "6");
//		for(Field f :c.getClass().getDeclaredFields()){
//			System.out.println(f.getName());
//		}
		 Class clazz = c.getClass(); 
		 Method m = clazz.getMethod("getTail_name");
		 System.out.println(m.invoke(c));
	}


	public List<Point> getPoints() {
		return points;
	}


}
