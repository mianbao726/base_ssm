package com.man.base.controller;

import java.util.HashMap;
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

@SuppressWarnings({ "rawtypes", "unchecked" })
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {
	@Resource
	private IUserService userService;

	@RequestMapping("/checkUniqueEmail.do")
	public @ResponseBody String checkUniqueEmail(HttpServletRequest request, Model model) throws Exception {
		Map ret = new HashMap();
		log.info(request.getParameter("user_name"));
		if("sunny@163.com".equals(request.getParameter("user_name"))){
			ret.put("code", "200");
			log.info("bingdo 。！！！");
		}else{
			ret.put("code", "202");
		}
		return JSONObject.toJSONString(ret);
	}
	
	@RequestMapping("/checkUniqueUsername.do")
	public @ResponseBody String checkUniqueUsername(HttpServletRequest request, Model model) throws Exception {
		Map ret = new HashMap();
		log.info(request.getParameter("user_name"));
		if("sunny".equals(request.getParameter("user_name"))){
			ret.put("code", "200");
		}else{
			ret.put("code", "202");
		}
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

	@RequestMapping(value = "/add.do", method = RequestMethod.POST)
	public @ResponseBody String add(@RequestBody Map param, HttpServletRequest request, HttpServletResponse response) {
		param.put("del_flag", "0");
		Map ret = this.userService.insert(param);
		return JSONObject.toJSONString(ret);
	}

	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public @ResponseBody String update(@RequestBody Map param, HttpServletRequest request, HttpServletResponse response) {
		Map ret = this.userService.update(param);
		return JSONObject.toJSONString(ret);
	}
}
