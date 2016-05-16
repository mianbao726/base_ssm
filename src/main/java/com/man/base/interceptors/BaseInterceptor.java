package com.man.base.interceptors;

import java.util.Arrays;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.man.base.util.C;
import com.man.base.util.Util;

public class BaseInterceptor implements HandlerInterceptor {

	protected static Logger log = Logger.getLogger(BaseInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		if (Util.exceptReq(request.getRequestURI())) {// 请求
			log.info("request.getRequestURI()  :  " + request.getRequestURI());
			log.info("request.getServletPath()  :  " + request.getServletPath());
			if (Arrays.asList(C.SPECIAL_REQUEST).contains(request.getServletPath())) {// 除外请求
				log.info("除外请求 ---");
				return true;
			} else {
				Map<String, Object> user_permissions = (Map<String, Object>) request.getSession().getAttribute("permissions");
				if (user_permissions.containsKey(request.getRequestURI())) {// can

					return true;
				} else {// can't

					return false;
				}
			}
		} else {// 资源文件全部放过
			return true;
		}
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		// log.info("postHandle ... ... : " + request.getRequestURI());
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

	}

}
