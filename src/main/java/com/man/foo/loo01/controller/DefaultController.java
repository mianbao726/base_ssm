package com.man.foo.loo01.controller;

import java.io.IOException;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.man.base.controller.BaseController;

/**
 * 
 * @author generate by www.whatgoogle.com (ps : some question? contact zhuwj@726@gmail.com)
 */
@Controller
@RequestMapping("/pack")
// 中文
public class DefaultController extends BaseController {
	public static void main(String[] args) throws IOException {
		System.out.println("hello word");
	}

	/**
	 * @author generate by www.whatgoogle.com (ps : some question? contact zhuwj@726@gmail.com)
	 */
	public void ret(){
		System.out.println("hello word");
	}
	
}
