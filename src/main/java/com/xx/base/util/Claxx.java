package com.xx.base.util;

import java.util.List;


public class Claxx implements ClassBuilder{
	private String package_name;
	private List import_name;
	private String requestMapping_name;
	private String class_name;
	
	public Claxx(String package_name, List import_name,
			String requestMapping_name, String class_name) {
		super();
		this.package_name = package_name;
		this.import_name = import_name;
		this.requestMapping_name = requestMapping_name;
		this.class_name = class_name;
	}
	public String getPackage_name() {
		return package_name;
	}
	public void setPackage_name(String package_name) {
		this.package_name = package_name;
	}
	public List getImport_name() {
		return import_name;
	}
	public void setImport_name(List import_name) {
		this.import_name = import_name;
	}
	public String getRequestMapping_name() {
		return requestMapping_name;
	}
	public void setRequestMapping_name(String requestMapping_name) {
		this.requestMapping_name = requestMapping_name;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	
}
