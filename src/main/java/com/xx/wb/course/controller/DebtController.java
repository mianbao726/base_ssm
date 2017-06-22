package com.xx.wb.course.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.xx.base.controller.BaseController;
import com.xx.base.service.IModuleService;
import com.xx.base.service.IUserService;
import com.xx.base.util.MD5Util;
import com.xx.base.util.map.QMap;
import com.xx.wb.course.service.IDebtService;

@SuppressWarnings({ "rawtypes", "unchecked" })
@Controller
@RequestMapping("/debt")
public class DebtController extends BaseController {
	@Resource
	private IUserService userService;
	@Resource
	private IDebtService debtService;
	
	@Resource
	private IModuleService moduleService;
	
	@RequestMapping("/index_1.html")
	public String index1(HttpServletRequest request, Model model) throws Exception {
		return "debt/index";
	}
	@RequestMapping("/index_2.html")
	public String index2(HttpServletRequest request, Model model) throws Exception {
		return "debt/index2";
	}
	@RequestMapping("/index_3.html")
	public String index3(HttpServletRequest request, Model model) throws Exception {
		return "debt/index3";
	}
	@RequestMapping("/index_4.html")
	public String index4(HttpServletRequest request, Model model) throws Exception {
		return "debt/index4";
	}
	
	@RequestMapping(value = "/index.do", method = RequestMethod.POST)
	public @ResponseBody String index(HttpServletRequest request, HttpServletResponse response) {
		Map page = (Map) JSONObject.parse(request.getParameter("params").toString());
		request.getParameterMap();
		page.put("type", "0");
		Map ret = this.debtService.index(page);
		return JSONObject.toJSONString(ret);
	}
	@RequestMapping(value = "/index2.do", method = RequestMethod.POST)
	public @ResponseBody String index2(HttpServletRequest request, HttpServletResponse response) {
		Map page = (Map) JSONObject.parse(request.getParameter("params").toString());
		request.getParameterMap();
		page.put("type", "1");
		Map ret = this.debtService.index(page);
		return JSONObject.toJSONString(ret);
	}
	@RequestMapping(value = "/index3.do", method = RequestMethod.POST)
	public @ResponseBody String index3(HttpServletRequest request, HttpServletResponse response) {
		Map page = (Map) JSONObject.parse(request.getParameter("params").toString());
		request.getParameterMap();
		page.put("type", "2");
		Map ret = this.debtService.index(page);
		return JSONObject.toJSONString(ret);
	}
	@RequestMapping(value = "/index4.do", method = RequestMethod.POST)
	public @ResponseBody String index4(HttpServletRequest request, HttpServletResponse response) {
		Map page = (Map) JSONObject.parse(request.getParameter("params").toString());
		request.getParameterMap();
		page.put("type", "3");
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
	@RequestMapping("/au2.html")
	public String au2(HttpServletRequest request, Model model) {
		return "debt/au2";
	}
	@RequestMapping("/au3.html")
	public String au3(HttpServletRequest request, Model model) {
		return "debt/au3";
	}
	@RequestMapping("/au4.html")
	public String au4(HttpServletRequest request, Model model) {
		return "debt/au4";
	}
	
	@RequestMapping("/add.do")
	public @ResponseBody String add(HttpServletRequest request) throws Exception {
		Map paramsMap = super.getParams(request);
		paramsMap.put("type", "0");
		debtService.insert(paramsMap);
		paramsMap.put("status_code", "200");
		return JSONObject.toJSONString(paramsMap);
	}
	@RequestMapping("/add2.do")
	public @ResponseBody String add2(HttpServletRequest request) throws Exception {
		Map paramsMap = super.getParams(request);
		paramsMap.put("type", "1");
		debtService.insert(paramsMap);
		paramsMap.put("status_code", "200");
		return JSONObject.toJSONString(paramsMap);
	}
	@RequestMapping("/add3.do")
	public @ResponseBody String add3(HttpServletRequest request) throws Exception {
		Map paramsMap = super.getParams(request);
		paramsMap.put("type", "2");
		debtService.insert(paramsMap);
		paramsMap.put("status_code", "200");
		return JSONObject.toJSONString(paramsMap);
	}
	@RequestMapping("/add4.do")
	public @ResponseBody String add4(HttpServletRequest request) throws Exception {
		Map paramsMap = super.getParams(request);
		paramsMap.put("type", "3");
		debtService.insert(paramsMap);
		paramsMap.put("status_code", "200");
		return JSONObject.toJSONString(paramsMap);
	}
	
	@RequestMapping(value = "/selectOne.do", method = RequestMethod.POST)
	public @ResponseBody String getSearchUserProfiles(@RequestBody Map search, HttpServletRequest request, HttpServletResponse response) {
		Map paramsMap = super.getParams(request);
		Map userInfo = debtService.selectOne(search);
		userInfo.put("hi", paramsMap.get("CURRENT_USER_NAME"));
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
	
	
	@RequestMapping(value = "/target.do", method = RequestMethod.POST)
	public @ResponseBody String target(@RequestBody Map search, HttpServletRequest request, HttpServletResponse response) {
//		Map userInfo = debtService.selectOne(search);
//		return JSONObject.toJSONString(userInfo);
		Map params = super.getParams(request);
		params.putAll(search);
		Map ret = null;
		ret = this.debtService.target(params);
		return JSONObject.toJSONString(ret);
	}
	
	//http://www.cnblogs.com/lr393993507/p/5310121.html
	@RequestMapping(value="/fileUpload")
    public @ResponseBody String addUser(@RequestParam("uuid") String uuid, @RequestParam MultipartFile[] myfiles, HttpServletRequest request, HttpServletResponse response) throws IOException{
		Map ret = new QMap(200);
        //可以在上传文件的同时接收其它参数
        System.out.println("收到用户[" + uuid + "]的文件上传请求");
        //如果用的是Tomcat服务器，则文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\upload\\文件夹中
        //这里实现文件上传操作用的是commons.io.FileUtils类,它会自动判断/upload是否存在,不存在会自动创建
        String realPath = request.getSession().getServletContext().getRealPath("/upload");
        realPath+="/"+UUID.randomUUID().toString();
        //设置响应给前台内容的数据格式
        response.setContentType("text/plain; charset=UTF-8");
        //设置响应给前台内容的PrintWriter对象
//        PrintWriter out = response.getWriter();
        //上传文件的原名(即上传前的文件名字)
        String originalFilename = null;
        //如果只是上传一个文件,则只需要MultipartFile类型接收文件即可,而且无需显式指定@RequestParam注解
        //如果想上传多个文件,那么这里就要用MultipartFile[]类型来接收文件,并且要指定@RequestParam注解
        //上传多个文件时,前台表单中的所有<input type="file"/>的name都应该是myfiles,否则参数里的myfiles无法获取到所有上传的文件
        for(MultipartFile myfile : myfiles){
            if(myfile.isEmpty()){
//                out.print("1`请选择文件后上传");
//                out.flush();
                return JSONObject.toJSONString(ret);
            }else{
                originalFilename = myfile.getOriginalFilename();
                System.out.println("文件原名: " + originalFilename);
                System.out.println("文件名称: " + myfile.getName());
                System.out.println("文件长度: " + myfile.getSize());
                System.out.println("文件类型: " + myfile.getContentType());
                System.out.println("========================================");
                Map params = new HashMap();
                params.put("type", myfile.getContentType());
                params.put("size", myfile.getSize());
                params.put("filename_ori", originalFilename);
                params.put("filename_new", originalFilename);
                params.put("real_path", realPath);
                params.put("del_flag", "0");
                String uuid_pic = UUID.randomUUID().toString();
                params.put("uuid", uuid_pic);
                debtService.uploadFile(params);
                ret.put("uuid", uuid_pic);
                ret.put("filename", originalFilename);
                
                try {
                    //这里不必处理IO流关闭的问题,因为FileUtils.copyInputStreamToFile()方法内部会自动把用到的IO流关掉
                    //此处也可以使用Spring提供的MultipartFile.transferTo(File dest)方法实现文件的上传
                    FileUtils.copyInputStreamToFile(myfile.getInputStream(), new File(realPath, originalFilename));
                } catch (IOException e) {
                    System.out.println("文件[" + originalFilename + "]上传失败,堆栈轨迹如下");
                    e.printStackTrace();
//                    out.print("1`文件上传失败，请重试！！");
//                    out.flush();
                    return JSONObject.toJSONString(ret);
                }
            }
        }
        //此时在Windows下输出的是[D:\Develop\apache-tomcat-6.0.36\webapps\AjaxFileUpload\\upload\愤怒的小鸟.jpg]
        //System.out.println(realPath + "\\" + originalFilename);
        //此时在Windows下输出的是[/AjaxFileUpload/upload/愤怒的小鸟.jpg]
        //System.out.println(request.getContextPath() + "/upload/" + originalFilename);
        //不推荐返回[realPath + "\\" + originalFilename]的值
        //因为在Windows下<img src="file:///D:/aa.jpg">能被firefox显示,而<img src="D:/aa.jpg">firefox是不认的
//        out.print("0`" + request.getContextPath() + "/upload/" + originalFilename);
//        out.flush();
        return JSONObject.toJSONString(ret);
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
