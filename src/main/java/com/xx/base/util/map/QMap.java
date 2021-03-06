package com.xx.base.util.map;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.xx.base.util.C;

/**
 * quick MAP :)
 * 
 * @author zhuwj
 *
 */
public class QMap extends HashMap<Object, Object> {
	
	public boolean status;
	

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}
	
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

	public static void showMap(Map map) {

		Iterator entries = map.entrySet().iterator();

		while (entries.hasNext()) {

			Map.Entry entry = (Map.Entry) entries.next();

			System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue().toString());

		}

	}
}
