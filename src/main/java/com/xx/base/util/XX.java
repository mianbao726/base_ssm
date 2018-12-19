package com.xx.base.util;

import javax.servlet.http.HttpServletRequest;

public class XX {
	/**
	 * 判断是否是post请求
	 * @param sb
	 * @param context
	 * @return
	 */
	public static boolean isPost(HttpServletRequest request) {
		return C.POST.equals(request.getMethod());

	}
}
