package com.man.base.util;

import java.util.Collection;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Util {
	/**
	 * 过滤资源文件
	 * 
	 * @param url
	 * @return
	 */
	public static boolean exceptReq(String url) {
		Matcher matcher = Pattern.compile(C.RESOURCE_PATTERN).matcher(url);
		return matcher.find() ? false : true;
	}

	/**
	 * 合并数组
	 * 
	 * @param array_a
	 * @param array_b
	 * @return
	 */
	public static String[] concat(String[] array_a, String[] array_b) {
		String[] c = new String[array_a.length + array_b.length];
		System.arraycopy(array_a, 0, c, 0, array_a.length);
		System.arraycopy(array_b, 0, c, array_a.length, array_b.length);
		return c;
	}

	/**
	 * 拼接字符串
	 * 
	 * @param array
	 * @param interval
	 * @return
	 */
	public static <T> String buildStr(T[] array, String interval) {
		StringBuilder sb = new StringBuilder();
		for (T t : array) {
			sb.append(t.toString());
			sb.append(interval);
		}
		return sb.substring(0, sb.length() - 1);
	}
	
}
