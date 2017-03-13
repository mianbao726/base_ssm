package com.man.base.util;

import java.util.List;

public class Method implements ClassBuilder{
	private String method_name;
	private String return_name;
	private String param_name;
	
	public Method(String method_name, String return_name, String param_name) {
		super();
		this.method_name = method_name;
		this.return_name = return_name;
		this.param_name = param_name;
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
