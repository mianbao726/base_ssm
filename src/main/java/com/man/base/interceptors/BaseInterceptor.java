package com.man.base.interceptors;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.man.base.util.C;
import com.man.base.util.Util;

@SuppressWarnings("unchecked")
public class BaseInterceptor implements HandlerInterceptor {

	protected static Logger log = Logger.getLogger(BaseInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		if (Util.exceptReq(request.getRequestURI())) {// request
			if (Arrays.asList(C.SPECIAL_REQUEST).contains(request.getServletPath())) {// except_request
				log.info("except request ---" + request.getServletPath());
				return true;
			} else {
				log.info("normal request ---" + request.getServletPath());
				if (C.dev()) {
					return true;
				} else {
					Map<String, Object> user_permissions = (Map<String, Object>) request.getSession().getAttribute("userMenusMap");
					if (null == user_permissions) {//
						((HttpServletResponse) response).sendRedirect("/" + C.PROJECT_NAME + "/home.html");
						return true;
					}else{
						String role_info = (String) request.getSession().getAttribute("role_info");
						if(role_info.contains("1")){//super user can do everything ,of course
							return true;
						}
						if (user_permissions.containsKey(request.getServletPath().substring(1))) {// can
							return true;
						} else {// can't
							//
							log.info("*** can't request ---" + request.getServletPath());
							return false;
						}
					}
				}
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
