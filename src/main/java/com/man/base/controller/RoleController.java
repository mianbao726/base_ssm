package com.man.base.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.man.base.service.IRoleService;

@SuppressWarnings({ "rawtypes", "unchecked" })
@Controller
@RequestMapping("/role")
public class RoleController extends BaseController {
	@Resource
	private IRoleService roleService;
	@RequestMapping(value = "/getRoles.do", method = RequestMethod.POST)
	public @ResponseBody String getRoles(HttpServletRequest request, HttpServletResponse response) {
		Map page = (Map) JSONObject.parse(request.getParameter("params").toString());
		request.getParameterMap();
		Map ret = this.roleService.queryPageForMap(page);
		return JSONObject.toJSONString(ret);
	}

	
}
