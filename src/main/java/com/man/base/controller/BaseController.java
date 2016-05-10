package com.man.base.controller;

import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import com.man.base.dao.PageServiceDao;

@Controller
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
}
