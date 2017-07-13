/*
 * Copyright (c) 2017, 2017, WHATGOOGLE and/or its affiliates. All rights reserved.
 * WHATGOOGLE PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 */
package com.xx.backend.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSONObject;
import com.xx.backend.service.EmployeeService;
import com.xx.base.controller.BaseController;
import com.xx.base.util.XX;
import com.xx.base.util.map.QMap;

/**
 * @author generate by www.whatgoogle.com (ps : some question? contact
 *         zhuwj726@gmail.com)
 */
@Controller
@RequestMapping("/employee")
public class EmployeeController extends BaseController {

	// XXX
	@Resource
	private EmployeeService employeeService;

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@RequestMapping("/index.html")
	public String index(HttpServletRequest request, Model model) throws Exception {
		return "employee/index";
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@RequestMapping("/list.html")
	public @ResponseBody
	String list(HttpServletRequest request, Model model) throws Exception {
		Map ret = new QMap("200");
		ret = employeeService.queryPageForMap(ret);
		return JSONObject.toJSONString(ret);
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@RequestMapping("/create.html")
	public String create(HttpServletRequest request,RedirectAttributes attr, Model model) throws Exception {
		Map paramsMap = super.getParams(request);
		return "employee/create";
	}
	
	@RequestMapping("/update.htm")
	public @ResponseBody
	String update(HttpServletRequest request, Model model) throws Exception {
		Map paramsMap = super.getParams(request);
		paramsMap = employeeService.getInfo(paramsMap);
		return JSONObject.toJSONString(paramsMap);
	}
	
	@RequestMapping("/upload.html")
	public String pic(HttpServletRequest request,RedirectAttributes attr, Model model) throws Exception {
		Map paramsMap = super.getParams(request);
		return "employee/upload";
	}
	
	@RequestMapping("/form_upload1.html")
	public String form_upload(HttpServletRequest request,RedirectAttributes attr, Model model) throws Exception {
		Map paramsMap = super.getParams(request);
		return "employee/upload";
	}
	
	@RequestMapping(value = "/form_upload2.html")  
    public @ResponseBody
	String upload(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request, ModelMap model) {  
  
        System.out.println("开始");  
        String path = request.getSession().getServletContext().getRealPath("upload");  
        String fileName = file.getOriginalFilename();  
//        String fileName = new Date().getTime()+".jpg";  
        System.out.println(path);  
        File targetFile = new File(path, fileName);  
        if(!targetFile.exists()){  
            targetFile.mkdirs();  
        }  
  
        //保存  
        try {  
            file.transferTo(targetFile);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        model.addAttribute("fileUrl", request.getContextPath()+"/upload/"+fileName);  
        Map paramsMap = new QMap(200);
        return JSONObject.toJSONString(paramsMap);
    }  
	
	@RequestMapping("/update.ht")
	public @ResponseBody
	String update(HttpServletRequest request) throws Exception {
		Map paramsMap = super.getParams(request);
		paramsMap = employeeService.updateInfo(paramsMap);
		return JSONObject.toJSONString(paramsMap);
	}
	
	
	
//	@RequestMapping(value = "/form_upload.html", method = { RequestMethod.POST, RequestMethod.GET })
	@RequestMapping("/form_upload.json")
    public @ResponseBody String fileUpload(@RequestParam(value = "file") MultipartFile file,   HttpServletRequest request) {    
            //这里要注意 @RequestParam(value = "file")必须和jsp中的文件上传框的id保持一致，  
            //你jsp中id=“filefile”这里就要用@RequestParam(value = "filefile")  
        Map<String, Object> map = new HashMap<String, Object>();  
//         if (file.isEmpty()) {  
//                  map.put("message", "文件不能为空");  
//             return map;  
//               }  
//                    if (!isTrue) {  
//             map.put("message", "选择正确的文件格式");  
//           return map;  
//              }  
//                    if (file.getSize()>file_size) {  
//                        map.put("message", "文件大小不能超过2M");  
//                       return map;  
//                       }  
         String pathsrv = request.getSession().getServletContext().getRealPath("upload");  
         String fileName = file.getOriginalFilename();  
         String path = pathsrv+"/"+fileName;
        try {  
            FileUtils.copyInputStreamToFile(file.getInputStream(), new File(path));  
            map.put("message", "Y");// 文件上传成功  
        } catch (IOException e) {  
            map.put("message", "N");// 文件上传失败  
        }  
        path = path.replace("\\", "/");  
        map.put("fileName", path);  
        return JSONObject.toJSONString(map);
    }   
	
	
	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@RequestMapping("/create.htm")
	public @ResponseBody
	String create(HttpServletRequest request, Model model) throws Exception {
		Map paramsMap = super.getParams(request);
		Map ret = new QMap("200");
		if (XX.isPost(request) && employeeService.create(paramsMap).status) {
			ret = employeeService.queryPageForMap(ret);
		} 
		return JSONObject.toJSONString(ret);
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@RequestMapping("/delete.html")
	public @ResponseBody
	String delete(HttpServletRequest request, Model model) throws Exception {
		Map paramsMap = super.getParams(request);
		Map ret = employeeService.delete(paramsMap);
		ret = new QMap(200);
		return JSONObject.toJSONString(ret);
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj726@gmail.com)
	 */
	@RequestMapping("/edit.html")
	public String edit(HttpServletRequest request, Model model) throws Exception {
		return "employee/edit";
	}

}
