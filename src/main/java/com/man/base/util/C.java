package com.man.base.util;

public class C {
	public static final String PROJECT_NAME = "base";
	public static final String DEFAULT_DASHBOARD = "dashboard.html";
	// admin ID
	public static final String ADMIN_ID = "1";
	// admin ROLE ID
	public static final String ADMIN_ROLE_ID = "1";
	// DEFAULT_ROLE_ID
	public static final String DEFAULT_ROLE_ID = "16";

	// 开发标志 0=>开发中 1=>产品
	public static final String DEV = "1";

	// 图片类型
	public static final String[] IMAGE_TYPE = { ".png", ".jpg" };
	// 资源文件类型
	public static final String[] RESOURCE_TYPE = { ".js", ".css", ".woff" };
	// 过滤文件类型
	public static final String[] RESOURCE_EXCEPT = Util.concat(IMAGE_TYPE, RESOURCE_TYPE);
	// 资源文件过滤表达式
	public static final String RESOURCE_PATTERN = "^/([0-9a-zA-Z]){1,}/([0-9A-Za-z/.-]){0,}(" + Util.buildStr(RESOURCE_EXCEPT, "|") + ")$";

	// 除外请求
	public static final String[] SPECIAL_REQUEST = { //
			"/login.html", // 登陆页面
			"/user/checkUniqueUsername.do", // 验证唯一用户名
			"/user/checkUniqueEmail.do", // 验证唯一邮箱
			"/role/getAllRole.do", //
			"/user/login.do", //
			"/main.html", //
			"/dashboard.html", //
			"/role/index.html", //
			"/user/getUserInfo.do", //
			"/user/getUserMenu.do", //
			"/role/getRoles.do", //
			"/role/au.html", //
			"/role/getRoleInfo.do", //
			"/role/getWebModuleTree.do", //
			"/role/updateRole.do",//
	};
	// 当前时间-KEY
	public static final String PARAM_DATE = "PARAM_DATE";
	// 删除标志-KEY
	public static final String DEL_FLAG = "DEL_FLAG";
	// 未删除标志-VALUE
	public static final String PARAM_DATE_UD = "0";
	// 的那个前登人-id
	public static final String PARAM_CURRENT_USER_ID = "CURRENT_USER_ID";
	// 的那个前登人-id
	public static final String PARAM_CURRENT_USER_NAME = "CURRENT_USER_NAME";

	// STATUS_CODE
	public static final String STATUS_CODE = "status_code";
	// STATUS_CODE
	public static final String STATUS_INFO = "status_info";

	public static boolean dev() {
		return "0".equals(DEV) ? true : false;
	}

}
