package com.xx.base.util;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

/**
 * map 工具
 * @author xx
 *
 */
public class MapUtil {
	
	/**
	 * 解决FastJson 重复使用同一个地址的对象问题。
	 * @param param
	 * @return
	 */
	public static Map<String, Object> cloneMap(Map<String, Object> param) {
		Map<String, Object> ret = new HashMap<String, Object>();
		for (Entry<String, Object> entry : param.entrySet()) {
			ret.put(entry.getKey(), entry.getValue());
		}
		return ret;
	}
}
