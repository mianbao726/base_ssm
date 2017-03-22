package com.xx.base.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.xx.base.service.IModuleService;
import com.xx.base.service.IUserService;
import com.xx.base.util.MD5Util;
import com.xx.base.util.QMap;

@SuppressWarnings({ "rawtypes", "unchecked" })
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {
	@Resource
	private IUserService userService;
	
	@Resource
	private IModuleService moduleService;

	@RequestMapping("/checkUniqueEmail.do")
	public @ResponseBody String checkUniqueEmail(HttpServletRequest request, Model model) throws Exception {
		Map ret = null;
		if (userService.checkUniqueEmail(super.getParams(request)) <= 0) {
			ret = new QMap("200");
		} else {
			ret = new QMap("202");
		}
		return JSONObject.toJSONString(ret);
	}

	@RequestMapping("/checkUniqueUsername.do")
	public @ResponseBody String checkUniqueUsername(HttpServletRequest request, Model model) throws Exception {
		Map ret = null;
		if (userService.checkUniqueUsername(super.getParams(request)) <= 0) {
			ret = new QMap("200");
		} else {
			ret = new QMap("202");
		}
		return JSONObject.toJSONString(ret);
	}

	@RequestMapping("/register.do")
	public @ResponseBody String register(HttpServletRequest request, Model model) throws Exception {
		Map paramsMap = super.getParams(request);
		userService.insert(paramsMap);
		paramsMap.put("status_code", "200");
		return JSONObject.toJSONString(paramsMap);
	}

	@RequestMapping("/getUserMenu.do")
	public @ResponseBody String getUserMenu(HttpServletRequest request, Model model) throws Exception {

		Map<String, Object> map = super.getParams(request);
		Map<String, Object> responseMap = new HashMap<String, Object>();
		// 判断登陆设备类型，1---web,2---android,3---ios
		if (map.get("type") != null) {
			String type = map.get("type").toString();
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			// web获取菜单
			list = moduleService.loadMenuData((List<Map<String, Object>>) request.getSession().getAttribute("userMenus"));
			responseMap.put("status_code", "200");
			responseMap.put("data_list", list);
			responseMap.put("error_msg", "");
		} else {
			responseMap.put("status_code", "505");
			responseMap.put("error_msg", "访问类型未识别");
		}

		Map ret = null;
		return JSONObject.toJSONString(responseMap);
	}
	
	
	@RequestMapping("/menu.do")
	public @ResponseBody String menu(HttpServletRequest request, Model model) throws Exception {

		Map<String, Object> map = super.getParams(request);
		Map<String, Object> responseMap = new HashMap<String, Object>();
		// 判断登陆设备类型，1---web,2---android,3---ios
//		 {id:1,pId:0,cId:1,name:"A"},
		
//		 {id:1,pId:0,cId:1,name:"A"},
//         {id:11,pId:1,cId:4,name:"A1"},
//         {id:12,pId:1,cId:2,name:"A2"},
//         {id:13,pId:1,cId:3,name:"A3"},
//         {id:22,pId:2,cId:2,name:"B2"},    
//         {id:31,pId:3,cId:1,name:"C1"},
//         {id:32,pId:3,cId:2,name:"C2"},
//         {id:33,pId:3,cId:3,name:"C3"},
//         {id:2,pId:0,cId:2,name:"B"},
//         {id:21,pId:2,cId:1,name:"B1"},  
//         {id:36,pId:31,cId:3,name:"C13"},
//         {id:37,pId:36,cId:1,name:"C131"},
//         {id:23,pId:2,cId:3,name:"B3"},
//         {id:3,pId:0,cId:3,name:"C"},
//         {id:34,pId:1,cId:1,name:"C116666"},
//         {id:35,pId:31,cId:2,name:"C12"},  
//         {id:38,pId:37,cId:1,name:"C1311"} 
		Map<String, Object> m1 = new HashMap<>();
		Map<String, Object> m2 = new HashMap<>();
		Map<String, Object> m3 = new HashMap<>();
		m1.put("id", 1);
		m1.put("pId", 0);
		m1.put("cId", 1);
		m1.put("name", "A");
		
		m2.put("id", 11);
		m2.put("pId", 1);
		m2.put("cId", 1);
		m2.put("url", "CRUD/index.html");
		m2.put("name", "代码生成_"+request.getContextPath()+"/CRUD/index.html");
		
		m3.put("id", 12);
		m3.put("pId", 1);
		m3.put("cId", 2);
		m2.put("url", "CRUD/index.html");
		m3.put("name", "A2_"+request.getContextPath()+"/CRUD/index.html");
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		list.add(m1);
		list.add(m3);
		list.add(m2);
		responseMap.put("list", list);
		Map ret = null;
		return JSONObject.toJSONString(responseMap);
	}

	/**
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getUserInfo.do")
	public @ResponseBody String getUserInfo(HttpServletRequest request, Model model) throws Exception {
		Map ret = new QMap(200);
		ret.put("username", ((Map<String, Object>) request.getSession().getAttribute("userInfo")).get("username"));
		return JSONObject.toJSONString(ret);
	}

	@RequestMapping("/login.do")
	public @ResponseBody String login(HttpServletRequest request, Model model) throws Exception {
		Map ret = userService.login(super.getParams(request), request);
		return JSONObject.toJSONString(ret);
	}

	@RequestMapping("/index.html")
	public String index(HttpServletRequest request, Model model) throws Exception {
		return "user/index";
	}

	@RequestMapping("/au.html")
	public String au(HttpServletRequest request, Model model) {
		return "user/au";
	}
	
	@RequestMapping("/pwd.html")
	public String pwd(HttpServletRequest request, Model model) {
		return "user/pwd";
	}
	
	@RequestMapping(value = "/editpwd.do", method = RequestMethod.POST)
	public @ResponseBody String editpwd(@RequestBody Map search, HttpServletRequest request, HttpServletResponse response) {
		Map param = super.getParams(request);
		param.putAll(search);
		Map userInfo = userService.editpwd(param);
		return JSONObject.toJSONString(userInfo);
	}

	@RequestMapping(value = "/selectOne.do", method = RequestMethod.POST)
	public @ResponseBody String getSearchUserProfiles(@RequestBody Map search, HttpServletRequest request, HttpServletResponse response) {
		Map userInfo = userService.selectOne(search);
		return JSONObject.toJSONString(userInfo);
	}

	@RequestMapping(value = "/index.do", method = RequestMethod.POST)
	public @ResponseBody String index(HttpServletRequest request, HttpServletResponse response) {
		Map page = (Map) JSONObject.parse(request.getParameter("params").toString());
		request.getParameterMap();
		Map ret = this.userService.index(page);
		return JSONObject.toJSONString(ret);
	}

	@RequestMapping(value = "/delete.do")
	public @ResponseBody String delete(HttpServletRequest request, HttpServletResponse response) {
		Map ret = null;
		Map param = super.getParams(request);
		param.put("del_flag", "1");
		if(1 == this.userService.delete(param)){
			ret = new QMap(200);
		}else{
			ret = new QMap(202,"操作失败");
		}
		return JSONObject.toJSONString(ret);
	}
	
	@RequestMapping(value = "/pass.do")
	public @ResponseBody String pass(HttpServletRequest request, HttpServletResponse response) {
		Map ret = null;
		Map param = super.getParams(request);
		param.put("status", "1");
		if(1 == this.userService.pass(param)){
			ret = new QMap(200);
		}else{
			ret = new QMap(202,"操作失败");
		}
		return JSONObject.toJSONString(ret);
	}
	
	@RequestMapping(value = "/resetpwd.do")
	public @ResponseBody String resetpwd(HttpServletRequest request, HttpServletResponse response) {
		Map ret = null;
		Map param = super.getParams(request);
		param.put("password", MD5Util.MD5("123123456"));
		if(1 == this.userService.pass(param)){
			ret = new QMap(200);
		}else{
			ret = new QMap(202,"操作失败");
		}
		return JSONObject.toJSONString(ret);
	}
	
	@RequestMapping(value = "/refuse.do")
	public @ResponseBody String refuse(HttpServletRequest request, HttpServletResponse response) {
		Map ret = null;
		Map param = super.getParams(request);
		param.put("status", "0");
		if(1 == this.userService.pass(param)){
			ret = new QMap(200);
		}else{
			ret = new QMap(202,"操作失败");
		}
		return JSONObject.toJSONString(ret);
	}
	
	@RequestMapping("/add.do")
	public @ResponseBody String add(HttpServletRequest request) throws Exception {
		Map paramsMap = super.getParams(request);
		userService.insert(paramsMap);
		paramsMap.put("status_code", "200");
		return JSONObject.toJSONString(paramsMap);
	}

	@RequestMapping("/te.do")
	public @ResponseBody String te(HttpServletRequest request, Model model) throws Exception {
		Map ret = new HashMap();
		ret.put("status_code", "200");
		log.info("te ... ... ");
		return JSONObject.toJSONString(ret);
	}

	@RequestMapping(value = "/update.do")
	public @ResponseBody String update(HttpServletRequest request, HttpServletResponse response) {
		
		Map ret = null;
		Map params = super.getParams(request);
		
		if(1 == this.userService.update(params)){
			ret = new QMap(200);
		}else{
			ret = new QMap(202,"操作失败");	
		}
		return JSONObject.toJSONString(ret);
	}

}
