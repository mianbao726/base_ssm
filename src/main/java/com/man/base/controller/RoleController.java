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
import com.man.base.util.QMap;

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
	
//	@RequestMapping(value = "/getAllRole.do")
//	public @ResponseBody String getAllRole(HttpServletRequest request, HttpServletResponse response) {
//		Map map = super.getParams(request);
//		Map responseMap = new QMap(200);
//		responseMap.put("current_role_id", request.getSession());
//		responseMap.put("data", roleService.getAllRole(map));
//		return JSONObject.toJSONString(responseMap);
//	}
	
	@RequestMapping(value = "/getAllRole.do", method = RequestMethod.POST)
	public @ResponseBody String getAllRole(HttpServletRequest request, HttpServletResponse response) {
		Map map = super.getParams(request);
		Map<String,Object> responseMap = new HashMap<String, Object>();
		responseMap.put("status_code", "200");
		responseMap.put("error_msg", "");
		responseMap.put("data", roleService.getAllRole(map));
		return JSONObject.toJSONString(responseMap);
	}
	
	@RequestMapping(value = "/addModule.do", method = RequestMethod.POST)
	public @ResponseBody String addModule(HttpServletRequest request, HttpServletResponse response) {
		Map map = super.getParams(request);
		Map<String,Object> responseMap = new HashMap<String, Object>();
		responseMap.put("error_msg", "");
		responseMap.put("status_code", "200");
		responseMap.put("id", moduleService.add(map));
		return JSONObject.toJSONString(responseMap);
	}
	
	@RequestMapping(value = "/deleteModule.do", method = RequestMethod.POST)
	public @ResponseBody String deleteModule(HttpServletRequest request, HttpServletResponse response) {
		Map map = super.getParams(request);
		Map<String,Object> responseMap = new HashMap<String, Object>();
		responseMap.put("error_msg", "");
		responseMap.put("status_code", "200");
		responseMap.put("rows", moduleService.del(map));
		return JSONObject.toJSONString(responseMap);
	}
	
	@RequestMapping(value = "/getPermissonInfo.do", method = RequestMethod.POST)
	public @ResponseBody String getPermissonInfo(HttpServletRequest request, HttpServletResponse response) {
		Map map = super.getParams(request);
		Map<String,Object> responseMap = new HashMap<String, Object>();
		responseMap.put("error_msg", "");
		responseMap.put("status_code", "200");
		responseMap.put("obj", moduleService.getPermissonInfo(map));
		return JSONObject.toJSONString(responseMap);
	}
	
	@RequestMapping(value = "/updateModule.do", method = RequestMethod.POST)
	public @ResponseBody String updateModule(HttpServletRequest request, HttpServletResponse response) {
		Map map = super.getParams(request);
		Map<String,Object> responseMap = new HashMap<String, Object>();
		responseMap.put("error_msg", "");
		responseMap.put("status_code", "200");
		responseMap.put("rows", moduleService.update(map));
		return JSONObject.toJSONString(responseMap);
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
	
	@RequestMapping(value = "/addRole.do", method = RequestMethod.POST)
	public @ResponseBody String addRole(HttpServletRequest request, HttpServletResponse response) {
		Map<String,Object> map = super.getParams(request);
		Map responseMap = new QMap(200);
		responseMap.put("id",  roleService.add(map));
		return JSONObject.toJSONString(responseMap);
	}
	
	@RequestMapping(value = "/updateRole.do", method = RequestMethod.POST)
	public @ResponseBody String updateRole(HttpServletRequest request, HttpServletResponse response) {
		Map<String,Object> map = super.getParams(request);
		Map responseMap = new QMap(200);
		responseMap.put("id", roleService.update(map));
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
		map.put("roleid", request.getParameter("roleid"));
		Map<String,Object> responseMap = new HashMap<String, Object>();
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		list = moduleService.getWebModuleTree(map);
		responseMap.put("status_code", "200");
		responseMap.put("data_list", list);
		responseMap.put("error_msg", "");
		return JSONObject.toJSONString(responseMap);
	}
	
	
	
	
}
