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
		log.info("" + request.getServletPath());
		if (Util.exceptReq(request.getRequestURI())) {// request
			if (Arrays.asList(C.SPECIAL_REQUEST).contains(request.getServletPath())) {// except request
				log.info("except request ---" + request.getServletPath());
				return true;
			} else {
				log.info("normal request ---" + request.getServletPath());
				Map<String, Object> user_permissions = (Map<String, Object>) request.getSession().getAttribute("permissions");
//				if (user_permissions.containsKey(request.getRequestURI())) {// can
//					return true;
//				} else {// can't
//					return false;
//				}
				return true;
			}
		} else {// resource files
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
