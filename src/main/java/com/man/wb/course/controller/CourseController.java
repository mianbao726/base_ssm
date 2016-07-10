package com.man.wb.course.controller;

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
import com.man.base.controller.BaseController;
import com.man.base.util.QMap;
import com.man.wb.course.service.ICourseService;

@SuppressWarnings({ "rawtypes", "unchecked" })
@Controller
@RequestMapping("/course")
public class CourseController extends BaseController {
	@Resource
	private ICourseService courseService;

	@RequestMapping(value = "/get.do", method = RequestMethod.POST)
	public @ResponseBody String getCourses(HttpServletRequest request, HttpServletResponse response) {
		Map page = super.getParams(request);
		// System.out.println(request.getParameter("draw"));;
		Map ret = this.courseService.queryPageForMap(page);
		return JSONObject.toJSONString(ret);
	}

	@RequestMapping(value = "/getCount.do", method = RequestMethod.POST)
	public @ResponseBody String getCoursesCount(HttpServletRequest request, HttpServletResponse response) {
		Map page = super.getParams(request);
		// System.out.println(request.getParameter("draw"));;
		List<Map<String, Object>> ret = this.courseService.getCoursesCount(page);
		return JSONObject.toJSONString(ret);
	}
	
	@RequestMapping(value = "/addEN.do", method = RequestMethod.POST)
	public @ResponseBody String addEN(HttpServletRequest request, HttpServletResponse response) {
		Map page = super.getParams(request);
		// System.out.println(request.getParameter("draw"));
		page.put("cid", "1");
		int ret = this.courseService.add(page);
		return JSONObject.toJSONString(ret);
	}
	
	@RequestMapping(value = "/addGEOG.do", method = RequestMethod.POST)
	public @ResponseBody String addGEOG(HttpServletRequest request, HttpServletResponse response) {
		Map page = super.getParams(request);
		// System.out.println(request.getParameter("draw"));;
		page.put("cid", "2");
		int ret = this.courseService.add(page);
		return JSONObject.toJSONString(ret);
	}
	
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public @ResponseBody String delete(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = super.getParams(request);
		Map<String, Object> responseMap = new HashMap<String, Object>();
		List<Integer> testList = new ArrayList<Integer>();
		testList.add(Integer.parseInt(map.get("id").toString()));
		map.put("ids", testList);
		responseMap.put("error_msg", "");
		responseMap.put("status_code", "200");
		responseMap.put("id", courseService.del(map));
		return JSONObject.toJSONString(responseMap);
	}

	@RequestMapping(value = "/addCourse.do", method = RequestMethod.POST)
	public @ResponseBody String addCourse(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = super.getParams(request);
		Map responseMap = new QMap(200);
		responseMap.put("id", courseService.add(map));
		return JSONObject.toJSONString(responseMap);
	}

	@RequestMapping(value = "/updateCourse.do", method = RequestMethod.POST)
	public @ResponseBody String updateCourse(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = super.getParams(request);
		Map responseMap = new QMap(200);
		responseMap.put("id", courseService.update(map));
		return JSONObject.toJSONString(responseMap);
	}

	@RequestMapping(value = "/getCourseInfo.do", method = RequestMethod.POST)
	public @ResponseBody String getCourseInfo(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = super.getParams(request);
		Map<String, Object> responseMap = new HashMap<String, Object>();
		responseMap.put("error_msg", "");
		responseMap.put("status_code", "200");
		responseMap.put("info", courseService.selectOne(map));
		return JSONObject.toJSONString(responseMap);
	}

	@RequestMapping("/au.html")
	public String au(HttpServletRequest request, Model model) throws Exception {
		return "course/au";
	}

	@RequestMapping("/index.html")
	public String index(HttpServletRequest request, Model model) throws Exception {
		return "course/index";
	}

	@RequestMapping("/index_detial.html")
	public String index_detial(HttpServletRequest request, Model model) throws Exception {
		return "course/index_detial";
	}

}
