package com.xx.base.util;

import com.gargoylesoftware.htmlunit.NicelyResynchronizingAjaxController;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlButton;
import com.gargoylesoftware.htmlunit.html.HtmlInput;
import com.gargoylesoftware.htmlunit.html.HtmlPage;

public class testAUTOlogin {
	public static void main(String[] args) throws Exception {
		testAUTOlogin loginDemo = new testAUTOlogin();
		loginDemo.login("your account", "password");// 输入CSDN的用户名，和密码
		
		// https://www.cnblogs.com/cha1r/archive/2013/11/06/3410966.html
		//https://blog.csdn.net/lu8000/article/details/10693091
	}

	/**
	 * 模拟登陆CSDN
	 * 
	 * @param userName
	 *            用户名
	 * @param pwd
	 *            密码
	 * 
	 * **/
	public void login(String userName, String pwd) throws Exception {
		WebClient webClient = new WebClient();  
        webClient.getOptions().setCssEnabled(false);  
        webClient.getOptions().setUseInsecureSSL(false);  
        webClient.setAjaxController(new NicelyResynchronizingAjaxController());  
        //获取页面  
        webClient.getOptions().setJavaScriptEnabled(false);
        
        
        
//      webClient.getOptions().setRedirectEnabled(false);  
      webClient.getOptions().setJavaScriptEnabled(true);  
      webClient.getOptions().setTimeout(10000);  
        
        
        
        
  
		 HtmlPage page = webClient.getPage("http://192.168.1.199:8080/cmcms");    //打开百度
  
        System.out.println("页面文本:"+page.getTitleText());  
  
  
        //获取页面元素  
        HtmlInput htmlInput = page.getElementByName("user_name");
        System.out.println(htmlInput.asText());  
        htmlInput.setValueAttribute("admin");
        System.out.println(htmlInput.asText());  
        
        HtmlInput htmlInput_password = page.getElementByName("password");  
        System.out.println(htmlInput_password.asText());  
        htmlInput_password.setValueAttribute("111111");  
        System.out.println(htmlInput_password.asText());  
        
  
        HtmlButton btn = page.getHtmlElementById("login");
        HtmlPage page2 = btn.click();  
        
        
        String result = page.asXml();  
        String result2 = page2.asXml();  
        //得到的是点击后的网页  
        System.out.println(result.equals(result2)); 
        
  
        System.out.println("页面2:"+page2.getTitleText());  
        
        
        
        //获取页面  
//      String url ="https://www.baidu.com";  
//      HtmlPage page = webClient.getPage(url);  
//
//      System.out.println("页面文本:"+page.getTitleText());  
//
//
//      //获取页面元素  
//      HtmlInput htmlInput = page.getHtmlElementById("kw");
//      System.out.println(htmlInput.asText());  
//      htmlInput.setValueAttribute("admin");
//      htmlInput.focus();   //设置输入焦点
//      htmlInput.type("username123");  //填写值
//      System.out.println(htmlInput.asText());  
//      
////      HtmlButton btn = page.getHtmlElementById("su");
//      HtmlInput btn = page.getHtmlElementById("su");
//      HtmlPage page2 = btn.click();  
//
//      System.out.println("页面2:"+page2.getTitleText());  
		
		
		
//		WebClient webClient =  new WebClient();//创建WebClient
////		webClient.setCssErrorHandler(new SilentCssErrorHandler());  
//        webClient.setAjaxController(new NicelyResynchronizingAjaxController());  
////        webClient.getOptions().setCssEnabled(true);  
////        webClient.getOptions().setRedirectEnabled(false);  
////        webClient.getOptions().setAppletEnabled(false);  
//        webClient.getOptions().setJavaScriptEnabled(true);  
////        webClient.getOptions().setPopupBlockerEnabled(true);  
//        webClient.getOptions().setTimeout(10000);  
//
//		 HtmlPage page = webClient.getPage("http://localhost:8080/base/");    //打开百度
//  
//        System.out.println("页面文本:"+page.getTitleText());  
//        HtmlAnchor btn = page.getHtmlElementById("btn_login");
//        HtmlPage page2 = btn.click();  
//        
//        
//        String result = page.asXml();  
//        String result2 = page2.asXml();  
//        //得到的是点击后的网页  
//        System.out.println(result.equals(result2)); 
//        
//  
//        System.out.println("页面2:"+page2.getTitleText());  
	}
}

