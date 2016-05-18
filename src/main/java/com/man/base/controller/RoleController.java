package com.man.base.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.man.base.service.IModuleService;
import com.man.base.service.IRoleService;

@SuppressWarnings({ "rawtypes", "unchecked" })
@Controller
@RequestMapping("/role")
public class RoleController extends BaseController {
	@Resource
	private IRoleService roleService;
	
	@Resource
	private IModuleService moduleService;
	
	
	@RequestMapping(value = "/getRoles.do", method = RequestMethod.POST)
	public @ResponseBody String getRoles(HttpServletRequest request, HttpServletResponse response) {
		Map page = super.getParams(request);
		request.getParameterMap();
		Map ret = this.roleService.queryPageForMap(page);
		return JSONObject.toJSONString(ret);
	}
	
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public @ResponseBody String delete(HttpServletRequest request, HttpServletResponse response) {
		Map<String,Object> map = super.getParams(request);
		Map<String,Object> responseMap = new HashMap<String, Object>();
		List<Integer> testList = new ArrayList<Integer>();
		testList.add(Integer.parseInt(map.get("id").toString()));
		map.put("ids", testList);
		responseMap.put("error_msg", "");
		responseMap.put("status_code", "200");
		responseMap.put("id", roleService.del(map));
		return JSONObject.toJSONString(responseMap);
	}
	
	@RequestMapping(value = "/getRoleInfo.do", method = RequestMethod.POST)
	public @ResponseBody String getRoleInfo(HttpServletRequest request, HttpServletResponse response) {
		Map<String,Object> map = super.getParams(request);
		Map<String,Object> responseMap = new HashMap<String, Object>();
		responseMap.put("error_msg", "");
		responseMap.put("status_code", "200");
		responseMap.put("info",  roleService.selectOne(map));
		return JSONObject.toJSONString(responseMap);
	}

	@RequestMapping("/au.html")
	public String au(HttpServletRequest request, Model model) throws Exception {
		return "role/au";
	}
	
	@RequestMapping("/index.html")
	public String index(HttpServletRequest request, Model model) throws Exception {
		return "role/index";
	}
	
	
	@RequestMapping(value = "/getWebModuleTree.do", method = RequestMethod.POST)
	public @ResponseBody String getWebModuleTree(HttpServletRequest request, HttpServletResponse response) {
		Map<String,Object> map = super.getParams(request);
		Map<String,Object> responseMap = new HashMap<String, Object>();
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		list = moduleService.getWebModuleTree(map);
		responseMap.put("status_code", "200");
		responseMap.put("data_list", list);
		responseMap.put("error_msg", "");
		return JSONObject.toJSONString(responseMap);
	}
	
	
	
	
}
