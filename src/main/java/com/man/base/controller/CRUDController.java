package com.man.base.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.man.base.util.CRUDUtil;
import com.man.base.util.ClassBuilder;
import com.man.base.util.Claxx;
import com.man.base.util.XX_Method;
import com.man.base.util.ReadEntity;

@Controller
@RequestMapping("/CRUD")
// 中文
public class CRUDController extends BaseController {
	public static void main(String[] args) throws IOException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {
		String src = "/home/zhuwj/git/base_ssm/src/main/java/com/man/base/template/defaultversion/controller/DefaultController";
		String tar = "/home/zhuwj/git/base_ssm/src/main/java/com/man/backend/controller/DashboardController.java";
		//写入 新文件
		ReadEntity ret = CRUDUtil.r(src);
		ClassBuilder cb = new Claxx("com.man.backend.controller", null, "dashboard", "DashboardController");
		ret.setTargetFile(tar);
//		CRUDUtil.w(ret , cb);
		System.out.println(" well done !! ");
		
		
		//追加 新方法
		String src_method = "/home/zhuwj/git/base_ssm/src/main/java/com/man/base/template/defaultversion/controller/methodController";
		
		
		s02(src_method,tar);
		
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

