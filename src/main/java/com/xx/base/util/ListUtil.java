package com.xx.base.util;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class ListUtil {
	/**
	 * 循环显示信息
	 * 
	 * @param list
	 */
	public static void display(List<Map<String, Object>> list) {
		for (Map<String, Object> map : list) {
			for (Entry<String, Object> entry : map.entrySet()) {
				System.out.print(entry.getKey()+"  =>  " + entry.getValue() +"  ");
			}
			System.out.println();
		}
	}
}
