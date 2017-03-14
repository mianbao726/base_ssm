package com.man.foo.loo01.controller;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.man.base.controller.BaseController;

/**
 * zhuwj@726@gmail.com
 */
@Controller
@RequestMapping("/pack")
// 中文
public class DefaultController extends BaseController {
//context start
	public static void main(String[] args) throws IOException {
		System.out.println("hello word");
	}
//context end
}
