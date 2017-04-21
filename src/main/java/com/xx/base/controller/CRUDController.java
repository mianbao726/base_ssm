package com.xx.base.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
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

@Controller
@RequestMapping("/CRUD")
// 中文
public class CRUDController extends BaseController {

	
	//MVC中的C controller 模板
	private static final int templateNo = 1000;
	
	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact
	 *         zhuwj@726@gmail.com)
	 */
	@RequestMapping("/index.html")
	public String ret1(HttpServletRequest request, Model model) throws Exception {
		return "CRUD/index";
	}

	/**
	 * 生成新类 </br>
	 * 1.类名首字母大写表示新生城 ，小写表示追加</br>
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("static-access")
	@RequestMapping("/gen001.html")
	public @ResponseBody String gen001(HttpServletRequest request, Model model) throws Exception {
		Map paramsMap = super.getParams(request);
		paramsMap.put("status_code", "200");
		String target = paramsMap.get("target").toString();
		//生成新类，检查是否需要生成
		genNewClass(target);
		//追加里面的方法
		appendMethods(target);
		return JSONObject.toJSONString(paramsMap);
	}

	/**
	 * 生成新类型
	 * 
	 * projectname.modulename.controllernaem(methods)
	 * 
	 * controllernaem首字母大写才会生成类文件
	 * 
	 * @param info
	 * @return
	 * @throws IllegalAccessException
	 * @throws IllegalArgumentException
	 * @throws InvocationTargetException
	 * @throws NoSuchMethodException
	 * @throws SecurityException
	 * @throws IOException
	 */
	public String genNewClass(String info) throws IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException, IOException {// xx.backend.sss
		//截取类名前的部分字符串  xx.backend.sss(methodA,metohodB) => xx.backend.sss
		info = info.substring(0, info.contains("(")?info.indexOf("("):info.length());
		String[] infos = info.split("\\.");
		if(!containsA2Z(infos[2].substring(0, 1)))//大写字母生成新类，小写字不生成新类
			return "";
		
		//读取模板文件 并 设置目标文件信息
		XXEntity ret = CRUDUtil.rs(templateNo,infos);
		//按照设置写入文件
		CRUDUtil.pw(ret);
		System.out.println(" well done !! ");
		return "";
	}
	
	/**
	 * append methods
	 * 
	 * 特殊参数
	 * NEW => 添加一套表标准的CRUD方法，（NEW = index,add,save,delete,edit,update）
	 * 
	 * @param target
	 * @return
	 * @throws IllegalAccessException
	 * @throws IllegalArgumentException
	 * @throws InvocationTargetException
	 * @throws NoSuchMethodException
	 * @throws SecurityException
	 * @throws IOException
	 */
	public String appendMethods(String target) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException, IOException{
		if (target.contains("(") && target.contains(")")) {//约定如果有()表示需要生成方法
			String methods = target.substring(target.indexOf("(") + 1, target.indexOf(")"));
			if("NEW".equals(methods)){//默认增删改查
				methods="index,add,save,delete,edit,update";
			}
			String[] functions = methods.split(",");
			for (String func : functions) {
				appendMethod(target.substring(0, target.indexOf("(")), func);
			}
		}
		return "";
		
	}

	/**
	 * 生成新方法
	 * 
	 * @param info
	 * @return
	 * @throws IllegalAccessException
	 * @throws IllegalArgumentException
	 * @throws InvocationTargetException
	 * @throws NoSuchMethodException
	 * @throws SecurityException
	 * @throws IOException
	 */
	public String appendMethod(String info, String functionName) throws IllegalAccessException,
			IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException, IOException {// xx.backend.sss
		s02(info, functionName);
		return "";
	}


	
	

	public static void main(String[] args) throws IOException, IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException {
		
//		String target = "asdfsadf";
//		System.out.println(target.substring(0, target.contains("(")?target.indexOf("("):target.length()));
	}
	
	/**
	 * 是否包含大写字母
	 * @param str
	 * @return
	 */
	public static boolean containsA2Z(String str){
		return str.replaceAll("[A-Z]", "?").contains("?");
	}

	static void s02(String info, String functionName) throws IOException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {
		// 写入 新文件
		String[] infos = info.split("\\.");
//		String src = CRUDUtil.getTemplate(templateNo+1);
		String tar = CRUDUtil.getTemplate(templateNo, infos).toString();
		XXEntity ret = CRUDUtil.r(templateNo+1);
		ClassBuilder cb = new XX_Method(functionName, "String", "", functionName, CRUDUtil.lowerCaseFirstCharacter(infos[2]), functionName);
		ret.setTargetFile(tar);
		CRUDUtil.a(ret, cb);
		System.out.println(" well done !! ");
	}

}
