package com.xx.base.util;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.Scanner;

import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.gargoylesoftware.htmlunit.NicelyResynchronizingAjaxController;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlAnchor;
import com.gargoylesoftware.htmlunit.html.HtmlButton;
import com.gargoylesoftware.htmlunit.html.HtmlElement;
import com.gargoylesoftware.htmlunit.html.HtmlInput;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import com.xx.base.bank.HFYN;
import com.xx.base.util.htmlUnit.XXWC;

public class testAUTOlogin {
	public static void main(String[] args) throws Exception {
		testAUTOlogin loginDemo = new testAUTOlogin();
//		loginDemo.login("your account", "password");// 输入CSDN的用户名，和密码

		// https://www.cnblogs.com/cha1r/archive/2013/11/06/3410966.html
		//https://blog.csdn.net/lu8000/article/details/10693091

		//https://ask.csdn.net/questions/387366    网银相关
		
//		loginDemo.test();
//		loginDemo.baidupan();
		loginDemo.huifengtest();
//		loginDemo.cmcms();
	}
	
	
	public void test () throws FailingHttpStatusCodeException, MalformedURLException, IOException{
		try (final WebClient webClient = new WebClient()) {
	        final HtmlPage page = webClient.getPage("http://htmlunit.sourceforge.net");
	        System.out.println(page.getTitleText());
	        final String pageAsXml = page.asXml();
	        System.out.println(pageAsXml.contains("<img src=\"images/GargoyleSoftwareLogo.jpg\" alt=\"Gargoyle Software Inc.\"/>"));
	        System.out.println(pageAsXml.contains("<img src=\"images/GargoyleSoftwareLogo.jpg\" alt=\"Gargoyle Software Inc.\"/>"));
	        final String pageAsText = page.asText();
	        System.out.println(pageAsText.contains("Support for the HTTP and HTTPS protocols"));
	    }
	}

	/**
	 * 
	 * **/
	public void login(String userName, String pwd) throws Exception {
		
		WebClient webClient =  new WebClient();//创建WebClient
		webClient.setAjaxController(new NicelyResynchronizingAjaxController());  
		webClient.getOptions().setJavaScriptEnabled(true);  
		webClient.getOptions().setTimeout(10000);  
//		webClient.setCssErrorHandler(new SilentCssErrorHandler());  
//      webClient.getOptions().setCssEnabled(true);  
//      webClient.getOptions().setRedirectEnabled(false);  
//      webClient.getOptions().setAppletEnabled(false);  
//      webClient.getOptions().setPopupBlockerEnabled(true);  

		HtmlPage page = webClient.getPage("http://localhost:9000/base/");    //打开百度
		
		//获得name为"username"的html元素
//		HtmlElement usernameEle = page.getElementByName("username"); 
		//获得id为"password"的html元素
		HtmlElement username = (HtmlElement)page.getElementById("user_name");
		System.out.println(username.asText());
  
        System.out.println("页面文本:"+page.getTitleText());  
        HtmlAnchor btn = page.getHtmlElementById("btn_login");
        HtmlPage page2 = btn.click();  
        
        String result = page.asXml();  
        String result2 = page2.asXml();  
        //得到的是点击后的网页  
        System.out.println(result.equals(result2)); 
        System.out.println("页面2:"+page2.getTitleText());  
	}
	
	
	public void huifengtest()throws Exception{

		//获取WC
		WebClient webClient =  XXWC.getWC();
		
		HtmlPage page = webClient.getPage("http://localhost:9000/base/huifengtest.html");    //汇丰银行网银
		
		//获取全部信息
		
		
		HFYN hfyh = new HFYN(page.getElementsByTagName("table"));
//		for(int i=0;i<elementsByTagName.getLength();i++){
//			DomElement domElement = elementsByTagName.get(i);
//			HtmlTable table = (HtmlTable) domElement;
//			int tar_row=0, tar_column=0;
//			for(HtmlTableRow row:table.getRows()){ // 遍历所有行
//				tar_column=0;
//                for(HtmlTableCell cell:row.getCells()){  // 遍历所有列
//                    if(i==1 && tar_row==1 &&  tar_column == 3){
//                    	System.out.print("============" +cell.asText()+" ==============");
//                    }else{
//                    	System.out.print(cell.asText()+" ");
//                    }
//                    	tar_column++;
//                }
//                System.out.println();
//                tar_row++;
//            }
//		}

	
	}
	
	
	public void baidupan()throws Exception{
		WebClient webClient =  new WebClient();//创建WebClient
		webClient.setAjaxController(new NicelyResynchronizingAjaxController());  
		webClient.getOptions().setJavaScriptEnabled(true);  
		webClient.getOptions().setTimeout(10000);  
		HtmlPage page = webClient.getPage("https://m.anrunjinrong.com/loginAction!loginPage.do");    //打开百度
		HtmlElement username = (HtmlElement)page.getElementById("userName");
		username.type("mianbao");
		
		HtmlElement pwd = (HtmlElement)page.getElementById("password");
		pwd.type("sunny726");
		
		
		System.out.println(username.asText());
  
        System.out.println("页面文本:"+page.getTitleText());  
//        HtmlAnchor btn = page.getHtmlElementById("loginBtn");
        HtmlInput btn = page.getHtmlElementById("loginBtn");
        HtmlPage page2 = btn.click();  
        
        String result = page.asXml();  
        String result2 = page2.asXml();  
        //得到的是点击后的网页  
        System.out.println(result.equals(result2)); 
        System.out.println("页面2:"+page2.getTitleText());  
	}
	
	public void huifengbank()throws Exception{
		//获取WC
		WebClient webClient =  XXWC.getWC();
		
		HtmlPage page = webClient.getPage("https://creditcards.hsbc.com.cn/perbank/");    //汇丰银行网银
		HtmlElement username = (HtmlElement)page.getElementById("username");
		username.type("6251025501847222");
		HtmlElement pwd = (HtmlElement)page.getElementById("qryPassWD");
		pwd.type("726226");
		
		
		System.out.println(username.asText());
  
//        System.out.println("页面文本:"+page.getTitleText());  
//        HtmlAnchor btn = page.getHtmlElementById("loginBtn");
        HtmlInput btn = page.getHtmlElementById("smsbt");
        btn.click();  
        
        
        Scanner sc = new Scanner(System.in);
		 System.out.println("input code ... ...");
		 String scoreRtry = sc.nextLine();

		 HtmlElement smscode = (HtmlElement) page.getElementById("smscode");
		 smscode.type(scoreRtry);
		 
		 HtmlInput login_button = page.getHtmlElementById("login-button");
		 HtmlPage page2 =login_button.click();  
		 String result2 = page2.asXml();
		 System.out.println(result2);
		System.out.println("页面2:" + page2.getTitleText());
	}
	
	
	public void cmcms() throws Exception {
		// 获取WC
		WebClient webClient = XXWC.getWC();
		HtmlPage page = webClient.getPage("http://localhost:8080/cmcms/"); // 市场化首页
		
		
		HtmlElement username = (HtmlElement) page.getElementById("user_name");
		username.type("admin");
		HtmlElement pwd = (HtmlElement) page.getElementById("password");
		pwd.type("zkbr123_987");
		
		
		// System.out.println("页面文本:"+page.getTitleText());
		// HtmlAnchor btn = page.getHtmlElementById("loginBtn");
		// HtmlInput btn = page.getHtmlElementById("login");
		HtmlButton btn = page.getHtmlElementById("login");
		HtmlPage page2 = btn.click();

		// String result = page.asXml();
		String result2 = page2.asXml();
		// 得到的是点击后的网页
		// System.out.println(result.equals(result2));
		System.out.println("页面2:" + page2.getTitleText());
	}
	
}


