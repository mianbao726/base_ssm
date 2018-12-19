package com.xx.base.util;

public class Element {
	public static String build_input(Column c){
		StringBuilder sb = new StringBuilder();
		switch (c.type){
			case 1:
				sb.append("<input name = ");
				sb.append("\"");
				sb.append(c.getC001());
				sb.append("\"");
				sb.append("/>");
				break;
			default:
				break;
		}
		return sb.toString();
	}
	public static void main(String[] args) {
		Column c = new Column();
		c.type = 1;
		c.setC001("age");
		System.out.println(build_input(c));
	}
}
