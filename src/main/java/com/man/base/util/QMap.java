package com.man.base.util;

import java.util.HashMap;
import java.util.Map;

/**
 * quick MAP :)
 * 
 * @author zhuwj
 *
 */
public class QMap extends HashMap<Object, Object> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public QMap(String status_code, String status_info) {
		this.put(C.STATUS_CODE, status_code);
		this.put(C.STATUS_INFO, status_info);
	}

	public QMap(int status_code, String status_info) {
		this(status_code + "", status_info);
	}

	public QMap(String status_code) {
		this(status_code, "");
	}

	public QMap(int status_code) {
		this(status_code + "");
	}
}
