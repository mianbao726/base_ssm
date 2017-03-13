package com.man.base.util;

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
		points.add(new Point("xx_author", "zhuwj@726@gmail.com"));
	}

	
	
	public KeyPoints(ClassBuilder cb) {
		super();
		if(cb instanceof Claxx){
			Claxx c = (Claxx)cb;
			points.add(new Point("xx_package_name", c.getPackage_name()+";"));
			points.add(new Point("xx_import_name", ""));
			points.add(new Point("xx_requestMapping_name", "/"+c.getRequestMapping_name()));
			points.add(new Point("xx_class_name", c.getClass_name()));
		}else if (cb instanceof Method){
			Method c = (Method)cb;
			points.add(new Point("xx_return", c.getReturn_name()));
			points.add(new Point("xx_method_name", c.getMethod_name()));
			points.add(new Point("xx_param", c.getParam_name()));
		}
	}



	public List<Point> getPoints() {
		return points;
	}


}
