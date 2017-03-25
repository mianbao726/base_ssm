package com.xx.base.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
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
import com.xx.base.util.ReadEntity;
import com.xx.base.util.XX_Method;

@Controller
@RequestMapping("/CRUD")
// 中文
public class CRUDController extends BaseController {
	
	private static final String SOURCE_PACKAGE_01 = "src";
	private static final String SOURCE_PACKAGE_02 = "main";
	private static final String SOURCE_PACKAGE_03 = "java";
	
	private static final String COM = "com";
	
	private static final String XX = "xx";
	private static final String CONTROLLER = "controller";
	
	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact zhuwj@726@gmail.com)
	 */
	@RequestMapping("/index.html")
	public String ret1(HttpServletRequest request, Model model)throws Exception{
		return "CRUD/index";
	}
	
	/**
	 * 生成新类
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/gen001.html")
	public @ResponseBody String gen001(HttpServletRequest request, Model model)throws Exception{
		Map paramsMap = super.getParams(request);
		paramsMap.put("status_code", "200");
		genNewClass(paramsMap.get("target").toString());
		return JSONObject.toJSONString(paramsMap);
	}
	 public String genNewClass(String info) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException, IOException{//xx.backend.sss
		 String[] infos = info.split("\\.");
		 File directory = new File("");//设定为当前文件夹
		 StringBuilder sb = new StringBuilder(directory.getAbsolutePath());
		 sb.append(File.separator);
		 sb.append(SOURCE_PACKAGE_01);
		 sb.append(File.separator);
		 sb.append(SOURCE_PACKAGE_02);
		 sb.append(File.separator);
		 sb.append(SOURCE_PACKAGE_03);
		 sb.append(File.separator);
		 sb.append(COM);
		 sb.append(File.separator);
//		 sb.append(XX);
//		 sb.append(File.separator);
		 sb.append(infos[0]);
		 sb.append(File.separator);
		 sb.append(infos[1]);
		 sb.append(File.separator);
		 sb.append(CONTROLLER);
		 sb.append(File.separator);
		 sb.append(infos[2]+"Controller.java");
		 
		 File f = new File(this.getClass().getResource("").getPath());
		 
		 System.out.println(sb);//获取绝对路径 
		 
		 String src = "/home/zhuwj/git/base_ssm/src/main/java/com/xx/base/template/defaultversion/controller/DefaultController";
		 
		 String tar = sb.toString();
		 
		//写入 新文件
		ReadEntity ret = CRUDUtil.r(src);
		ClassBuilder cb = new Claxx("com."+infos[0]+"."+infos[1]+".controller", null, infos[2], infos[2]+"Controller");
		ret.setTargetFile(tar);
		CRUDUtil.w(ret , cb);
		System.out.println(" well done !! ");
		
		//追加 新方法
		String src_method = "/home/zhuwj/git/base_ssm/src/main/java/com/xx/base/template/defaultversion/controller/methodController";
		
		
		s02(src_method,tar);
		 
		 return "";
	 }
	 
	public static void main(String[] args) throws IOException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {
		String src = "/home/zhuwj/git/base_ssm/src/main/java/com/xx/base/template/defaultversion/controller/DefaultController";
		String tar = "/home/zhuwj/git/base_ssm/src/main/java/com/man/backend/controller"+File.separator+"Dashboard111Controller.java";
		//写入 新文件
		ReadEntity ret = CRUDUtil.r(src);
		ClassBuilder cb = new Claxx("com.xx.backend.controller", null, "dashboard", "DashboardController");
		ret.setTargetFile(tar);
		CRUDUtil.w(ret , cb);
		System.out.println(" well done !! ");
		
		
		//追加 新方法
		String src_method = "/home/zhuwj/git/base_ssm/src/main/java/com/man/base/template/defaultversion/controller/methodController";
		
		
//		s02(src_method,tar);
		
	}
	
	static void s02(String src, String tar) throws IOException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {
		// 写入 新文件
		ReadEntity ret = CRUDUtil.r(src);
		ClassBuilder cb= new XX_Method("getnewone" , "String" , "","dashboard","dashboard","index");
		ret.setTargetFile(tar);
		CRUDUtil.a(ret,cb);
		System.out.println(" well done !! ");
	}
	
}

