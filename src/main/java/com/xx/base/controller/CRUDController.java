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
		
		if(this.containsAZ(target.split("\\.")[2].substring(0, 1)))//如果类名首字母大写，重新生成新类
			genNewClass(target.substring(0, target.contains("(")?target.indexOf("("):target.length()));
		
		/**
		 * 约定如果有()表示需要生成方法
		 */
		if (target.contains("(") && target.contains(")")) {
			String[] functions = target.substring(target.indexOf("(") + 1, target.indexOf(")")).split(",");
			for (String func : functions) {
				appendMethod(target.substring(0, target.indexOf("(")), func);
			}
		} 

		return JSONObject.toJSONString(paramsMap);
	}

	/**
	 * 生成新类型
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
		String[] infos = info.split("\\.");
		if(!containsAZ(infos[2].substring(0, 1)))
			return "";
		String src = getTemplate(0);
		String tar = getTemplate(0, infos).toString();
		// 写入 新文件
		ReadEntity ret = CRUDUtil.r(src);
		ClassBuilder cb = new Claxx("com." + infos[0] + "." + infos[1] + ".controller", null, lowerCaseFirstCharacter(infos[2]),
				upperCaseFirstCharacter(infos[2]) + "Controller");
		ret.setTargetFile(tar);
		CRUDUtil.w(ret, cb);
		System.out.println(" well done !! ");
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

	/**
	 * 获取定制的模板
	 * 
	 * @param c
	 *            0 => controller 1 => controller method
	 * @return
	 */
	static String getTemplate(int c) {
		File directory = new File("");// 设定为当前文件夹
		StringBuilder sb = new StringBuilder(directory.getAbsolutePath());
		switch (c) {
		case 0:// controller
			sb = appendWS(sb, SOURCE_PACKAGE_01);
			sb = appendWS(sb, SOURCE_PACKAGE_02);
			sb = appendWS(sb, SOURCE_PACKAGE_03);
			sb = appendWS(sb, COM);
			sb = appendWS(sb, XX);
			sb = appendWS(sb, "base");
			sb = appendWS(sb, "template");
			sb = appendWS(sb, "defaultversion");
			sb = appendWS(sb, "controller");
			sb = appendWS(sb, "DefaultController");
			break;
		case 1:// method
			sb = appendWS(sb, SOURCE_PACKAGE_01);
			sb = appendWS(sb, SOURCE_PACKAGE_02);
			sb = appendWS(sb, SOURCE_PACKAGE_03);
			sb = appendWS(sb, COM);
			sb = appendWS(sb, XX);
			sb = appendWS(sb, "base");
			sb = appendWS(sb, "template");
			sb = appendWS(sb, "defaultversion");
			sb = appendWS(sb, "controller");
			sb = appendWS(sb, "methodController");
			break;
		default:
			break;
		}
		return sb.toString();
	}

	/**
	 * 添加一个分隔符号
	 * 
	 * @param sb
	 * @return
	 */
	public static StringBuilder appendSeparator(StringBuilder sb) {
		sb.append(File.separator);
		return sb;
	}

	/**
	 * 拼接字符串
	 * 
	 * @param sb
	 * @param context
	 * @return
	 */
	public static StringBuilder appendWS(StringBuilder sb, String context) {
		sb = appendSeparator(sb);
		sb.append(context);
		return sb;

	}

	/**
	 * 首字母大写
	 * 
	 * @return
	 */
	public static String upperCaseFirstCharacter(String str) {
		return str.substring(0, 1).toUpperCase() + str.substring(1);
	}
	
	/**
	 * 首字母小写
	 * 
	 * @return
	 */
	public static String lowerCaseFirstCharacter(String str) {
		return str.substring(0, 1).toLowerCase() + str.substring(1);
	}

	/**
	 * 生成目标文件路径
	 * 
	 * @param c
	 *            类型
	 * @param infos
	 *            用户前段填写的参数
	 * @return
	 */
	static String getTemplate(int c, String[] infos) {
		File directory = new File("");// 设定为当前文件夹
		StringBuilder sb = new StringBuilder(directory.getAbsolutePath());
		switch (c) {
		case 0:// controller
			sb.append(File.separator);
			sb.append(SOURCE_PACKAGE_01);
			sb.append(File.separator);
			sb.append(SOURCE_PACKAGE_02);
			sb.append(File.separator);
			sb.append(SOURCE_PACKAGE_03);
			sb.append(File.separator);
			sb.append(COM);
			sb.append(File.separator);
			sb.append(infos[0]);
			sb.append(File.separator);
			sb.append(infos[1]);
			sb.append(File.separator);
			sb.append(CONTROLLER);
			sb.append(File.separator);
			sb.append(upperCaseFirstCharacter(infos[2]) + "Controller.java");
			break;

		default:
			break;
		}
		return sb.toString();
	}

	public static void main(String[] args) throws IOException, IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException {
		
		String target = "asdfsadf";
		System.out.println(target.substring(0, target.contains("(")?target.indexOf("("):target.length()));
	}
	
	/**
	 * 是否包含大写字母
	 * @param str
	 * @return
	 */
	public static boolean containsAZ(String str){
		return str.replaceAll("[A-Z]", "?").contains("?");
	}

	static void s02(String info, String functionName) throws IOException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {
		// 写入 新文件
		String[] infos = info.split("\\.");
		String src = getTemplate(1);
		String tar = getTemplate(0, infos).toString();
		ReadEntity ret = CRUDUtil.r(src);
		ClassBuilder cb = new XX_Method(functionName, "String", "", functionName, lowerCaseFirstCharacter(infos[2]), functionName);
		ret.setTargetFile(tar);
		CRUDUtil.a(ret, cb);
		System.out.println(" well done !! ");
	}

}
