package com.xx.wb.course.controller;

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
import com.xx.base.controller.BaseController;
import com.xx.base.service.IModuleService;
import com.xx.base.service.IUserService;
import com.xx.base.util.MD5Util;
import com.xx.base.util.map.QMap;
import com.xx.wb.course.service.IDebtService;

@SuppressWarnings({ "rawtypes", "unchecked" })
@Controller
@RequestMapping("/home")
public class HomeController extends BaseController {
	@Resource
	private IUserService userService;
	@Resource
	private IDebtService debtService;
	
	@Resource
	private IModuleService moduleService;
	
	@RequestMapping("/index.html")
	public String index(HttpServletRequest request, Model model) throws Exception {
		return "home/list";
	}
	
	@RequestMapping(value = "/index.do", method = RequestMethod.POST)
	public @ResponseBody String index(HttpServletRequest request, HttpServletResponse response) {
		Map page = (Map) JSONObject.parse(request.getParameter("params").toString());
		request.getParameterMap();
		Map ret = this.debtService.index(page);
		return JSONObject.toJSONString(ret);
	}
	
	@RequestMapping(value = "/delete.do")
	public @ResponseBody String delete(HttpServletRequest request, HttpServletResponse response) {
		Map ret = null;
		Map param = super.getParams(request);
		param.put("del_flag", "1");
		if(1 == this.debtService.delete(param)){
			ret = new QMap(200);
		}else{
			ret = new QMap(202,"操作失败");
		}
		return JSONObject.toJSONString(ret);
	}
	
	@RequestMapping("/au.html")
	public String au(HttpServletRequest request, Model model) {
		return "debt/au";
	}
	
	@RequestMapping("/add.do")
	public @ResponseBody String add(HttpServletRequest request) throws Exception {
		Map paramsMap = super.getParams(request);
		debtService.insert(paramsMap);
		paramsMap.put("status_code", "200");
		return JSONObject.toJSONString(paramsMap);
	}
	
	@RequestMapping(value = "/selectOne.do", method = RequestMethod.POST)
	public @ResponseBody String getSearchUserProfiles(@RequestBody Map search, HttpServletRequest request, HttpServletResponse response) {
		Map userInfo = debtService.selectOne(search);
		return JSONObject.toJSONString(userInfo);
	}
	
	@RequestMapping(value = "/update.do")
	public @ResponseBody String update(HttpServletRequest request, HttpServletResponse response) {
		
		Map ret = null;
		Map params = super.getParams(request);
		
		if(1 == this.debtService.update(params)){
			ret = new QMap(200);
		}else{
			ret = new QMap(202,"操作失败");	
		}
		return JSONObject.toJSONString(ret);
	}
	
	@RequestMapping("/loadMore.do")
	public @ResponseBody String loadMore(@RequestBody Map search, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map ret = null;
		Map params = super.getParams(request);
		
		//temp start
		if("-1".equals(params.get("CURRENT_USER_NAME").toString())){
			throw new Exception("not login");
		}
		//temp end
		
		params.putAll(search);
		System.out.println(params);
		ret = new QMap(200);
		ret.put("hi", params.get("CURRENT_USER_NAME"));
		ret.putAll(this.debtService.loadMore(params));
		return JSONObject.toJSONString(ret);
	}
	@RequestMapping("/detial.html")
	public String detial(HttpServletRequest request, Model model) {
		return "home/detial";
	}
	@RequestMapping("/alert.html")
	public String alert(HttpServletRequest request, Model model) {
		return "home/alert";
	}

	
	
	
	
	
	
	
	
	
	
	
	

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
		Map ret = null;
		if(1==userService.register(super.getParams(request))){
			ret = new QMap(200);
		}else{
			ret = new QMap(202,"注册失败");
		}
		return JSONObject.toJSONString(ret);
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
	


	@RequestMapping("/te.do")
	public @ResponseBody String te(HttpServletRequest request, Model model) throws Exception {
		Map ret = new HashMap();
		ret.put("status_code", "200");
		log.info("te ... ... ");
		return JSONObject.toJSONString(ret);
	}


}
