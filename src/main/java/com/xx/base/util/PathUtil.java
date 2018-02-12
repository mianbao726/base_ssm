package com.xx.base.util;

import java.io.File;

public class PathUtil {
	
	/**
	 * 获取项目跟路径
	 * @return
	 */
	public static String getBase(){
		return System.getProperty("user.dir");
	}
	
	/**
	 * 获取数据库资源备份文件路径 
	 * @return
	 */
	public static String getSourcesPath(){
		StringBuilder sb = new StringBuilder();
		sb.append(getBase()).append(File.separator).append("src").append(File.separator).append("main").append(File.separator).append("resources").append(File.separator).append("sql_dumps").append(File.separator);
		return sb.toString();
	}
	
	public static void main(String[] args) {
		System.out.println(PathUtil.getSourcesPath());
	}
}
