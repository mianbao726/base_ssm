package com.xx.base.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.xx.base.util.CRUDUtil;
import com.xx.base.util.ClassBuilder;
import com.xx.base.util.Claxx;
import com.xx.base.util.XXEntity;
import com.xx.base.util.XX_Method;
import com.xx.base.util.map.QMap;

@Controller
@RequestMapping("/example")
// 中文
public class ExampleControllerbackup extends BaseController {

	/**
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getdata.html")
	public @ResponseBody
	String getdata(HttpServletRequest request, Model model) throws Exception {
		Map ret = null;
		ret = new QMap("200");
		List<Map<String,Object>> data = new ArrayList<Map<String,Object>>();
		int count = 200;//99999 => 20s  9999
		for(int i = 0 ; i < count ;i++){
			Map<String,Object> m1 = new HashMap<String,Object>(); 
			m1.put("street", "总问_"+i);
			data.add(m1);
		}
		ret.put("data", data);
		ret.put("recordsTotal", Integer.valueOf(count));
		ret.put("recordsFiltered", Integer.valueOf(count));
		return JSONObject.toJSONString(ret);
	}
	
	
	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj@726@gmail.com)
	 */
	@RequestMapping("/index.html")
	public String ret1(HttpServletRequest request, Model model) throws Exception {
		return "example/index";
	}
}
