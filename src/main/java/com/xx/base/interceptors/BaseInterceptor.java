package com.xx.base.interceptors;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.xx.base.dao.BaseDao;
import com.xx.base.util.C;
import com.xx.base.util.PropertyUtil;
import com.xx.base.util.Util;

@SuppressWarnings("unchecked")
public class BaseInterceptor implements HandlerInterceptor {

	protected static Logger log = Logger.getLogger(BaseInterceptor.class);
	@Resource
	private BaseDao baseDao;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		 String uri = request.getRequestURI();//返回请求行中的资源名称
		  String url = request.getRequestURL().toString();//获得客户端发送请求的完整url
		  String ip = request.getRemoteAddr();//返回发出请求的IP地址
		  String params = request.getQueryString();//返回请求行中的参数部分
		  String host=request.getRemoteHost();//返回发出请求的客户机的主机名
		  int port =request.getRemotePort();//返回发出请求的客户机的端口号。
		  log.info("欢迎访问  我是  :  " + uri);
		  log.info("欢迎访问  我是  :  " + url);
		  log.info("欢迎访问  我是  :  " + ip);
		  log.info("欢迎访问  我是  :  " + host);
		  log.info("欢迎访问  我是  :  " + port);
		log.info("欢迎访问  我是  :  " + request.getRequestURI());
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("ip", ip);
		m.put("url", url);
		baseDao.insert("sys_log.log",m);
		System.out.println(m.get("url"));
		if (Boolean.valueOf(PropertyUtil.getProperty("interceptor"))) {// 总开关 配置在switch.properties
			if (Util.exceptReq(request.getRequestURI())) {// request
				log.info("是请求  非资源文件  :  " + request.getRequestURI());
				if (Arrays.asList(C.SPECIAL_REQUEST).contains(request.getServletPath())) {// except_request  随意访问
					log.info("except request ---" + request.getServletPath());
					return true;
				} else {
					log.info("normal request ---" + request.getServletPath());
					Map<String, Object> user_permissions = (Map<String, Object>) request.getSession().getAttribute("userMenusMap");
					if (null == user_permissions) {//
						((HttpServletResponse) response).sendRedirect("/" + C.PROJECT_NAME + "123");
						return true;
					} else {
						String role_info = (String) request.getSession().getAttribute("role_info");
						if (role_info.contains("1")) {// super user can do everything ,of course
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
			} else {// resource files
				return true;
			}
		} else {
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
