package com.man.base.util;

public class C {
	// admin ID
	public static final String ADMIN_ID = "1";
	// admin ROLE ID
	public static final String ADMIN_ROLE_ID = "1";
	// 图片类型
	public static final String[] IMAGE_TYPE = { ".png", ".jpg" };
	// 资源文件类型
	public static final String[] RESOURCE_TYPE = { ".js", ".css", ".woff" };
	// 过滤文件类型
	public static final String[] RESOURCE_EXCEPT = Util.concat(IMAGE_TYPE, RESOURCE_TYPE);
	// 资源文件过滤表达式
	public static final String RESOURCE_PATTERN = "^/([0-9a-zA-Z]){1,}/([0-9A-Za-z/.-]){0,}(" + Util.buildStr(RESOURCE_EXCEPT, "|") + ")$";

	public static final String[] SPECIAL_REQUEST = { //
			"/login/login.html",//登陆页面
			"/user/checkUniqueUsername.do",//
			"/user/checkUniqueEmail.do",//
			"",//
			"",//
	};
}

