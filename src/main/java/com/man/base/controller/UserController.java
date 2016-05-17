package com.man.base.controller;

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
import com.man.base.service.IUserService;
import com.man.base.util.QMap;

@SuppressWarnings({ "rawtypes", "unchecked" })
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {
	@Resource
	private IUserService userService;

	@RequestMapping("/checkUniqueEmail.do")
	public @ResponseBody String checkUniqueEmail(HttpServletRequest request, Model model) throws Exception {
		Map ret = new HashMap();
		if(userService.checkUniqueEmail(super.getParams(request))<=0){
			ret = new QMap("200");
		}else{
			ret = new QMap("202");
		}
		return JSONObject.toJSONString(ret);
	}
	
	@RequestMapping("/checkUniqueUsername.do")
	public @ResponseBody String checkUniqueUsername(HttpServletRequest request, Model model) throws Exception {
		Map ret = null;
		if(userService.checkUniqueUsername(super.getParams(request))<=0){
			ret = new QMap("200");
		}else{
			ret = new QMap("202");
		}
		return JSONObject.toJSONString(ret);
	}
	
	@RequestMapping("/register.do")
	public @ResponseBody String register(HttpServletRequest request, Model model) throws Exception {
		Map ret = new HashMap();
		userService.register(super.getParams(request));
		return JSONObject.toJSONString(ret);
	}
	
	@RequestMapping("/login.do")
	public @ResponseBody String login(HttpServletRequest request, Model model) throws Exception {
		Map ret = userService.login(super.getParams(request));
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

	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public @ResponseBody String delete(@RequestBody Map param, HttpServletRequest request, HttpServletResponse response) {
		param.put("del_flag", "1");
		Map ret = this.userService.update(param);
		return JSONObject.toJSONString(ret);
	}

	@RequestMapping("/add.do")
	public @ResponseBody String add(HttpServletRequest request) throws Exception {
		Map paramsMap = super.getParams(request);
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
	
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public @ResponseBody String update(@RequestBody Map param, HttpServletRequest request, HttpServletResponse response) {
		Map ret = this.userService.update(param);
		return JSONObject.toJSONString(ret);
	}
}
