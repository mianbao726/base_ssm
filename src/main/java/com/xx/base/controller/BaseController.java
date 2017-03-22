package com.xx.base.controller;

import java.io.PrintWriter;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSONObject;
import com.xx.base.util.C;
import com.xx.base.util.QMap;
import com.xx.base.util.TimestampTool;

/**
 * It's about to fly
 * @author zhuwj
 *
 */
@Controller
@SuppressWarnings({ "rawtypes" })
public class BaseController {
	protected static Logger log = Logger.getLogger(BaseController.class);
	public HttpServletResponse response;// response相应对象

	public HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	/**
	 * 以流的形式向前台输出
	 * 
	 * @param str
	 */
	public void responseTxt(String str) {
		try {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter pw = response.getWriter();
			pw.write(str);
			pw.flush();
			pw.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 显示全部参数
	 * 
	 * @param request
	 */
	protected void showParams(HttpServletRequest request) {
		Enumeration rnames = request.getParameterNames();
		for (Enumeration e = rnames; e.hasMoreElements();) {
			String thisName = e.nextElement().toString();
			String thisValue = request.getParameter(thisName);
//			System.out.println(thisName + "-------" + thisValue);
		}
	}

	/**
	 * 返回全部参数
	 * 
	 * @param request
	 */
	
	protected Map<String, Object> getParams(HttpServletRequest request) {
//		System.out.println("--param start ...");
//		QMap.showMap(request.getParameterMap());
//		System.out.println("--param end ...");
		Map<String, Object> paramsMap = null;
		String paramsStr = request.getParameter("params");
		if (paramsStr != null && !"".equals(paramsStr) && !"null".equals(paramsStr)) {
			paramsMap = JSONObject.parseObject(paramsStr);
		} else {
			paramsMap = new HashMap<String, Object>();
		}
		//默认删除标志
		paramsMap.put(C.DEL_FLAG, C.PARAM_DATE_UD);
		//系统时间
		paramsMap.put(C.PARAM_DATE, TimestampTool.parseDateYYYYMMDDHHMMSS(new Date()));
		if(null != request.getSession().getAttribute("userInfo") ){
			paramsMap.put(C.PARAM_CURRENT_USER_ID, ((Map)request.getSession().getAttribute("userInfo")).get("id"));
			paramsMap.put(C.PARAM_CURRENT_USER_NAME, ((Map)request.getSession().getAttribute("userInfo")).get("username"));
		}else{
			paramsMap.put(C.PARAM_CURRENT_USER_ID, -1);
			paramsMap.put(C.PARAM_CURRENT_USER_NAME, -1);
		}
		return paramsMap;
	}
}
