package com.xx.base.util;

import java.util.List;

/**
 * @author zhuwj
 * 
 */
public class XX_Method implements ClassBuilder {
	private String method_name;
	private String return_name;
	private String param_name;

	private String request_name;
	private String tail_name;
	private String pack_name;
	private String page_name;

	private XX_Method(String method_name, String return_name, String param_name,
			String request_name, String tail_name, String pack_name,
			String page_name) {
		super();
		this.method_name = method_name;
		this.return_name = return_name;
		this.param_name = param_name;
		this.request_name = request_name;
		this.tail_name = tail_name;
		this.pack_name = pack_name;
		this.page_name = page_name;
	}

	public XX_Method(String method_name, String return_name, String param_name,
			String request_name, String pack_name, String page_name) {
		this(method_name, return_name, param_name, request_name, "html",
				pack_name, page_name);
	}
	
	public static XX_Method getInstance(int templateNo//
			,String method_name,//method_name
			String return_name, //return_name
			String param_name, //param_name
			String request_name, //request_name
			String pack_name, //pack_name
			String page_name//page_name
			){
		switch (templateNo) {
		case 1001:// controller
			return new XX_Method(method_name, return_name, param_name, request_name, "html",
					pack_name, page_name);
		default:
			break;
		}
	 return null;
	}
	

	public String getTail_name() {
		return tail_name;
	}

	public void setTail_name(String tail_name) {
		this.tail_name = tail_name;
	}

	public String getRequest_name() {
		return request_name;
	}

	public void setRequest_name(String request_name) {
		this.request_name = request_name;
	}

	public String getPack_name() {
		return pack_name;
	}

	public void setPack_name(String pack_name) {
		this.pack_name = pack_name;
	}

	public String getPage_name() {
		return page_name;
	}

	public void setPage_name(String page_name) {
		this.page_name = page_name;
	}

	public String getMethod_name() {
		return method_name;
	}

	public void setMethod_name(String method_name) {
		this.method_name = method_name;
	}

	public String getReturn_name() {
		return return_name;
	}

	public void setReturn_name(String return_name) {
		this.return_name = return_name;
	}

	public String getParam_name() {
		return param_name;
	}

	public void setParam_name(String param_name) {
		this.param_name = param_name;
	}

}
